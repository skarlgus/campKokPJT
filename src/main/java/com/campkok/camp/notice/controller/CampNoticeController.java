package com.campkok.camp.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.camp.notice.model.service.CampNoticeService;
import com.campkok.camp.notice.model.vo.NoticePageData;

@Controller
@RequestMapping("/campNotice")
public class CampNoticeController {
	@Autowired
	private CampNoticeService service;
	
	@RequestMapping("/campNotice.do")
	public String campNotice(int reqPage, Model model) {
		NoticePageData npd = service.noticeList(reqPage);	
		model.addAttribute("list",npd.getList());
		model.addAttribute("pageNavi",npd.getPageNavi());
		return "camp/campNoticeList";
	}
}
