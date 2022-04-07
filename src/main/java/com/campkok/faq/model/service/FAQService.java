package com.campkok.faq.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.faq.model.dao.FAQDao;
import com.campkok.faq.model.vo.FAQVO;
import com.campkok.faq.model.vo.FAQPageData;

@Service
public class FAQService {

	@Autowired FAQDao dao;

	public FAQPageData selectFAQList(int reqPage, String faqUser) {
		int totalFAQInfo = dao.TotalFAQCount();
		int numPerPage = 10;
		int totalPage = (totalFAQInfo / numPerPage == 0) ? (totalFAQInfo / numPerPage)
				: (totalFAQInfo / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<FAQVO> list = dao.selectFAQList(start, end, faqUser);

		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/FAQList.do?reqPage=" + (pageNo - 1) +"&faqUser="+faqUser+"'>이전</a>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/FAQList.do?reqPage="+pageNo+"&faqUser="+faqUser+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}

		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/FAQList.do?reqPage="+pageNo+"&faqUser="+faqUser+"'>다음</a>";
		}
		FAQPageData fpd = new FAQPageData(list, pageNavi);

		return fpd;
	}

	public FAQVO selectOneFAQ(int faqNo) {
		return dao.selectOneFAQ(faqNo);
	}

	public FAQPageData searchFAQList(int reqPage, String faqUser, String keyword) {
		int totalSearchFAQInfo = dao.totalSearchFAQCount(faqUser, keyword);
		int numPerPage = 10;
		int totalPage = (totalSearchFAQInfo / numPerPage == 0) ? (totalSearchFAQInfo / numPerPage)
				: (totalSearchFAQInfo / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<FAQVO> list = dao.selectAllSearchFAQList(start, end, faqUser, keyword);

		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/FAQList.do?reqPage="+(pageNo-1)+"&faqUser="
					+faqUser+ "&search="+keyword+"'>이전</a>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/selectFAQInfoList.do?reqPage="+pageNo+"&faqUser="
						+faqUser+"&keyword="+keyword+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}

		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/selectFAQInfoList.do?reqPage=" + pageNo + "&faqUser="
					+ faqUser + "&keyword=" + keyword + "'>다음</a>";
		}
		FAQPageData fpd = new FAQPageData(list, pageNavi);

		return fpd;
	}

}
