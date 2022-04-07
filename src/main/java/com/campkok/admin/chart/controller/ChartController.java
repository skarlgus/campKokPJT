package com.campkok.admin.chart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.admin.camp.model.service.AdminCampService;
import com.campkok.admin.chart.model.service.ChartService;

@Controller
public class ChartController {
	@Autowired
	private ChartService service;
	@Autowired
	private AdminCampService cService;

	/* **************************************************
	 * Chart Page
	 * **************************************************
	*/
	@RequestMapping("/pageChart.do")
	public String pageChart(Model model) {
		String visitUserRatio = getVisitUserRatio();
		String genderRatio = getUserGenderRatio();
		String resMemberRatio = getReservationMemberRatio();
		String reviewScoreRatio = getReviewScoreRatio();
		String userInfoRatio = getUserInfoRatio();
		int tempCampCount = cService.getTempCampCount();

		model.addAttribute("visitUserRatio", visitUserRatio);
		model.addAttribute("genderRatio", genderRatio);
		model.addAttribute("resMemberRatio", resMemberRatio);
		model.addAttribute("reviewScoreRatio", reviewScoreRatio);
		model.addAttribute("userInfoRatio", userInfoRatio);
		model.addAttribute("tempCampCount", tempCampCount);

		return "/admin/chartView";
	}

	public String getVisitUserRatio() {
		String visitUserRatio = service.getVisitUserRatio();

		return visitUserRatio;
	}

	public String getUserGenderRatio() {
		String userRatio = service.getUserGenderRatio();

		return userRatio;
	}

	public String getReservationMemberRatio() {
		String resMemberRatio = service.getReservationMemberRatio();

		return resMemberRatio;
	}

	public String getReviewScoreRatio() {
		String reviewScoreRatio = service.getReviewScoreRatio();

		return reviewScoreRatio;
	}

	public String getUserInfoRatio() {
		String userInfoRatio = service.getUserInfoRatio();

		return userInfoRatio;
	}
}
