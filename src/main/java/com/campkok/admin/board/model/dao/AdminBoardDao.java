package com.campkok.admin.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.campkok.admin.board.model.vo.Board;
import com.campkok.admin.board.model.vo.FAQ;

@Repository
public class AdminBoardDao {
	@Autowired
	private SqlSessionTemplate session;

	// ******************** Board ********************
	public int getTotalBoardInfoCount() {
		return session.selectOne("adminBoard.getTotalBoardInfoCount");
	}

	public int getTotalSearchBoardInfoCount(String searchCategory, String search) {
		HashMap<String, String> map = new HashMap<String, String>();

		map.put("searchCategory", searchCategory);
		map.put("search", search);

		return session.selectOne("adminBoard.getTotalSearchBoardInfoCount", map);
	}

	public Board selectBoardInfo(int boardNo) {
		return session.selectOne("adminBoard.selectBoardInfo", boardNo);
	}

	public ArrayList<Board> selectBoardInfoList(int start, int end) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();

		map.put("start", start);
		map.put("end", end);

		List<Board> list = session.selectList("adminBoard.selectBoardInfoList", map);

		return (ArrayList<Board>) list;
	}

	public ArrayList<Board> selectBoardInfoList(int start, int end, String searchCategory, String search) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("start", start);
		map.put("end", end);
		map.put("searchCategory", searchCategory);
		map.put("search", search);

		List<Board> list = session.selectList("adminBoard.getSearchBoardInfoList", map);

		return (ArrayList<Board>) list;
	}

	public int deleteBoardInfo(int boardNo) {
		return session.delete("adminBoard.deleteBoardInfo", boardNo);
	}

	// ******************** FAQ ********************
	public int getTotalFAQInfoCount() {
		return session.selectOne("adminBoard.getTotalFAQInfoCount");
	}

	public int getTotalSearchFAQInfoCount(String searchCategory, String search) {
		HashMap<String, String> map = new HashMap<String, String>();

		map.put("searchCategory", searchCategory);
		map.put("search", search);

		return session.selectOne("adminBoard.getTotalSearchFAQInfoCount", map);
	}

	public FAQ selectFAQInfo(int faqNo) {
		return session.selectOne("adminBoard.selectFAQInfo", faqNo);
	}

	public ArrayList<FAQ> selectFAQInfoList(int start, int end) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();

		map.put("start", start);
		map.put("end", end);

		List<FAQ> list = session.selectList("adminBoard.selectFAQInfoList", map);

		return (ArrayList<FAQ>) list;
	}

	public ArrayList<FAQ> selectSearchFAQInfoList(int start, int end, String searchCategory, String search) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("start", start);
		map.put("end", end);
		map.put("searchCategory", searchCategory);
		map.put("search", search);

		List<FAQ> list = session.selectList("adminBoard.selectSearchFAQInfoList", map);

		return (ArrayList<FAQ>) list;
	}

	public int insertFAQInfo(FAQ faq) {
		return session.insert("adminBoard.insertFAQInfo", faq);
	}

	public int updateFAQInfo(FAQ faq) {
		return session.update("adminBoard.updateFAQInfo", faq);
	}

	public int deleteFAQInfo(int faqNo) {
		return session.delete("adminBoard.deleteFAQInfo", faqNo);
	}

}
