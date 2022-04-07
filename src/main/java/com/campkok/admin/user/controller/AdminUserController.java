package com.campkok.admin.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.admin.user.model.service.AdminUserService;
import com.campkok.admin.user.model.vo.AdminUserInfoPageData;
import com.campkok.admin.user.model.vo.User;

@Controller
public class AdminUserController {
	@Autowired
	private AdminUserService service;

	// ********** Client Info **********
	@RequestMapping("selectClientInfo.do")
	public String selectClientInfo(int userNo, Model model) {
		User clientInfo = service.selectClientInfo(userNo);

		model.addAttribute("clientInfo", clientInfo);

		return "/admin/clientInfoView";
	}

	@RequestMapping("/selectClientInfoList.do")
	public String selectClientInfoList(int reqPage, Model model) {
		AdminUserInfoPageData auipd = service.selectClientInfoList(reqPage);

		model.addAttribute("list", auipd.getList());
		model.addAttribute("pageNavi", auipd.getPageNavi());

		return "/admin/clientInfoList";
	}

	@RequestMapping("/searchClientInfo.do")
	public String searchClientInfoList(int reqPage, String searchCategory, String search, Model model) {
		AdminUserInfoPageData auipd = service.searchClientInfoList(reqPage, searchCategory, search);

		model.addAttribute("list", auipd.getList());
		model.addAttribute("pageNavi", auipd.getPageNavi());

		return "/admin/clientInfoList";
	}

	@RequestMapping("/updateClientInfo.do")
	public String updateClientInfo(User clientInfo, Model model) {
		int result = service.updateClientInfo(clientInfo);

		if (result > 0) {
			model.addAttribute("msg", "고객정보 수정 성공");
		} else {
			model.addAttribute("msg", "고객정보 수정 실패");
		}
		model.addAttribute("loc", "/selectClientInfoList.do?reqPage=1");

		return "/common/msg";
	}

	@RequestMapping("/deleteClientInfo.do")
	public String deleteClientInfo(int userNo, Model model) {
		int result = service.deleteClientInfo(userNo);

		if (result > 0) {
			model.addAttribute("msg", "고객정보 삭제 성공");
		} else {
			model.addAttribute("msg", "고객정보 삭제 실패");
		}
		model.addAttribute("loc", "/selectClientInfoList.do?reqPage=1");

		return "/common/msg";
	}

	// ********** CEO Info **********
	@RequestMapping("/selectCeoInfo.do")
	public String selectCeoInfo(int userNo, Model model) {
		User ceoInfo = service.selectCeoInfo(userNo);

		model.addAttribute("ceoInfo", ceoInfo);

		return "/admin/ceoInfoView";
	}

	@RequestMapping("/selectCeoInfoList.do")
	public String selectCeoInfoList(int reqPage, Model model) {
		AdminUserInfoPageData auipd = service.selectCeoInfoList(reqPage);

		model.addAttribute("list", auipd.getList());
		model.addAttribute("pageNavi", auipd.getPageNavi());

		return "/admin/ceoInfoList";
	}

	@RequestMapping("/searchCeoInfo.do")
	public String searchCeoInfo(int reqPage, String searchCategory, String search, Model model) {
		AdminUserInfoPageData auipd = service.searchCeoInfoList(reqPage, searchCategory, search);

		model.addAttribute("list", auipd.getList());
		model.addAttribute("pageNavi", auipd.getPageNavi());

		return "/admin/ceoInfoList";
	}

	@RequestMapping("/updateCeoInfo.do")
	public String updateCeoInfo(User ceoInfo, Model model) {
		int result = service.updateCeoInfo(ceoInfo);

		if (result > 0) {
			model.addAttribute("msg", "사업자정보 변경 성공");
		} else {
			model.addAttribute("msg", "사업자정보 변경 실패");
		}
		model.addAttribute("loc", "/selectCeoInfoList.do?reqPage=1");

		return "/common/msg";
	}

	@RequestMapping("/deleteCeoInfo.do")
	public String deleteCeoInfo(int userNo, Model model) {
		int result = service.deleteCeoInfo(userNo);

		if (result > 0) {
			model.addAttribute("msg", "사업자정보 삭제 완료");
		} else {
			model.addAttribute("msg", "사업자정보 삭제 실패");
		}
		model.addAttribute("loc", "/selectCeoInfoList.do?reqPage=1");

		return "/common/msg";
	}

}
