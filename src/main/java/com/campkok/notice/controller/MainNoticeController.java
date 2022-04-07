package com.campkok.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.admin.notice.model.service.AdminNoticeService;
import com.campkok.admin.notice.model.vo.CeoNotice;
import com.campkok.admin.notice.model.vo.CeoNoticePageData;
import com.campkok.admin.notice.model.vo.ClientNotice;
import com.campkok.admin.notice.model.vo.ClientNoticePageData;
import com.campkok.notice.model.service.MainNoticeService;

@Controller
public class MainNoticeController {
	@Autowired
	private MainNoticeService service;
	
	@Autowired
	private AdminNoticeService nService;
	

	// 일반이용자 공지사항
	@RequestMapping("/customerNoticeList.do")
	public String selectCustomerNoticeList(int reqPage, Model model) {
		ClientNoticePageData cnpd = service.selectClientNoticeList(reqPage);
		model.addAttribute("list", cnpd.getList());
		model.addAttribute("pageNavi", cnpd.getPageNavi());
		return "notice/customer/noticeList";
	}
	
	@RequestMapping("/selectCustomerNotice.do")
	public String selectClientNotice(int clientNoticeNo, Model model) {
		ClientNotice clientNotice = nService.selectClientNotice(clientNoticeNo);
		model.addAttribute("clientNotice", clientNotice);
		return "notice/customer/noticeView";
	}
	
	// 캠핑장운영자 공지사항
	@RequestMapping("/mainCeoNoticeList.do")
	public String selectCeoNoticeList(int reqPage, Model model) {
		CeoNoticePageData cnpd = service.selectMainCeoNoticeList(reqPage);
		model.addAttribute("list", cnpd.getList());
		model.addAttribute("pageNavi", cnpd.getpageNavi());
		return "notice/ceo/noticeList";
	}
	
	@RequestMapping("/selectMainCeoNotice.do")
	public String selectMainCeoNotice(int ceoNoticeNo, Model model) {
		CeoNotice ceoNotice = nService.selectCeoNotice(ceoNoticeNo);
		model.addAttribute("ceoNotice", ceoNotice);
		return "notice/ceo/noticeView";
	}
	
}
