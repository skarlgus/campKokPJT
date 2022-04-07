package com.campkok.admin.camp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.admin.camp.model.service.AdminCampService;
import com.campkok.admin.camp.model.vo.AdminCampInfoPageData;
import com.campkok.admin.camp.model.vo.Camp;
import com.campkok.admin.camp.model.vo.CampEnv;
import com.campkok.admin.camp.model.vo.CampFiles;

@Controller
public class AdminCampController {
	@Autowired
	private AdminCampService service;

	/* 
	 * ***************************************************************************
	 * Camp Info List
	 * ***************************************************************************
	*/
	@RequestMapping("/selectCampInfo.do")
	public String selectCampInfo(int campNo, Model model) {
		Camp campInfo = service.selectCampInfo(campNo);

		model.addAttribute("campInfo", campInfo);

		return "/admin/campInfoView";
	}

	@RequestMapping("/selectCampInfoList.do")
	public String selectCampInfoList(int reqPage, Model model) {
		AdminCampInfoPageData acipd = service.selectCampInfoList(reqPage);

		model.addAttribute("list", acipd.getList());
		model.addAttribute("pageNavi", acipd.getPageNavi());

		return "/admin/campInfoList";
	}

	@RequestMapping("/searchCampInfoList.do")
	public String searchCampInfoList(int reqPage, String searchCategory, String search, Model model) {
		AdminCampInfoPageData acipd = service.searchCampInfoList(reqPage, searchCategory, search);

		model.addAttribute("list", acipd.getList());
		model.addAttribute("pageNavi", acipd.getPageNavi());

		return "/admin/campInfoList";
	}

	@RequestMapping("/insertCampInfo.do")
	public String insertCampInfo(Camp camp, CampFiles campFiles, CampEnv campEnv, Model model) {
		int result = service.insertCampInfo(camp); // 실제 사용 캠핑장 테이블에 신규 캠핑장 등록
		result = service.insertCampFile(camp, campFiles); // 실제 사용 이미지 테이블에 신규 캠핑장 이미지 등록
		result = service.insertCampEnv(camp, campEnv); // 실제 사용 이용시설 테이블에 신규 캠핑장 이용시설 등록
		result = service.deleteTempCampInfo(camp.getCampNo()); // 테이블에 모두 등록 후 temp 테이블에서 삭제

		if (result > 0) {
			model.addAttribute("msg", "캠핑장 등록 성공");
		} else {
			model.addAttribute("msg", "캠핑장 등록 실패");
		}
		model.addAttribute("loc", "/selectTempCampInfoList.do?reqPage=1");

		return "/common/msg";
	}

	@RequestMapping("/deleteCampInfo.do")
	public String deleteCampInfo(int campNo, Model model) {
		int result = service.deleteCampInfo(campNo);

		if (result > 0) {
			model.addAttribute("msg", "캠핑장 정보 삭제 성공");
		} else {
			model.addAttribute("msg", "캠핑장 정보 삭제 실패");
		}
		model.addAttribute("loc", "/selectCampInfoList.do?reqPage=1");

		return "/common/msg";
	}

	/* 
	 * ***************************************************************************
	 * Temp Camp Info List
	 * ***************************************************************************
	*/
	@RequestMapping("/selectTempCampInfo.do")
	public String selectTempCampInfo(int campNo, Model model) {
		Camp campInfo = service.selectTempCampInfo(campNo);

		model.addAttribute("campInfo", campInfo);

		return "/admin/insertCampInfoView";
	}

	@RequestMapping("/selectTempCampInfoList.do")
	public String selectTempCampInfoList(int reqPage, Model model) {
		AdminCampInfoPageData acipd = service.selectTempCampList(reqPage);

		model.addAttribute("list", acipd.getList());
		model.addAttribute("pageNavi", acipd.getPageNavi());

		return "/admin/insertCampInfoList";
	}

	@RequestMapping("/searchTempCampInfoList.do")
	public String searchTempCampInfoList(int reqPage, String searchCategory, String search, Model model) {
		AdminCampInfoPageData acipd = service.searchTempCampInfoList(reqPage, searchCategory, search);

		model.addAttribute("list", acipd.getList());
		model.addAttribute("pageNavi", acipd.getPageNavi());

		return "/admin/insertCampInfoList";
	}

	@RequestMapping("/deleteTempCampInfo.do")
	public String deleteTempCampInfo(int campNo, Model model) {
		int result = service.deleteTempCampInfo(campNo);

		if (result > 0) {
			model.addAttribute("msg", "캠핑장 등록신청 반려 성공");
		} else {
			model.addAttribute("msg", "캠핑장 등록신청 반려 실패");
		}
		model.addAttribute("loc", "/selectTempCampInfoList.do?reqPage=1");

		return "/common/msg";
	}

}
