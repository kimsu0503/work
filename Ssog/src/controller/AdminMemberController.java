package controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.AdminMemberDao;
import paging.Paging;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {
	
	@Autowired
	AdminMemberDao amd;
	
	@Autowired
	Paging pg;

	@RequestMapping("/member_user/user_list.ja")
	public String user_list(@RequestParam Map params, @RequestParam(name="p", defaultValue="1") Integer p, Map map){
		String val = null;
		if(params.get("value") != null){
			val = (String)params.get("value");
			if(val.length() > 0){
				String tmp = "%"+val+"%";
				params.put("value", tmp);
				// System.out.println("params의 value : "+params.get("value"));
			}
		}
		pg.setDefaultSetting(2, 3);
		int rows = amd.user_list_count(params);
		pg.setNumberOfRecords(rows);
		Map paging = pg.calcPaging(p, rows);
		// System.out.println("paging : "+paging);
		Map se = pg.calcBetween(p);
		params.put("start", se.get("start"));
		params.put("end", se.get("end"));
		
		List list = amd.user_list(params);
		
		String[] typesEn = "id,name,email,phone".split(",");
		String[] typesKo = "아이디,이름,이메일,연락처".split(",");
		map.put("typesEn", typesEn);
		map.put("typesKo", typesKo);
		
		DecimalFormat df = new DecimalFormat("#,###");
		String total = df.format(rows);
		map.put("total", total);
		map.put("list", list);
		map.put("paging", paging);
		map.put("section", "/member_user/user_list");
		params.put("value", val);
		map.put("params", params);
		
		return "ad_member";
	}
	
	@RequestMapping("/member_seller/seller_list.ja")
	public String seller_list(Map map){
		map.put("section", "/member_seller/seller_list");
		return "ad_member";
	}
}
