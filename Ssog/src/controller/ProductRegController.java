package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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

import model.ProductDao;

@Controller
@RequestMapping("/seller/product")
public class ProductRegController {

	@Autowired
	ProductDao pdao;
	
	@Autowired
	ServletContext application;
	
	@RequestMapping("/productReg")
	public ModelAndView register (){
		ModelAndView mav=new ModelAndView("t_el_seller");
		mav.addObject("section", "seller/product/productReg");
		List<Map> list=new ArrayList<>();
		list=pdao.largecate();
		mav.addObject("large_cate", list);
		List<Map> list1=pdao.originlist();
		mav.addObject("originlist",list1);
		
		return mav;
	}
	@RequestMapping("/productRegExec")
	public ModelAndView registerExec(@RequestParam Map map,@RequestParam(name="pro_img") MultipartFile f,
			HttpSession session	) throws IllegalStateException, IOException {
		ModelAndView mav=new ModelAndView("t_el_seller");
		String path = application.getRealPath("/img/pro_img");
		System.out.println(path);
		File dir=new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		String uuid = "";
		if(!f.isEmpty()) {
		uuid=UUID.randomUUID().toString();
		boolean rst= false;
		if(f.getContentType().startsWith("image")) {
			File dst = new File(dir,uuid);
			if(dst.exists())dst.delete();
			f.transferTo(dst);
			rst=true;
		}
		}
		map.put("seller", session.getAttribute("seller_id"));
		map.put("uuid", uuid);
		boolean br=pdao.productReg(map); 
		mav.addObject("rst", br);
		mav.addObject("section", "seller/alert/register_rst");
		return mav; 
	}
	
	@RequestMapping("/smallcate")
	@ResponseBody 
	public Map samllcategory(@RequestParam(name="large_cate") String num) {

		Map map=new HashMap<>();
		List<Map> list=new ArrayList<>();
		list=pdao.smallcate(num);
		map.put("list", list);
		
		return map;		 
	}
	@RequestMapping("/productEdit")
	public ModelAndView Edit (@RequestParam(name="num") String num){
		ModelAndView mav=new ModelAndView("t_el_seller");
		mav.addObject("section", "seller/product/productEdit");
		Map map=new HashMap<>(); 
		List<Map> list=new ArrayList<>();
		list=pdao.largecate();
		mav.addObject("large_cate", list);
		map=pdao.pro_detail(num);
		mav.addObject("map", map);
		System.out.println(map);
		List<Map> list1=pdao.originlist();
		mav.addObject("originlist",list1);
		 
		return mav;
	}
	@RequestMapping("/productEditExec")
	public ModelAndView editExec(@RequestParam Map map,@RequestParam(name="pro_img") MultipartFile f,
			HttpSession session	) throws IllegalStateException, IOException {
		ModelAndView mav=new ModelAndView("t_el_seller");
		System.out.println("맵은 과연??"+map);
		String path = application.getRealPath("/img/pro_img");
		File dir=new File(path);
		String uuid;
		uuid = (String) map.get("uuid");
		if((String) map.get("uuid")==null) {
			if(!f.isEmpty()) {		
				uuid=UUID.randomUUID().toString();
				boolean rst= false;
				if(f.getContentType().startsWith("image")) {
					File dst = new File(dir,uuid);
					if(dst.exists())dst.delete();
					f.transferTo(dst);
					rst=true;
					map.put("uuid", uuid);
				} 
			}
			}else { 
				if(!f.isEmpty()) {		
					boolean rst= false;
					if(f.getContentType().startsWith("image")) {
						File dst = new File(dir,uuid);
						if(dst.exists())dst.delete();
						f.transferTo(dst);
						rst=true;
						map.put("uuid", uuid);
					}
				}
			}
		map.put("seller", session.getAttribute("seller_id"));
		System.out.println("완성된 map 은??"+map);
		boolean br=pdao.productUpdate(map);
		System.out.println(br);
		mav.addObject("section", "seller/alert/register_rst");
		return mav;  
	}
}

