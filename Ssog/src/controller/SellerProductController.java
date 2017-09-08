package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.SellerProductDao;
import paging.Paging;

@Controller
@RequestMapping("/seller/product")
public class SellerProductController {
	@Autowired
	SellerProductDao sdao;
	
	@Autowired
	Paging page;
	
	@RequestMapping("/list.j")
	public ModelAndView productList(@RequestParam Map map, HttpSession session, 
			@RequestParam(name="p", defaultValue="1") int p) {
		ModelAndView mav = new ModelAndView("t_el_seller");
		String id = (String)session.getAttribute("seller_id");
		map.put("id", id);
		String search_word2 = (String) map.get("search_word");
		String search_word = "%" + search_word2 + "%";
		map.put("search_word", search_word);
		
		int total = sdao.totalList(map);
		page.setDefaultSetting(2, 4); //줄 개수, 페이지 개수
		page.setNumberOfRecords(total);
		Map op = page.calcBetween(p);
		Map rst = page.calcPaging(p, total); //현재페이지, 총개수
			map.put("start", op.get("start"));
			map.put("end", op.get("end"));
//		System.out.println("op:" + op);
//		System.out.println("rst:" + rst);
//		System.out.println("map:" + map);
		
		List list = sdao.productList(map);
		System.out.println(map);
		mav.addObject("section", "seller/product/list");
		mav.addObject("list", list);
		mav.addObject("p", p);
		mav.addObject("page", rst);
		mav.addObject("total", total);
		mav.addObject("search_word", search_word2);
		return mav;
	}
	
	@RequestMapping("/cateAjax.j")
	@ResponseBody
	public Map cateajax(@RequestParam(name="big_cate") String big_cate) {
		Map m = new HashMap<>();
		switch(big_cate) {
		case "*":
			break;
		case "cate" : 
			List list = sdao.smallcateList();
			System.out.println("list : "+list);
			m.put("list", list);
			break;
		}
		
		return m;
	}
}
