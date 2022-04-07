package com.campkok.admin.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.campkok.admin.board.model.dao.AdminBoardDao;
import com.campkok.admin.board.model.vo.AdminBoardInfoPageData;
import com.campkok.admin.board.model.vo.AdminFAQInfoPageData;
import com.campkok.admin.board.model.vo.Board;
import com.campkok.admin.board.model.vo.FAQ;

@Service
public class AdminBoardService {
	@Autowired
	private AdminBoardDao dao;

	// ******************** Board ********************
	public Board selectBoardInfo(int boardNo) {
		return dao.selectBoardInfo(boardNo);
	}

	public ArrayList<Board> selectBoardInfoList(int start, int end) {
		return dao.selectBoardInfoList(start, end);
	}

	public AdminBoardInfoPageData selectBoardInfoList(int reqPage) {
		int totalBoardInfo = dao.getTotalBoardInfoCount();
		int numPerPage = 10;
		int totalPage = (totalBoardInfo / numPerPage == 0) ? (totalBoardInfo / numPerPage)
				: (totalBoardInfo / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<Board> list = dao.selectBoardInfoList(start, end);

		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/selectBoardInfoList.do?reqPage=" + (pageNo - 1) + "'>이전</a>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/selectBoardInfoList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}

		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/selectBoardInfoList.do?reqPage=" + pageNo + "'>다음</a>";
		}
		AdminBoardInfoPageData abipd = new AdminBoardInfoPageData(list, pageNavi);

		return abipd;
	}

	public AdminBoardInfoPageData searchBoardInfoList(int reqPage, String searchCategory, String search) {
		int totalSearchBoardInfo = dao.getTotalSearchBoardInfoCount(searchCategory, search);
		int numPerPage = 10;
		int totalPage = (totalSearchBoardInfo / numPerPage == 0) ? (totalSearchBoardInfo / numPerPage)
				: (totalSearchBoardInfo / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<Board> list = dao.selectBoardInfoList(start, end, searchCategory, search);

		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/selectBoardInfoList.do?reqPage=" + (pageNo - 1) + "&searchCategory="
					+ searchCategory + "&search=" + search + "'>이전</a>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/selectBoardInfoList.do?reqPage=" + pageNo + "&searchCategory="
						+ searchCategory + "&search=" + search + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}

		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/selectBoardInfoList.do?reqPage=" + pageNo + "&searchCategory="
					+ searchCategory + "&search=" + search + "'>다음</a>";
		}
		AdminBoardInfoPageData abipd = new AdminBoardInfoPageData(list, pageNavi);

		return abipd;
	}

	@Transactional
	public int deleteBoardInfo(int boardNo) {
		return dao.deleteBoardInfo(boardNo);
	}

	// ******************** FAQ ********************
	public FAQ selectFAQInfo(int faqNo) {
		return dao.selectFAQInfo(faqNo);
	}

	public AdminFAQInfoPageData selectFAQInfoList(int reqPage) {
		int totalFAQInfo = dao.getTotalFAQInfoCount();
		int numPerPage = 10;
		int totalPage = (totalFAQInfo / numPerPage == 0) ? (totalFAQInfo / numPerPage)
				: (totalFAQInfo / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<FAQ> list = dao.selectFAQInfoList(start, end);

		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/selectFAQInfoList.do?reqPage=" + (pageNo - 1) + "'>이전</a>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/selectFAQInfoList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}

		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/selectFAQInfoList.do?reqPage=" + pageNo + "'>다음</a>";
		}
		AdminFAQInfoPageData afipd = new AdminFAQInfoPageData(list, pageNavi);

		return afipd;
	}

	public AdminFAQInfoPageData searchFAQInfoList(int reqPage, String searchCategory, String search) {
		int totalSearchFAQInfo = dao.getTotalSearchFAQInfoCount(searchCategory, search);
		int numPerPage = 10;
		int totalPage = (totalSearchFAQInfo / numPerPage == 0) ? (totalSearchFAQInfo / numPerPage)
				: (totalSearchFAQInfo / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<FAQ> list = dao.selectSearchFAQInfoList(start, end, searchCategory, search);

		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/selectFAQInfoList.do?reqPage=" + (pageNo - 1) + "&searchCategory="
					+ searchCategory + "&search=" + search + "'>이전</a>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/selectFAQInfoList.do?reqPage=" + pageNo + "&searchCategory="
						+ searchCategory + "&search=" + search + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}

		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/selectFAQInfoList.do?reqPage=" + pageNo + "&searchCategory="
					+ searchCategory + "&search=" + search + "'>다음</a>";
		}
		AdminFAQInfoPageData afipd = new AdminFAQInfoPageData(list, pageNavi);

		return afipd;
	}

	@Transactional
	public int insertFAQInfo(FAQ faq) {
		return dao.insertFAQInfo(faq);
	}

	@Transactional
	public int updateFAQInfo(FAQ faq) {
		return dao.updateFAQInfo(faq);
	}

	@Transactional
	public int deleteFAQInfo(int faqNo) {
		return dao.deleteFAQInfo(faqNo);
	}

}
