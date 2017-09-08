package controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import model.MemberDao;
import model.MyinfoDao;
import paging.Paging;

@Controller
@RequestMapping("/member")
public class MyinfoController {
	@Autowired
	MemberDao mmdao;
	@Autowired
	MyinfoDao mdao;
	@Autowired
	ServletContext application;
	@Autowired 
	Paging paging;

	public Map init(HttpSession session) {
		String id = (String) session.getAttribute("auth");
		Map grade = mdao.usergrade(id);
		Map info = mmdao.id_check_repetition(id);
		Map map = new HashMap<>();
		map.put("id", id);
		map.put("grade", grade);
		map.put("info", info);
		return map;
	}

	@RequestMapping("/myinfo/info.j")
	public ModelAndView info(HttpSession session) {
		Map init = init(session);
		List<Map> llist = mdao.orderlist((String) init.get("id"));
		List<Map> qlist = mdao.qanda((String) init.get("id"));
		List<Map> clist = mdao.counsel((String) init.get("id"));
		ModelAndView mav = new ModelAndView("t_el2");
		mav.addObject("section", "member/myinfo/info");
		mav.addObject("grade", init.get("grade"));
		mav.addObject("memberinfo", init.get("info"));
		mav.addObject("llist", llist);
		mav.addObject("qlist", qlist);
		mav.addObject("clist", clist);
		return mav;
	}

	@RequestMapping("/myinfo/popup_grade.j")
	public ModelAndView popup() {
		ModelAndView mav = new ModelAndView("member/myinfo/popup_grade");
		return mav;
	}

	@RequestMapping("/myinfo/couponlist.j")
	public ModelAndView couponlist(HttpSession session) {
		Map init = init(session);
		ModelAndView mav = new ModelAndView("t_el2");
		mav.addObject("section", "member/myinfo/couponlist");
		mav.addObject("grade", init.get("grade"));
		mav.addObject("memberinfo", init.get("info"));
		return mav;
	}

	@RequestMapping("/myinfo/save.j")
	public ModelAndView save(HttpSession session) {
		Map init = init(session);
		Map info = mmdao.id_check_repetition((String) init.get("id"));
		ModelAndView mav = new ModelAndView("t_el2");
		mav.addObject("section", "member/myinfo/save");
		mav.addObject("grade", init.get("grade"));
		mav.addObject("memberinfo", init.get("info"));
		mav.addObject("memberinfo", info);
		return mav;
	}

	@RequestMapping("/myinfo/counsel.j")
	public ModelAndView counsel(HttpSession session, @RequestParam(name="p", defaultValue="1") Integer p) {
		Map init = init(session);
		List<Map> clist = mdao.counselAll((String) init.get("id"));
		ModelAndView mav = new ModelAndView("t_el2");
		mav.addObject("section", "member/myinfo/counsel");
		mav.addObject("grade", init.get("grade"));
		mav.addObject("memberinfo", init.get("info"));
		mav.addObject("clist", clist);
		paging.setDefaultSetting(10, 5);
		paging.setNumberOfRecords(mdao.counsel_cnt());
		System.out.println("count : "+mdao.counsel_cnt());
		Map bt = paging.calcBetween(p);
		Map pg = paging.calcPaging(p, mdao.counsel_cnt());
		mav.addObject("pg", pg);
		List<Map> page = mdao.counselpage(bt);
		mav.addObject("page", page);
		return mav;
	}

	@RequestMapping("/myinfo/qna.j")
	public ModelAndView qna(HttpSession session,@RequestParam(name="p", defaultValue="1") Integer p) {
		Map init = init(session);
		List<Map> qlist = mdao.qnaAll((String) init.get("id"));
		ModelAndView mav = new ModelAndView("t_el2");
		paging.setDefaultSetting(2, 5);
		paging.setNumberOfRecords(mdao.qna_cnt());
		System.out.println(mdao.qna_cnt()); 
		Map bt = paging.calcBetween(p);
		Map pg = paging.calcPaging(p, mdao.qna_cnt());
		System.out.println("bt:"+bt);
		System.out.println("pg:"+pg);
		mav.addObject("pg", pg);
		List<Map> page = mdao.qnapage(bt);
		mav.addObject("page", page);
		mav.addObject("section", "member/myinfo/qna");
		mav.addObject("grade", init.get("grade"));
		mav.addObject("memberinfo", init.get("info"));
		mav.addObject("qlist", qlist);
		return mav;
	}

	@RequestMapping("myinfo/orderlist.j")
	public ModelAndView orderlist(HttpSession session) {
		Map init = init(session);
		List<Map> llist = mdao.orderlist((String) init.get("id"));
		ModelAndView mav = new ModelAndView("t_el2");
		mav.addObject("section", "member/myinfo/orderlist");
		mav.addObject("grade", init.get("grade"));
		mav.addObject("memberinfo", init.get("info"));
		mav.addObject("llist", llist);
		return mav;

	}

