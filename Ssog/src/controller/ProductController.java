package controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.ProductDao;
import paging.Paging;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	ProductDao pdao;
	
	@Autowired
	Paging pg;
	
	@RequestMapping("/list.j")
	public ModelAndView pro_list(@RequestParam Map param,@RequestParam(name="origin_group",required=false)String[] arr) {
		if(param.get("page")==null) {
			param.put("page", "1");
		}
		if(param.get("min")==null) {
			param.put("min", 0);
		}
		if(param.get("max")==null) {
			param.put("max", 9999999);
		}
		System.out.println("오리진 그룹"+Arrays.toString(arr));
		
		param.put("origin_group", arr);
		pg.setDefaultSetting(8, 5); 
		if(param.get("search")!=null) {
		String search=(String) param.get("search");
		search="%"+search+"%";
		param.put("search", search);  
		}
		System.out.println("넘어온 파라미터"+param);
		String category=(String) param.get("category");
		ModelAndView mav=new ModelAndView("t_base");
		mav.addObject("section","product/list");			
		List<Map> list=new ArrayList<>();
		
		int r=pdao.paging(param);
		int page = Integer.parseInt((String)param.get("page"));
		Map m = pg.calcBetween(page);
		param.put("start", m.get("start"));
		param.put("end", m.get("end"));
		System.out.println(m);
		mav.addObject("total", r);
		List<Map> list1=new ArrayList<>();
		list1=pdao.originlist();
		pg.setNumberOfRecords(r);		
		Map mm = pg.calcPaging(page, r);		
		list=pdao.pro_list(param);
		mav.addObject("list", list);
		mav.addObject("paging",mm);
		mav.addObject("originlist", list1);
		String ori = "";
		if(arr != null) {
		for(String s : arr) {
			ori += "&origin_group="+s; 
		}
		mav.addObject("origin", ori);
		System.out.println(ori);
		}
		return mav;
	}
	@RequestMapping("/detail.j")
	public ModelAndView productdetail(@RequestParam(name="productNumber") String num) {
		ModelAndView mav=new ModelAndView("t_base");
		System.out.println(num);
		Map map=new HashMap<>();
		map=pdao.pro_detail(num);
		System.out.println(map);
		mav.addObject("section", "product/productdetail");
		
		return mav;
	}
	
}