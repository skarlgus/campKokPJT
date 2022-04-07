package com.campkok.admin.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.campkok.admin.notice.model.dao.AdminNoticeDao;
import com.campkok.admin.notice.model.vo.CeoNotice;
import com.campkok.admin.notice.model.vo.CeoNoticePageData;
import com.campkok.admin.notice.model.vo.ClientNotice;
import com.campkok.admin.notice.model.vo.ClientNoticePageData;
import com.campkok.admin.notice.model.vo.Notice;

@Service
public class AdminNoticeService {
	@Autowired
	private AdminNoticeDao dao;

	public CeoNotice selectCeoNotice(int ceoNoticeNo) {
		CeoNotice notice = dao.selectCeoNotice(ceoNoticeNo);

		return notice;
	}

	public ArrayList<CeoNotice> selectCeoNoticeList(int start, int end) {
		return dao.selectCeoNoticeList(start, end);
	}

	public CeoNoticePageData selectCeoNoticeList(int reqPage) {
		int totalCeoNotice = dao.getTotalCeoNotice();
		int numPerPage = 10;
		int totalPage = (totalCeoNotice / numPerPage == 0) ? (totalCeoNotice / numPerPage)
				: (totalCeoNotice / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<CeoNotice> list = dao.selectCeoNoticeList(start, end);

		// 페이징 처리
		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		// 이전버튼 만들기
		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/selectCeoNoticeList.do?reqPage=" + (pageNo - 1) + "'>이전</a>";
		}

		// 숫자 버튼 만들기
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/selectCeoNoticeList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}

		// 다음 버튼 만들기
		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/selectCeoNoticeList.do?reqPage=" + pageNo + "'>다음</a>";
		}
		CeoNoticePageData cnpd = new CeoNoticePageData(list, pageNavi);

		return cnpd;
	}

	public CeoNoticePageData searchCeoNoticeList(int reqPage, String searchCategory, String search) {
		int totalSearchCeoNotice = dao.getTotalSearchCeoNotice(searchCategory, search);
		int numPerPage = 10;
		int totalPage = (totalSearchCeoNotice / numPerPage == 0) ? (totalSearchCeoNotice / numPerPage)
				: (totalSearchCeoNotice / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<CeoNotice> list = dao.searchCeoNoticeList(start, end, searchCategory, search);
		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/searchCeoNotice.do?reqPage=" + (pageNo - 1) + "&searchCategory="
					+ searchCategory + "&search=" + search + "'>이전</a>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/searchCeoNotice.do?reqPage=" + pageNo + "&searchCategory="
						+ searchCategory + "&search=" + search + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}

		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/searchCeoNotice.do?reqPage=" + pageNo + "&searchCategory="
					+ searchCategory + "&search=" + search + "'>다음</a>";
		}
		CeoNoticePageData cnpd = new CeoNoticePageData(list, pageNavi);

		return cnpd;
	}

	@Transactional
	public int insertNotice(Notice notice) {
		int result = dao.insertNotice(notice);

		return result;
	}

	@Transactional
	public int updateCeoNotice(CeoNotice ceoNotice) {
		return dao.updateCeoNotice(ceoNotice);
	}

	@Transactional
	public int deleteCeoNotice(int ceoNoticeNo) {
		int result = dao.deleteCeoNotice(ceoNoticeNo);

		return result;
	}

	// *********************************************************************************************************
	public ClientNoticePageData searchClientNotice(int reqPage, String searchCategory, String search) {
		int totalSearchClientNotice = dao.getTotalClientNoticeCount(searchCategory, search);
		int numPerPage = 10;
		int totalPage = (totalSearchClientNotice / numPerPage == 0) ? (totalSearchClientNotice / numPerPage)
				: (totalSearchClientNotice / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<ClientNotice> list = dao.searchClientNoticeList(start, end, searchCategory, search);

		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/searchClientNotice.do?reqPage=" + (pageNo - 1) + "&searchCategory="
					+ searchCategory + "&search=" + search + "'>이전</a>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/searchClientNotice.do?reqPage=" + pageNo + "&searchCategory="
						+ searchCategory + "&search=" + search + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}

		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/searchClientNotice.do?reqPage=" + pageNo + "&searchCategory="
					+ searchCategory + "&search=" + search + "'>다음</a>";
		}
		ClientNoticePageData cnpd = new ClientNoticePageData(list, pageNavi);

		return cnpd;
	}

	public ClientNotice selectClientNotice(int clientNoticeNo) {
		return dao.selectClientNotice(clientNoticeNo);
	}

	public ArrayList<ClientNotice> selectClientNoticeList(int start, int end) {
		return dao.selectClientNoticeList(start, end);
	}

	public ClientNoticePageData selectClientNoticeList(int reqPage) {
		int totalClientNotice = dao.getTotalClientNotice();
		int numPerPage = 10;
		int totalPage = (totalClientNotice / numPerPage == 0) ? (totalClientNotice / numPerPage)
				: (totalClientNotice / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<ClientNotice> list = dao.selectClientNoticeList(start, end);

		// 페이징 처리
		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		// 이전 버튼 만들기
		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/selectClientNoticeList.do?reqPage=" + (pageNo - 1) + "'>이전</a>";
		}

		// 숫자 버튼 만들기
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/selectClientNoticeList.do?reqPage=" + pageNo + "'>" + pageNo
						+ "</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}

		// 다음 버튼 만들기
		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/selectClientNoticeList.do?reqPage=" + pageNo + "'>다음</a>";
		}

		ClientNoticePageData cnpd = new ClientNoticePageData(list, pageNavi);

		return cnpd;
	}

	@Transactional
	public int updateClientNotice(ClientNotice clientNotice) {
		return dao.updateClientNotice(clientNotice);
	}

	@Transactional
	public int deleteClientNotice(int clientNoticeNo) {
		return dao.deleteClientNotice(clientNoticeNo);
	}

}
