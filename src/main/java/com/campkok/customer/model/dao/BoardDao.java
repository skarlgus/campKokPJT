package com.campkok.customer.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.campkok.customer.model.vo.BoardCommentVO;
import com.campkok.customer.model.vo.BoardVO;

@Repository
public class BoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<BoardVO> boardSelectList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<BoardVO> list = sqlSession.selectList("customer.boardList", map);
		return (ArrayList<BoardVO>) list;
	}

	public int boardTotalCount() {
		// TODO Auto-generated method stub
		List<BoardVO> list = sqlSession.selectList("customer.totalBoard");
		return list.size();
	}

	public BoardVO selectOneBoard(int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("customer.boardView", boardNo);
	}

	public int insertBoard(BoardVO b) {
		// TODO Auto-generated method stub
		return sqlSession.insert("customer.boardInsert", b);
	}

	public int deleteBoard(int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("customer.boardDelete", boardNo);
	}

	public int updateBoard(BoardVO b) {
		// TODO Auto-generated method stub
		int result=sqlSession.update("customer.boardUpdate", b);
		System.out.println(result);
		return sqlSession.update("customer.boardUpdate", b);
	}

	public ArrayList<BoardVO> boardSearchList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<BoardVO> list = sqlSession.selectList("customer.searchList", map);
		return (ArrayList<BoardVO>) list;
	}

	public int searchTotalCount(String keyword) {
		// TODO Auto-generated method stub
		List<BoardVO> list = sqlSession.selectList("customer.searchBoard", keyword);
		return list.size();
	}

	public ArrayList<BoardCommentVO> selectBoardComment(int boardNo) {
		// TODO Auto-generated method stub
		List<BoardCommentVO> list = sqlSession.selectList("customer.boardCommentList", boardNo);
		return (ArrayList<BoardCommentVO>) list;
	}

	public int insertBoardComment(BoardCommentVO bc) {
		// TODO Auto-generated method stub
		return sqlSession.insert("customer.boardCommentInsert", bc);
	}

	public int updateBoardComment(BoardCommentVO bc) {
		// TODO Auto-generated method stub
		return sqlSession.update("customer.boardCommentUpdate", bc);
	}

	public int deleteBoardComment(int boardCommentNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("customer.boardCommentDelete", boardCommentNo);
	}
}
