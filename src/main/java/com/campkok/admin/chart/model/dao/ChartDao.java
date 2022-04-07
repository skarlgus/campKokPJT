package com.campkok.admin.chart.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChartDao {
	@Autowired
	private SqlSessionTemplate session;

	public int getVisitUserCount(String date) {
		return session.selectOne("adminChart.getVisitUserCount", date);
	}

	public int getNumberOfMan() {
		return session.selectOne("adminChart.getManNumber");
	}

	public int getNumberOfWoman() {
		return session.selectOne("adminChart.getWomanNumber");
	}

	public int getResMemberCount(int member) {
		return session.selectOne("adminChart.getResMemberCount", member);
	}

	public int getReviewScoreCount(int count) {
		return session.selectOne("adminChart.getReviewScoreCount", count);
	}

	public int getCeoCount() {
		return session.selectOne("adminChart.getCeoCount");
	}

	public int getClientCount() {
		return session.selectOne("adminChart.getClientCount");
	}

}
