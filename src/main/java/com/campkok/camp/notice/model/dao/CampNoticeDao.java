package com.campkok.camp.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.campkok.camp.notice.model.vo.CampNoticeVO;

@Repository
public class CampNoticeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	/*
	 * public ArrayList<CampNoticeVO> selectList(HashMap<String, Object> map) {
	 * List<CampNoticeVO> list = sqlSession.selectList("camp.selectAllNotice",map);
	 * return (ArrayList<CampNoticeVO>)list; }
	 */

	public int totalCount() {
		return sqlSession.selectOne("camp.selectCountNoitce");
	}

	public ArrayList<CampNoticeVO> selectList(int start, int end) {
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
		List<CampNoticeVO> list = sqlSession.selectList("camp.selectAllNotice",map);
		return (ArrayList<CampNoticeVO>)list;
	}
}
