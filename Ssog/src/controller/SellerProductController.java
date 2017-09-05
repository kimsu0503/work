package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		System.out.println(id);
		
		int total = sdao.totalList(map);
		page.setDefaultSetting(2, 4); //줄 개수, 페이지 개수
		page.setNumberOfRecords(total);
		Map op = page.calcBetween(p);
		Map rst = page.calcPaging(p, total); //현재페이지, 총개수
			map.put("start", op.get("start"));
			map.put("end", op.get("end"));
		System.out.println("op:" + op);
		System.out.println("rst:" + rst);
		System.out.println("map:" + map);
		
		List list = sdao.productList(map);
		mav.addObject("section", "seller/product/list");
		mav.addObject("list", list);
		mav.addObject("p", p);
		mav.addObject("page", rst);
		return mav;
	}
	
	//상품 목록에서 검색
	@RequestMapping("/list_search.j")
	public ModelAndView search(@RequestParam Map map){
		ModelAndView mav = new ModelAndView("t_el_seller");
			mav.addObject("search_type", map.get("search_type"));
			mav.addObject("search_word", map.get("search_word"));
			mav.addObject("section", "seller/product/list"); 
		return mav;
	}
}
