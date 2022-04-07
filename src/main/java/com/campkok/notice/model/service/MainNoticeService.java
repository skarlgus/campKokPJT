package com.campkok.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.admin.notice.model.dao.AdminNoticeDao;
import com.campkok.admin.notice.model.vo.CeoNotice;
import com.campkok.admin.notice.model.vo.CeoNoticePageData;
import com.campkok.admin.notice.model.vo.ClientNotice;
import com.campkok.admin.notice.model.vo.ClientNoticePageData;

@Service
public class MainNoticeService {
	@Autowired
	private AdminNoticeDao adminDao;
	
	public ClientNoticePageData selectClientNoticeList(int reqPage) {
		int totalClientNotice = adminDao.getTotalClientNotice();
		int numPerPage = 10;
		int totalPage = (totalClientNotice / numPerPage == 0) ? (totalClientNotice / numPerPage)
				: (totalClientNotice / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<ClientNotice> list = adminDao.selectClientNoticeList(start, end);

		// 페이징 처리
		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		// 이전 버튼 만들기
		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/customerNoticeList.do?reqPage=" + (pageNo - 1) + "'>이전</a>";
		}

		// 숫자 버튼 만들기
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/customerNoticeList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}

		// 다음 버튼 만들기
		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/customerNoticeList.do?reqPage=" + pageNo + "'>다음</a>";
		}

		ClientNoticePageData cnpd = new ClientNoticePageData(list, pageNavi);

		return cnpd;
	}

	public CeoNoticePageData selectMainCeoNoticeList(int reqPage) {
		int totalCeoNotice = adminDao.getTotalCeoNotice();
		int numPerPage = 10;
		int totalPage = (totalCeoNotice / numPerPage == 0) ? (totalCeoNotice / numPerPage)
				: (totalCeoNotice / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<CeoNotice> list = adminDao.selectCeoNoticeList(start, end);

		// 페이징 처리
		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		// 이전버튼 만들기
		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/mainCeoNoticeList.do?reqPage=" + (pageNo - 1) + "'>이전</a>";
		}

		// 숫자 버튼 만들기
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/mainCeoNoticeList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}

		// 다음 버튼 만들기
		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/mainCeoNoticeList.do?reqPage=" + pageNo + "'>다음</a>";
		}
		CeoNoticePageData cnpd = new CeoNoticePageData(list, pageNavi);

		return cnpd;
	}

}
