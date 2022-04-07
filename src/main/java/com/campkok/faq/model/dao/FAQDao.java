package com.campkok.faq.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.campkok.faq.model.vo.FAQVO;

@Repository
public class FAQDao {

	@Autowired SqlSessionTemplate sqlSession;

	public int TotalFAQCount() {
		return sqlSession.selectOne("mainFaq.TotalFAQCount");
	}

	public ArrayList<FAQVO> selectFAQList(int start, int end, String faqUser) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("faqUser", faqUser);
		map.put("start", start);
		map.put("end", end);
		List<FAQVO> list = sqlSession.selectList("mainFaq.selectFAQList", map);
		return (ArrayList<FAQVO>) list;
	}

	public FAQVO selectOneFAQ(int faqNo) {
		return sqlSession.selectOne("mainFaq.selectOneFAQ", faqNo);
	}

	public int totalSearchFAQCount(String faqUser, String keyword) {
		System.out.println("keyword : "+keyword+" / faqUser : "+faqUser);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("faqUser", faqUser);
		map.put("keyword", keyword);
		return sqlSession.selectOne("mainFaq.totalSearchFAQCount", map);
	}

	public ArrayList<FAQVO> selectAllSearchFAQList(int start, int end, String faqUser, String keyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("searchCategory", faqUser);
		map.put("search", keyword);
		List<FAQVO> list = sqlSession.selectList("mainFaq.selectAllSearchFAQList", map);
		return (ArrayList<FAQVO>) list;
	}
}
