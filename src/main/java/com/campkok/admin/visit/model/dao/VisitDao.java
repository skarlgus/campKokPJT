package com.campkok.admin.visit.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.campkok.admin.visit.model.vo.Visit;

@Repository
public class VisitDao {
	@Autowired
	private SqlSessionTemplate session;

	public int insertVisitInfo(Visit visit) {

		return session.insert("adminUserInfo.insertVisitInfo", visit);
	}
}