	@RequestMapping("/myinfo/info_revise.j")
	public ModelAndView inforevise(HttpSession session) {
		Map init = init(session);
		Map info = mmdao.id_check_repetition((String) init.get("id"));
		Map service = mdao.service_ck((String) init.get("id"));
		String phone1 = info.get("PHONE").toString().substring(0, 3);
		String phone2 = info.get("PHONE").toString().substring(3, 7);
		String phone3 = info.get("PHONE").toString().substring(7, 11);
		info.put("phone1", phone1);
		info.put("phone2", phone2);
		info.put("phone3", phone3);
		info.put("ck_sms", (String) service.get("SMS"));
		info.put("ck_email", (String) service.get("EMAIL"));
		info.put("ck_refresh", (String) service.get("REFRESH"));
		String mail = (String) info.get("EMAIL");
		int idx = mail.indexOf("@");
		String email1 = mail.substring(0, idx);
		String email2 = mail.substring(idx + 1);
		info.put("email1", email1);
		info.put("email2", email2);
		String address = (String) info.get("ADDRESS");
		String[] spaddress = address.split("!");
		System.out.println("test0" + spaddress[0]);
		System.out.println("test1" + spaddress[1]);
		System.out.println("test2" + spaddress[2]);
		info.put("postcode", spaddress[0]);
		info.put("address1", spaddress[1]);
		info.put("address2", spaddress[2]);
		ModelAndView mav = new ModelAndView("t_el2");
		mav.addObject("section", "member/myinfo/info_revise");
		mav.addObject("grade", init.get("grade"));
		mav.addObject("memberinfo", init.get("info"));
		mav.addObject("memberinfo", info);
		return mav;
	}

	@RequestMapping("/myinfo/info_revise_rst.j")
	@ResponseBody
	public boolean info_revise(HttpSession session, @RequestParam Map param) {
		Map init = init(session);
		param.put("id", (String) init.get("id"));
		System.out.println(param);
		boolean inre = false;
		inre = mdao.info_revise(param);
		System.out.println(inre);
		return inre;
	}

	@RequestMapping("/myinfo/leave.j")
	public ModelAndView leave(HttpSession session) {
		Map init = init(session);
		Map info = mmdao.id_check_repetition((String) init.get("id"));
		List<Map> reason = mmdao.leavereason();
		ModelAndView mav = new ModelAndView("t_el2");
		mav.addObject("section", "member/myinfo/leave");
		mav.addObject("grade", init.get("grade"));
		mav.addObject("memberinfo", init.get("info"));
		mav.addObject("memberinfo", info);
		mav.addObject("reason", reason);
		return mav;
	}

	@RequestMapping("/myinfo/leave_rst.j")
	@ResponseBody
	public boolean leave_rst(HttpSession session, @RequestParam Map param) {
		System.out.println("실해");
		Map init = init(session);
		param.put("id", (String) init.get("id"));
		System.out.println(param);
		boolean bl = false;
		boolean write = mmdao.leavewrite(param);
		if (write == true) {
			if (mmdao.leavemember((String) init.get("id")) == true) {
				bl = true;
			}
		}
		return bl;

	}

	@RequestMapping("/myinfo/userpass.j")
	public ModelAndView userpass(HttpSession session) {
		Map init = init(session);
		Map info = mmdao.id_check_repetition((String) init.get("id"));
		ModelAndView mav = new ModelAndView("t_el2");
		mav.addObject("section", "member/myinfo/userpass");
		mav.addObject("grade", init.get("grade"));
		mav.addObject("memberinfo", init.get("info"));
		mav.addObject("memberinfo", info);
		return mav;
	}

	@RequestMapping("/myinfo/userpass_rst.j")
	@ResponseBody
	public boolean userpassrevise(HttpSession session, @RequestParam Map param) {
		Map init = init(session);
		param.put("id", (String) init.get("id"));
		boolean bl = false;
		boolean pass = mmdao.login(param);
		System.out.println("cont pass : " + pass);
		if (pass == true) {
			mdao.userpassrevise(param);
			bl = true;
			session.invalidate();
		} else {
		}
		return bl;
	}

	@RequestMapping("/myinfo/counsel_detail.j")
	public ModelAndView counseldetail(HttpSession session) {
		String id = (String) session.getAttribute("auth");
		Map info = mmdao.id_check_repetition(id);
		List<Map> cate = mdao.counselcate();
		ModelAndView mav = new ModelAndView("t_el3");
		mav.addObject("section", "member/myinfo/counsel_detail");
		mav.addObject("memberinfo", info);
		mav.addObject("cate", cate);
		return mav;
	}

	@RequestMapping("/myinfo/counsel_rst.j")
	public String counsel_rst(@RequestParam Map param, @RequestParam(name = "f") MultipartFile f, HttpSession session,
			Map map) throws IllegalStateException, IOException {
		String fu = UUID.randomUUID().toString();
		map.put("id", (String) session.getAttribute("auth"));
		map.put("cate", param.get("cate"));
		map.put("title", param.get("title"));
		map.put("content", param.get("content"));
		map.put("fileuuid", fu);
		mdao.counselup(map);
		String path = application.getRealPath("/resource/img_counsel");
		File dir = new File(path);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		boolean rst = false;
		File dst = new File(dir, fu);
		if (dst.exists())
			dst.delete();
		f.transferTo(dst);
		rst = true;
		return "redirect:/member/myinfo/counsel.j";
	}
}
