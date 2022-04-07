package com.campkok.customer.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.customer.model.dao.BoardDao;
import com.campkok.customer.model.vo.BoardCommentVO;
import com.campkok.customer.model.vo.BoardPageData;
import com.campkok.customer.model.vo.BoardVO;
import com.campkok.customer.model.vo.BoardViewData;

@Service
public class BoardService {
	@Autowired BoardDao dao;
	
	public BoardPageData boardList(int reqPage) {
		//게시물 구해올 것
		int numPerPage = 10; 	//한 페이지당 게시물 수
		//게시물 10개 가져오기
		int end = reqPage * numPerPage;
		int start = end - numPerPage +1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end",end);
		ArrayList<BoardVO> list = dao.boardSelectList(map);
		//pageNavi 제작
		//총 게시물 수
		int totalCount = dao.boardTotalCount();
		//총 페이지 수
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		//페이지네비의 길이
		int pageNaviSize = 5;
		//페이지 네비 시작번호
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		//페이지네비 작성
		String pageNavi = "";
		//이전 버튼 생성
		if(pageNo != 1) {
	         pageNavi += "<a href='/boardList.do?reqPage="+(pageNo-1)+"'><</a>";
	      }
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo != reqPage) {
				pageNavi += "<a href='/boardList.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}else {
				pageNavi += "<span class='selectedPage'>"+pageNo+"</span>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		//다음버튼
		if(pageNo <= totalPage) {
	         pageNavi += "<a href='/boardList.do?reqPage="+pageNo+"'>></a>";
	      }
		BoardPageData bpd = new BoardPageData(list, pageNavi);
		return bpd;
	}

	public BoardVO selectOneBoard(int boardNo) {
		// TODO Auto-generated method stub
		return dao.selectOneBoard(boardNo);
	}

	public int insetBoard(BoardVO b) {
		// TODO Auto-generated method stub
		return dao.insertBoard(b);
	}

	public int deleteBoard(int boardNo) {
		// TODO Auto-generated method stub
		return dao.deleteBoard(boardNo);
	}

	public int updateBoard(BoardVO b) {
		// TODO Auto-generated method stub
		int result=dao.updateBoard(b);
		System.out.println(result);
		return result;
	}

	public BoardPageData searchList(int reqPage, String keyword) {
		//게시물 구해올 것
		int numPerPage = 10; 	//한 페이지당 게시물 수
		//게시물 10개 가져오기
		int end = reqPage * numPerPage;
		int start = end - numPerPage +1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end",end);
		map.put("keyword",keyword);
		ArrayList<BoardVO> list = dao.boardSearchList(map);
		//pageNavi 제작
		//총 게시물 수
		int totalCount = dao.searchTotalCount(keyword);
		//총 페이지 수
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		//페이지네비의 길이
		int pageNaviSize = 5;
		//페이지 네비 시작번호
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		//페이지네비 작성
		String pageNavi = "";
		//이전 버튼 생성
		if(pageNo != 1) {
	         pageNavi += "<a href='/searchBoard.do?reqPage="+(pageNo-1)+"'><</a>";
	      }
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo != reqPage) {
				pageNavi += "<a href='/searchBoard.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}else {
				pageNavi += "<span class='selectedPage'>"+pageNo+"</span>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		//다음버튼
		if(pageNo <= totalPage) {
	         pageNavi += "<a href='/searchBoard.do?reqPage="+pageNo+"'>></a>";
	      }
		BoardPageData bpd = new BoardPageData(list, pageNavi);
		return bpd;
	}

	public BoardViewData selectBoardView(int boardNo) {
		// TODO Auto-generated method stub
		BoardVO b = dao.selectOneBoard(boardNo);
		ArrayList<BoardCommentVO> list = dao.selectBoardComment(boardNo);
		BoardViewData bvd = new BoardViewData(b, list);
		return bvd;
	}

	public int insertBoardComment(BoardCommentVO bc) {
		// TODO Auto-generated method stub
		return dao.insertBoardComment(bc);
	}

	public int updateBoardComment(BoardCommentVO bc) {
		// TODO Auto-generated method stub
		return dao.updateBoardComment(bc);
	}

	public int deleteBoardComment(int boardCommentNo) {
		// TODO Auto-generated method stub
		return dao.deleteBoardComment(boardCommentNo);
	}
}
