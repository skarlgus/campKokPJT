package com.campkok.admin.user.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.campkok.admin.camp.model.dao.AdminCampDao;
import com.campkok.admin.camp.model.vo.Camp;
import com.campkok.admin.camp.model.vo.CampFile;
import com.campkok.admin.user.model.dao.AdminUserDao;
import com.campkok.admin.user.model.vo.AdminUserInfoPageData;
import com.campkok.admin.user.model.vo.User;

@Service
public class AdminUserService {
	@Autowired
	private AdminUserDao dao;
	@Autowired
	private AdminCampDao campDao;

	// ********** Client Info **********
	public User selectClientInfo(int userNo) {
		return dao.selectClientInfo(userNo);
	}

	public ArrayList<User> selectClientInfoList(int start, int end) {
		return dao.selectClientInfoList(start, end);
	}

	public AdminUserInfoPageData selectClientInfoList(int reqPage) {
		int totalClientInfo = dao.getTotalClientInfo();
		int numPerPage = 10;
		int totalPage = (totalClientInfo / numPerPage == 0) ? (totalClientInfo / numPerPage)
				: (totalClientInfo / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<User> list = dao.selectClientInfoList(start, end);

		// 페이징 처리
		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		// 이전 버튼 만들기
		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/selectClientInfoList.do?reqPage=" + (pageNo - 1) + "'>이전</a>";
		}

		// 숫자 버튼 만들기
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/selectClientInfoList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}

		// 다음 버튼 만들기
		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/selectClientInfoList.do?reqPage=" + pageNo + "'>다음</a>";
		}
		AdminUserInfoPageData auipd = new AdminUserInfoPageData(list, pageNavi);

		return auipd;
	}

	public AdminUserInfoPageData searchClientInfoList(int reqPage, String searchCategory, String search) {
		int totalSearchClientInfo = dao.getTotalSearchClientInfo(searchCategory, search);
		int numPerPage = 10;
		int totalPage = (totalSearchClientInfo / numPerPage == 0) ? (totalSearchClientInfo / numPerPage)
				: (totalSearchClientInfo / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<User> list = dao.getSearchClientInfoList(start, end, searchCategory, search);

		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/searchClientInfo.do?reqPage=" + (pageNo - 1) + "&searchCategory="
					+ searchCategory + "&search=" + search + "'>이전</a>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/searchClientInfo.do?reqPage=" + pageNo + "&searchCategory="
						+ searchCategory + "&search=" + search + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}

		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/searchClientInfo.do?reqPage=" + pageNo + "&searchCategory="
					+ searchCategory + "&search=" + search + "'>다음</a>";
		}
		AdminUserInfoPageData auipd = new AdminUserInfoPageData(list, pageNavi);

		return auipd;
	}

	@Transactional
	public int updateClientInfo(User clientInfo) {
		return dao.updateClientInfo(clientInfo);
	}

	@Transactional
	public int deleteClientInfo(int userNo) {
		return dao.deleteClientInfo(userNo);
	}

	// ********** CEO Info **********
	public User selectCeoInfo(int userNo) {
		User ceoInfo = dao.selectCeoInfo(userNo);
		Camp camp = campDao.selectCampInfo(ceoInfo.getUserId());

		if (camp != null) {
			ArrayList<CampFile> campFiles = campDao.selectCampFiles(camp.getCampNo());

			camp.setCampFiles(campFiles);
			ceoInfo.setCamp(camp);
		}

		return ceoInfo;
	}

	public ArrayList<User> selectCeoInfoList(int start, int end) {
		return dao.selectCeoInfoList(start, end);
	}

	public AdminUserInfoPageData selectCeoInfoList(int reqPage) {
		int totalCeoInfo = dao.getTotalCeoInfo();
		int numPerPage = 10;
		int totalPage = (totalCeoInfo / numPerPage) == 0 ? (totalCeoInfo / numPerPage)
				: (totalCeoInfo / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<User> list = dao.selectCeoInfoList(start, end);

		for (User user : list) {
			Camp camp = campDao.selectCampInfo(user.getUserId());

			user.setCamp(camp);
		}

		// 페이징
		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		// 이전버튼 만들기
		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/selectCeoInfoList.do?reqPage=" + (pageNo - 1) + "'>이전</a>";
		}

		// 숫자 버튼 만들기
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/selectCeoInfoList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;

			if (pageNo > totalPage)
				break;
		}

		// 다음 버튼 만들기
		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/selectCeoInfoList.do?reqPage=" + pageNo + "'>다음</a>";
		}
		AdminUserInfoPageData auipd = new AdminUserInfoPageData(list, pageNavi);

		return auipd;
	}

	public AdminUserInfoPageData searchCeoInfoList(int reqPage, String searchCategory, String search) {
		int totalSearchCeoInfo = dao.getSearchCeoInfoCount(searchCategory, search);
		int numPerPage = 10;
		int totalPage = (totalSearchCeoInfo / numPerPage == 0) ? (totalSearchCeoInfo / numPerPage)
				: (totalSearchCeoInfo / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<User> list = dao.getSearchCeoInfoList(start, end, searchCategory, search);

		for (User user : list) {
			Camp camp = campDao.selectCampInfo(user.getUserId());

			user.setCamp(camp);
		}

		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/searchCeoInfo.do?reqPage=" + (pageNo - 1) + "&searchCategory="
					+ searchCategory + "&search=" + search + "'>이전</a>'";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/searchCeoInfo.do?reqPage=" + pageNo + "&searchCategory="
						+ searchCategory + "&search=" + search + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}

		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/searchCeoInfo.do?reqPage=" + pageNo + "&searchCategory=" + searchCategory
					+ "&search=" + search + "'>다음</a>";
		}
		AdminUserInfoPageData auipd = new AdminUserInfoPageData(list, pageNavi);

		return auipd;
	}

	@Transactional
	public int updateCeoInfo(User ceoInfo) {
		return dao.updateCeoInfo(ceoInfo);
	}

	@Transactional
	public int deleteCeoInfo(int userNo) {
		return dao.deleteCeoInfo(userNo);
	}
}
