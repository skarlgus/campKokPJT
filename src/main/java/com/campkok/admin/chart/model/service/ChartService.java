package com.campkok.admin.chart.model.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.admin.chart.model.dao.ChartDao;

@Service
public class ChartService {
	@Autowired
	private ChartDao dao;

	public String getVisitUserRatio() {
		Calendar cal = Calendar.getInstance();
		int day = cal.get(cal.DATE);
		HashMap<Integer, Integer> visitRatio = new HashMap<Integer, Integer>();

		// 날짜 계산 로직 변경
		for (int i = (day - 6); i <= day; i++) {
			String date = "2021-01-" + ((i < 10) ? "0" + String.valueOf(i) : String.valueOf(i));
			int count = dao.getVisitUserCount(date);

			visitRatio.put(i, count);
		}

		Set<Integer> keySet = visitRatio.keySet();
		ArrayList<Integer> list = new ArrayList<Integer>(keySet);
		Collections.sort(list);
		String result = "";

		for (int key : list) {
			if (result != "")
				result += ", ";
			result += "[" + key + ", " + visitRatio.get(key) + "]";
		}
		return result;
	}

	public String getUserGenderRatio() {
		int totalMan = dao.getNumberOfMan();
		int totalWoman = dao.getNumberOfWoman();
		String result = "";

		HashMap<String, Integer> genderRatio = new HashMap<String, Integer>();

		genderRatio.put("woman", totalWoman);
		genderRatio.put("man", totalMan);

		Set<String> keySet = genderRatio.keySet();

		for (String key : keySet) {
			if (result != "") {
				result += ", ";
			}
			result += "['" + key + "', " + genderRatio.get(key) + "]";
		}

		return result;
	}

	public String getReservationMemberRatio() {
		HashMap<Integer, Integer> resMemberRatio = new HashMap<Integer, Integer>();

		for (int i = 1; i < 7; i++) {
			int member = dao.getResMemberCount(i);

			resMemberRatio.put(i, member);
		}

		Set<Integer> keySet = resMemberRatio.keySet();
		ArrayList<Integer> list = new ArrayList<Integer>(keySet);
		Collections.sort(list);
		String result = "";

		for (int key : list) {
			if (result != "") {
				result += ", ";
			}

			result += (key < 6) ? "['" + key + "인', " + resMemberRatio.get(key) + "]"
					: "['" + key + "인 이상', " + resMemberRatio.get(key) + "]";
		}
		return result;
	}

	public String getReviewScoreRatio() {
		HashMap<Integer, Integer> reviewScore = new HashMap<Integer, Integer>();

		for (int i = 1; i < 6; i++) {
			int count = dao.getReviewScoreCount(i);

			reviewScore.put(i, count);
		}

		Set<Integer> keySet = reviewScore.keySet();
		ArrayList<Integer> list = new ArrayList<Integer>(keySet);
		Collections.sort(list);
		String result = "";

		for (int key : list) {
			if (result != "")
				result += ", ";
			result += "['" + key + "점', " + reviewScore.get(key) + "]";
		}
		return result;
	}

	public String getUserInfoRatio() {
		HashMap<String, Integer> userInfo = new HashMap<String, Integer>();

		int ceoCount = dao.getCeoCount();
		int clientCount = dao.getClientCount();

		userInfo.put("ceo", ceoCount);
		userInfo.put("client", clientCount);

		Set<String> keySet = userInfo.keySet();
		String result = "";

		for (String key : keySet) {
			if (result != "")
				result += ", ";
			result += "['" + key + "', " + userInfo.get(key) + "]";
		}
		return result;
	}
}
