package com.campkok.admin.visit.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.campkok.admin.visit.model.dao.VisitDao;
import com.campkok.admin.visit.model.vo.Visit;

@Service
public class VisitService {
	@Autowired
	private VisitDao dao;

	@Transactional
	public int insertVisitInfo(Visit visit) {
		return dao.insertVisitInfo(visit);
	}
}
