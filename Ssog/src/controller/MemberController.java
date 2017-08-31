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

	@RequestMapping("/member/join.j")
	public ModelAndView join() {
		ModelAndView mav = new ModelAndView("tw_member/join");
		return mav;
	}
	@RequestMapping("/member/joinajax.j")
	public void joinajax(@RequestParam(name = "type") String type, @RequestParam(name = "val") String val, Map map) {
		System.out.println("t"+type);
		System.out.println("v"+val);
		Map rst = mdao.id_check_repetition(val);
		boolean b = false;
		if(rst != null) {
			b = true;
		}
		if (type.equals("id")) {
			map.put("cid", b);
			System.out.println(map);
		} else {
			map.put("cid", b);
			System.out.println(map);
		}
	}
	@RequestMapping("/member/join_rst.j")
	public ModelAndView join_rst(@RequestParam Map param, HttpSession session) {
		ModelAndView mav = new ModelAndView("/member/join_rst");
		String address = String.format("%s %s %s", param.get("postcode"),param.get("address1"),param.get("address2"));
		System.out.println(address);
		param.put("address", address);
		System.out.println(param);
		boolean r;
		if (session.getAttribute("suckey").equals("TT")) {
			r = mdao.join(param);
			System.out.println("controller r:"+r);
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
		System.out.println("만들어진uuid : " + sfu);
		System.out.println("Email : " + param.get("email"));
		session.setAttribute("uuid", sfu);
		try {
			InternetAddress from = new InternetAddress("admin");
			msg.setSender(from);
			InternetAddress to = new InternetAddress((String) param.get("email"));
			msg.setRecipient(RecipientType.TO, to);
			msg.setSubject("환영합니다");
			String text = "<h1>안녕하세요</h1>";
			text += "가입을 환영합니다.";
			text += "인증번호는 : " + sfu + " 입니다.";
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
		System.out.println("session 에 있던uuid : " + uuid);
		System.out.println("내가 입력한uuid : " + param.get("contxt"));
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
		System.out.println(param);
		boolean bl = mdao.login(param);
		System.out.println(bl);
		if (keep != null) {
			Cookie c = new Cookie("keep", (String) param.get("id"));
			c.setMaxAge(60 * 60 * 24 * 7);
			c.setPath("/");
			resp.addCookie(c);
		}
		if (bl == true) {
			System.out.println("로그인성공");
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
