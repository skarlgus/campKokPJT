package com.campkok.faq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.faq.model.service.FAQService;
import com.campkok.faq.model.vo.FAQVO;
import com.campkok.faq.model.vo.FAQPageData;

@Controller
public class FAQController {

	@Autowired
	private FAQService service;
	
	// FAQ list
	@RequestMapping("/faqList.do")
	public String selectFAQList(int reqPage, Model model, String faqUser) {
		FAQPageData fpd = service.selectFAQList(reqPage,faqUser);
		model.addAttribute("list", fpd.getList());
		model.addAttribute("pageNavi", fpd.getPageNavi());
		System.out.println(fpd.getList());
		return "notice/faqList";
	}
	
	// FAQ view
	@RequestMapping("/faqView.do")
	public String selectOneFAQ(int faqNo, Model model) {
		FAQVO faqInfo = service.selectOneFAQ(faqNo);

		model.addAttribute("faqInfo", faqInfo);

		return "notice/faqView";
	}
	
	// FAQ 검색
	@RequestMapping("/searchFAQList.do")
	public String searchFAQList(int reqPage, String keyword, String faqUser, Model model) {
		FAQPageData fpd = service.searchFAQList(reqPage, faqUser, keyword);

		model.addAttribute("list", fpd.getList());
		model.addAttribute("pageNavi", fpd.getPageNavi());
		
		return "notice/faqList";
	}
}
