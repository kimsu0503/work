package controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import model.AdminDao;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminDao ad;

	@RequestMapping("/login.ja")
	public String login() {
		return "/admin/login/login";
	}

	@RequestMapping("/loginExec.ja")
	public String loginExec(HttpSession session, @RequestParam Map<String, Object> params) {
		boolean b = ad.login(params);
		System.out.println("b : "+b);
		if (b) {
			session.setAttribute("admin", (String)params.get("id"));
			System.out.println("session의 admin : "+session.getAttribute("admin"));
			return "redirect:/admin/index.ja";
		} else {
			return "/admin/login/login";
		}
	}

	@RequestMapping({"/","/index.ja"})
	public String main(Map map) {
		// doc = daily order count
		map.put("doc", ad.doc());
		map.put("dpc", ad.dpc());
		map.put("duc", ad.duc());
		map.put("auc", ad.auc());
		map.put("luc", ad.luc());
		System.out.println("main 입장");
		return "ad_main";
	}
	
	@RequestMapping("/management.ja")
	public String management(Map map){
		map.put("section", "/management/information/company");
		return "ad_management";
	}
	
	@RequestMapping("/member.ja")
	public String member(Map map){
		map.put("section", "/member_user/user_list");
		return "ad_member";
	}
	
}