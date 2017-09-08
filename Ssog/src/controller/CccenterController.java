package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.CccenterDao;
import paging.Paging;

@Controller
@RequestMapping("/cccenter")
public class CccenterController {
	@Autowired
	CccenterDao mdao;
	@Autowired
	Paging paging;

	@RequestMapping("/faq.j")
	public ModelAndView faq(@RequestParam(name = "sort", required = false) Integer sort,
			@RequestParam(name = "p", defaultValue = "1") Integer p, @RequestParam Map param) {
		Map m = new HashMap<>();
		if (sort != null) {
			m.put("sort", sort);
		}
		String search = (String) param.get("search");
		if (param.get("search") != null) {
			search = "%" + search + "%";
		}
		param.put("search", search);

		ModelAndView mav = new ModelAndView("t_el3");
		mav.addObject("section", "cccenter/faq");
		List<Map> flist = mdao.faq();
		List<Map> nlist = mdao.notice();
		mav.addObject("flist", flist);
		mav.addObject("nlist", nlist);
		paging.setDefaultSetting(8, 5);
		paging.setNumberOfRecords(mdao.faq_cnt(m));
		System.out.println("row " + mdao.faq_cnt(m));
		System.out.println("page " + p);
		Map bt = paging.calcBetween(p);
		Map pg = paging.calcPaging(p, mdao.faq_cnt(m));
		System.out.println("bt:" + bt);
		System.out.println("pg:" + pg);
		mav.addObject("pg", pg);
		mav.addObject("sort", sort);
		if (sort != null) {
			bt.put("sort", sort);
		}
		System.out.println("bt == 	" + bt);
		if (param.get("search") != null) {
			bt.put("search", param.get("search"));
		}
		List<Map> page = mdao.faqpage(bt);
		System.out.println("br 는??" + bt);
		mav.addObject("page", page);

		return mav;
	}

	@RequestMapping("/notice.j")
	public ModelAndView notice() {
		ModelAndView mav = new ModelAndView("t_el3");
		mav.addObject("section", "cccenter/notice");
		List<Map> nalist = mdao.noticeAll();
		mav.addObject("nalist", nalist);
		return mav;
	}

	@RequestMapping("/notice_detail.j")
	public ModelAndView noticedetail(@RequestParam (name="num") String num) {
		ModelAndView mav = new ModelAndView("t_el3");
		mav.addObject("section", "cccenter/notice_detail");
		Map map = mdao.noticeOne(num);
		mav.addObject("notice", map);
		return mav;
	}
}
