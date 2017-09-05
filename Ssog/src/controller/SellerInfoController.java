package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.SellerInfoDao;


@Controller
@RequestMapping("/seller")
public class SellerInfoController {
	@Autowired
	SellerInfoDao sdao;
	
	@RequestMapping("/main.j")
	public ModelAndView toIndex() {
		ModelAndView mav = new ModelAndView("t_el_seller");
		mav.addObject("section", "seller/main");
		return mav;
	}

	@RequestMapping("/join.j")
	public ModelAndView join(@RequestParam Map map) {
		ModelAndView mav = new ModelAndView("t_el_seller");
		mav.addObject("section", "seller/join");
		return mav;
	}
	
	//회원가입에서 ID, 계좌번호 중복체크
	@RequestMapping("/joinAjax.j")
	@ResponseBody
	public Map joinajax(@RequestParam(name = "type") String type, @RequestParam(name = "val") String val) {
		boolean flag = false;
		if (type.equals("id")) {
			flag = (sdao.overlapChk(val, "id")==null)? true : false;
		} else {
			flag = (sdao.overlapChk(val, "account")==null)? true : false;
		}
		Map map = new HashMap<>();
		map.put("join_check", flag);
		return map;
	}
	
	@RequestMapping("/alert/join_rst.j")
	public ModelAndView join_rst(@RequestParam Map param, HttpSession session) {
		ModelAndView mav = new ModelAndView("t_el_seller");
		boolean b = sdao.join(param);
		if(b) {
			session.setAttribute("seller_id", (String)param.get("id"));
		} 
		mav.addObject("rst", b);
		mav.addObject("section", "seller/main");
		return mav;
	}
	
	@RequestMapping("/alert/login_rst.j")
	public ModelAndView login_rst(@RequestParam Map param, @RequestParam(name = "keep", required = false) String keep,
			HttpSession session, HttpServletResponse resp) {
		System.out.println(param);
		boolean rst = sdao.login(param);
		System.out.println(rst);
			
		if(rst == true){
			System.out.println("로그인성공");
			session.setAttribute("seller_id", (String) param.get("id"));
			
			if (keep != null) {
				Cookie c = new Cookie("keep", (String) param.get("id"));
				c.setMaxAge(60 * 60 * 24 * 7);
				c.setPath("/");
				resp.addCookie(c);
			}
		}
		ModelAndView mav = new ModelAndView("t_el_seller");
		mav.addObject("section", "seller/main");
		mav.addObject("rst", rst);
		return mav;
	}
	
	
	@RequestMapping("/logout.j")
	public String logout(HttpSession session, HttpServletResponse response){
		session.invalidate();
			Cookie c = new Cookie("keep", null);
			c.setPath("/");
			c.setMaxAge(0);
			response.addCookie(c);
		return "redirect:/";
	}
	
	//회원탈퇴
	@RequestMapping("/delete.j")
	public String delete(HttpSession session, HttpServletResponse response){
		String id = (String)session.getAttribute("seller_id");
		boolean rst = sdao.delete(id);
		if(rst) {
			session.invalidate();
				Cookie c = new Cookie("keep", null);
				c.setPath("/");
				c.setMaxAge(0);
				response.addCookie(c);
			return "redirect:/";
		} else {
			return "회원 탈퇴 실패";
		}
	}
	
	//ID, 비밀번호 찾기
	@RequestMapping("/find.j")
	public ModelAndView find() {
		ModelAndView mav = new ModelAndView("t_el_seller");
		mav.addObject("section", "seller/find");
		return mav;
	}
	
	@RequestMapping("/find_ok.j")
	public ModelAndView find_ok(@RequestParam(name="account", required = false) String account) {
		ModelAndView mav = new ModelAndView("t_el_seller");
			Map map = sdao.overlapChk(account, "account");
				String id =  sdao.change((String)map.get("ID"));
				String pwd = sdao.change((String)map.get("PASS"));
		mav.addObject("id", id);
		mav.addObject("pwd", pwd);
		mav.addObject("section", "seller/find_ok");
		return mav;
	}
	
	//비밀번호 입력
	@RequestMapping("/pass.j")
	public ModelAndView pass() {
		ModelAndView mav = new ModelAndView("t_el_seller");
		mav.addObject("section", "seller/pass");
		return mav;
	}
	
	//정보보기
	@RequestMapping("/info.j")
	public ModelAndView info(HttpSession session) {
		ModelAndView mav = new ModelAndView("t_el_seller");
			String id = (String)session.getAttribute("seller_id");
			Map<String,Object> map = sdao.overlapChk(id, "id");
			map.put("id", id);
		mav.addObject("map", map);
		mav.addObject("section", "seller/info"); 
		return mav;
	}
	
	//정보 수정 폼
	@RequestMapping("/info_edit.j")
	public ModelAndView editInfo(HttpSession session) {
		ModelAndView mav = new ModelAndView("t_el_seller");
		String id = (String)session.getAttribute("seller_id");
		Map<String,Object> map = sdao.overlapChk(id, "id");
			map.put("id", id);
		mav.addObject("map", map);
		mav.addObject("section", "seller/info_edit");
		return mav;
	}
	 
	 @RequestMapping("/info_edit_ok.j")
		public ModelAndView editInfoRst(@RequestParam Map map, HttpSession session) {
			ModelAndView mav = new ModelAndView("t_el_seller");
			String id = (String)session.getAttribute("seller_id");
			
			map.put("id", id);
			boolean b = sdao.editInfo(map);
			if(b) {
				mav.addObject("rst", b);
			}
			
			mav.addObject("section", "seller/alert/edit_rst");
			return mav;
		}
	
	 
	 //비밀번호 변경 폼
	@RequestMapping("/pass_edit.j")
	public ModelAndView editPass(@RequestParam Map map, HttpSession session) {
		ModelAndView mav = new ModelAndView("t_el_seller");
		String id = (String)session.getAttribute("seller_id");
		map.put("id", id);
		mav.addObject("section", "seller/pass_edit");
		return mav;
	}
	
	@RequestMapping("/pass_edit_ok.j")
	public ModelAndView editPassRst(@RequestParam Map map, HttpSession session) {
		ModelAndView mav = new ModelAndView("t_el_seller");
		String id = (String)session.getAttribute("seller_id");
		map.put("id", id);
		boolean b = sdao.editPass(map);
		if(b) {
			mav.addObject("rst", b);
		}
		mav.addObject("section", "seller/alert/edit_rst");
		return mav;
	}
	
	
}
