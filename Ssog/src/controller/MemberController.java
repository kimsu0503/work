package controller;

import java.util.Map;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.MemberDao;

@Controller
public class MemberController {
	@Autowired
	MemberDao mdao;
	@Autowired
	JavaMailSender sender;

	@RequestMapping({ "/", "/index.j" })
	public ModelAndView toIndex() {
		ModelAndView mav = new ModelAndView("t_base");
		mav.addObject("section", "/main");
		return mav;
	}
	
	// 임시컨트롤러
	@RequestMapping("/cart/form.j")
	public ModelAndView cart() {
		ModelAndView mav = new ModelAndView("tw_cart/form");
		return mav;
	}
	//===================================================
	
	@RequestMapping("/member/join.j")
	public ModelAndView join() {
		ModelAndView mav = new ModelAndView("tw_member/join");
		return mav;
	}
	@RequestMapping("/member/joinajax.j")
	public void joinajax(@RequestParam(name = "type") String type, @RequestParam(name = "val") String val, Map map) {
		Map rst = mdao.id_check_repetition(val);
		boolean b = false;
		if(rst != null) {
			b = true;
		}
		if (type.equals("id")) {
			map.put("cid", b);
		} else {
			map.put("cid", b);
		}
	}
	@RequestMapping("/member/join_rst.j")
	public ModelAndView join_rst(@RequestParam Map param, HttpSession session) {
		ModelAndView mav = new ModelAndView("/member/join_rst");
		String address = String.format("%s#%s#%s", param.get("postcode"),param.get("address1"),param.get("address2"));
		param.put("address", address);
		System.out.println(param);
		boolean r;
		if (session.getAttribute("suckey").equals("TT")) {
			r = mdao.join(param);
			if (r == true) {
				session.setAttribute("auth", param.get("id"));
			}
		} else {
			r = false;
		}
		mav.addObject("rst",r);
		return mav;
		
	}
	@RequestMapping("/member/emailaccredit.j")
	@ResponseBody
	public ModelAndView emailaccredit(HttpSession session, @RequestParam Map param) {
		ModelAndView mav = new ModelAndView("member/result");
		MimeMessage msg = sender.createMimeMessage();
		String fu = UUID.randomUUID().toString();
		String sfu = fu.substring(0, 8);
		System.out.println(sfu);
		session.setAttribute("uuid", sfu);
		try {
			InternetAddress from = new InternetAddress("admin");
			msg.setSender(from);
			InternetAddress to = new InternetAddress((String) param.get("email"));
			msg.setRecipient(RecipientType.TO, to);
			msg.setSubject("�솚�쁺�빀�땲�떎");
			String text = "<h1>�븞�뀞�븯�꽭�슂</h1>";
			text += "媛��엯�쓣 �솚�쁺�빀�땲�떎.";
			text += "�씤利앸쾲�샇�뒗 : " + sfu + " �엯�땲�떎.";
			msg.setText(text, "UTF-8", "html");
			sender.send(msg);
			mav.addObject("rst", true);
		} catch (MessagingException e) {
			mav.addObject("rst", false);
			e.printStackTrace();
		}

		return mav;
	}
	@RequestMapping("/member/result.j")
	public ModelAndView join_02(HttpSession session, @RequestParam Map param) {
		ModelAndView mav = new ModelAndView("/member/result");
		String uuid = (String) session.getAttribute("uuid");
		System.out.println("session �뿉 �엳�뜕uuid : " + uuid);
		if (uuid.equals(param.get("contxt"))) {
			mav.addObject("rst", true);
			session.setAttribute("suckey", "TT");
		} else {
			mav.addObject("rst", false);
			session.setAttribute("suckey", "FF");
		}
		return mav;
	}
	
	@RequestMapping("/member/login_rst.j")
	public ModelAndView login_rst(@RequestParam Map param, @RequestParam(name = "keep", required = false) String keep,
			HttpSession session, HttpServletResponse resp) {
		boolean bl = mdao.login(param);
		if (keep != null) {
			Cookie c = new Cookie("keep", (String) param.get("id"));
			c.setMaxAge(60 * 60 * 24 * 7);
			c.setPath("/");
			resp.addCookie(c);
		}
		if (bl == true) {
			session.setAttribute("auth", (String) param.get("id"));
		}
		ModelAndView mav = new ModelAndView("tw_member/login_rst");
		mav.addObject("bl", bl);
		return mav;
	}
	@RequestMapping("/member/logout.j")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}

}
