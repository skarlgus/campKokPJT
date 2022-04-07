package com.campkok.camplist.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.camp.model.vo.ReviewVO;
import com.campkok.camp.notice.model.vo.CampNoticeVO;
import com.campkok.camplist.model.service.CampListService;
import com.campkok.camplist.model.vo.CampList;
import com.campkok.camplist.model.vo.CampListPageData;
import com.campkok.camplist.model.vo.CampRoomList;

@Controller
public class CampListController {
	
	@Autowired
	private CampListService service;
	
	// 硫붿씤 �럹�씠吏� 濡쒕뱶�븷 �븣 罹좏븨�옣 愿묎퀬, �깉濡쒖슫 罹좏븨�옣 由ъ뒪�듃 
	@RequestMapping("/main.do")
	public String main(Model model) {
		// ArrayList<CampList> adCampList = service.mainAdCampList();	// main 罹좏븨�옣 愿묎퀬 由ъ뒪�듃
		ArrayList<CampList> newCampList = service.mainNewCampList();	// main �깉濡쒖슫 罹좏븨�옣 由ъ뒪�듃
		ArrayList<CampList> campRanking = service.mainCampRanking();	// main 罹좏븨�옣 �옲�궧
		// model.addAttribute("adCampList",adCampList);
		model.addAttribute("newCampList",newCampList);
		model.addAttribute("campRanking",campRanking);
		return "main";
	}

	// 罹좏븨�옣 由ъ뒪�듃
	@RequestMapping("/campList.do")
	public String campList(int reqPage, Model model) {
		CampListPageData clpd = service.campList(reqPage);
		model.addAttribute("list",clpd.getList());
		model.addAttribute("pageNavi",clpd.getPageNavi());
		return "user/campList";
	}
	
	// 罹좏븨�옣 �긽�꽭�럹�씠吏�
	@RequestMapping("/campView.do")
	public String selectOneCamp(int campNo, Model model) {
		CampList cl = service.selectOneCamp(campNo);
		ArrayList<CampRoomList> roomList = service.campRoomList(campNo);
		ArrayList<CampNoticeVO> cnList = service.selectCampNoticeList(campNo);
		ArrayList<ReviewVO> crList = service.selectCampReviewList(campNo);
		model.addAttribute("cl",cl);
		model.addAttribute("cnList", cnList);
		model.addAttribute("crList", crList);
		model.addAttribute("campRoomList",roomList);
		model.addAttribute("campNo",campNo);
		return "user/campView";
	}
	
	// 罹좏븨�옣 寃��깋
	@RequestMapping("/searchCampList.do")
	public String searchCampList(int reqPage, String searchSelect, String keyword, Model model) {
		CampListPageData clpd = service.searchCampList(reqPage, searchSelect, keyword);
		model.addAttribute("list",clpd.getList());
		model.addAttribute("pagiNavi",clpd.getPageNavi());
		return "user/campList";
	}
	
}
