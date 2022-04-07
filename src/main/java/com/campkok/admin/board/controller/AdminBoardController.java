package com.campkok.admin.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.admin.board.model.service.AdminBoardService;
import com.campkok.admin.board.model.vo.AdminBoardInfoPageData;
import com.campkok.admin.board.model.vo.AdminFAQInfoPageData;
import com.campkok.admin.board.model.vo.Board;
import com.campkok.admin.board.model.vo.FAQ;

@Controller
public class AdminBoardController {
	@Autowired
	private AdminBoardService service;

	// ******************** Board ********************
	@RequestMapping("/selectBoardInfo.do")
	public String selectBoardInfo(int boardNo, Model model) {
		Board boardInfo = service.selectBoardInfo(boardNo);

		model.addAttribute("boardInfo", boardInfo);

		return "/admin/boardInfoView";
	}

	@RequestMapping("/selectBoardInfoList.do")
	public String selectBoardInfoList(int reqPage, Model model) {
		AdminBoardInfoPageData abipd = service.selectBoardInfoList(reqPage);

		model.addAttribute("boardInfoList", abipd.getList());
		model.addAttribute("pageNavi", abipd.getPageNavi());

		return "/admin/boardInfoList";
	}

	@RequestMapping("/searchBoardInfoList.do")
	public String searchBoardInfoList(int reqPage, String searchCategory, String search, Model model) {
		AdminBoardInfoPageData abipd = service.searchBoardInfoList(reqPage, searchCategory, search);

		model.addAttribute("boardInfoList", abipd.getList());
		model.addAttribute("pageNavi", abipd.getPageNavi());

		return "/admin/boardInfoList";
	}

	@RequestMapping("/deleteBoardInfo.do")
	public String deleteBoardInfo(int boardNo, Model model) {
		int result = service.deleteBoardInfo(boardNo);

		if (result > 0) {
			model.addAttribute("msg", "게시글 삭제 완료");
		} else {
			model.addAttribute("msg", "게시글 삭제 실패");
		}
		model.addAttribute("loc", "/selectBoardInfoList.do?reqPage=1");

		return "/common/msg";
	}

	// ******************** FAQ ********************

	@RequestMapping("/pageFAQForm.do")
	public String pageFAQForm(Model model) {
		return "/admin/faqForm";
	}

	@RequestMapping("/selectFAQInfo.do")
	public String selectFAQInfo(int faqNo, Model model) {
		FAQ faqInfo = service.selectFAQInfo(faqNo);

		model.addAttribute("faqInfo", faqInfo);

		return "/admin/faqInfoView";
	}

	@RequestMapping("/selectFAQInfoList.do")
	public String selectFAQInfoList(int reqPage, Model model) {
		AdminFAQInfoPageData afipd = service.selectFAQInfoList(reqPage);

		model.addAttribute("list", afipd.getList());
		model.addAttribute("pageNavi", afipd.getPageNavi());

		return "/admin/faqInfoList";
	}

	@RequestMapping("/searchFAQInfoList.do")
	public String searchFAQInfoList(int reqPage, String searchCategory, String search, Model model) {
		AdminFAQInfoPageData afipd = service.searchFAQInfoList(reqPage, searchCategory, search);

		model.addAttribute("list", afipd.getList());
		model.addAttribute("pageNavi", afipd.getPageNavi());

		return "/admin/faqInfoList";
	}

	@RequestMapping("/insertFAQInfo.do")
	public String insertFAQInfo(FAQ faq, Model model) {
		int result = service.insertFAQInfo(faq);

		if (result > 0) {
			model.addAttribute("msg", "FAQ 등록 성공");
		} else {
			model.addAttribute("msg", "FAQ 등록 실패");
		}
		model.addAttribute("loc", "/selectFAQInfoList.do?reqPage=1");

		return "/common/msg";
	}

	@RequestMapping("/updateFAQInfo.do")
	public String updateFAQInfo(FAQ faq, Model model) {
		int result = service.updateFAQInfo(faq);

		if (result > 0) {
			model.addAttribute("msg", "FAQ 변경 성공");
		} else {
			model.addAttribute("msg", "FAQ 변경 실패");
		}
		model.addAttribute("loc", "/selectFAQInfoList.do?reqPage=1");

		return "/common/msg";
	}

	@RequestMapping("/deleteFAQInfo.do")
	public String deleteFAQInfo(int faqNo, Model model) {
		int result = service.deleteFAQInfo(faqNo);

		if (result > 0) {
			model.addAttribute("msg", "FAQ 삭제 성공");
		} else {
			model.addAttribute("msg", "FAQ 삭제 실패");
		}
		model.addAttribute("loc", "/selectFAQInfoList.do?reqPage=1");

		return "/common/msg";
	}
}
