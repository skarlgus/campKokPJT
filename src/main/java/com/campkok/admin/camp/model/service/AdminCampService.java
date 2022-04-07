package com.campkok.admin.camp.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.campkok.admin.camp.model.dao.AdminCampDao;
import com.campkok.admin.camp.model.vo.AdminCampInfoPageData;
import com.campkok.admin.camp.model.vo.Camp;
import com.campkok.admin.camp.model.vo.CampEnv;
import com.campkok.admin.camp.model.vo.CampFile;
import com.campkok.admin.camp.model.vo.CampFiles;
import com.campkok.admin.user.model.dao.AdminUserDao;
import com.campkok.admin.user.model.vo.User;

@Service
public class AdminCampService {
	@Autowired
	private AdminCampDao dao;
	@Autowired
	private AdminUserDao userDao;

	/* 
	 * ***************************************************************************
	 * Camp Info List
	 * ***************************************************************************
	*/
	public Camp selectCampInfo(int campNo) {
		Camp campInfo = dao.selectCampInfo(campNo);

		campInfo.setCampEnv(dao.selectCampEnvInfo(campNo));
		campInfo.setCampFiles(dao.selectCampFiles(campNo));
		campInfo.setCeoInfo(userDao.selectCeoInfo(campInfo.getCeoId()));

		return campInfo;
	}

	public ArrayList<Camp> selectCampInfoList(int start, int end) {
		return dao.selectCampInfoList(start, end);
	}

	public AdminCampInfoPageData selectCampInfoList(int reqPage) {
		int totalCamp = dao.getTotalCampCount();
		int numPerPage = 10;
		int totalPage = (totalCamp / numPerPage == 0) ? (totalCamp / numPerPage) : (totalCamp / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<Camp> list = dao.selectCampInfoList(start, end);

		if (!list.isEmpty()) {
			for (Camp camp : list) {
				User ceoInfo = userDao.selectCeoInfo(camp.getCeoId());

				camp.setCeoInfo(ceoInfo);
			}
		}

		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/selectCampInfoList.do?reqPage=" + (pageNo - 1) + "'>이전</a>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/selectCampInfoList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}

		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/selectCampInfoList.do?reqPage=" + pageNo + "'>다음</a>";
		}
		AdminCampInfoPageData acipd = new AdminCampInfoPageData(list, pageNavi);

		return acipd;
	}

	public AdminCampInfoPageData searchCampInfoList(int reqPage, String searchCategory, String search) {
		int totalSearchCampInfo = dao.getTotalSearchCampCount(searchCategory, search);
		int numPerPage = 10;
		int totalPage = (totalSearchCampInfo / numPerPage == 0) ? (totalSearchCampInfo / numPerPage)
				: (totalSearchCampInfo / numPerPage) + 1;
		int start = (reqPage - 1) / numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<Camp> list = dao.searchCampInfoList(start, end, searchCategory, search);

		if (!list.isEmpty()) {
			for (Camp camp : list) {
				User user = userDao.selectCeoInfo(camp.getCeoId());

				camp.setCeoInfo(user);
			}
		}

		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/searchCampInfoList.do?reqPage=" + (pageNo - 1) + "&searchCategory="
					+ searchCategory + "&search=" + search + "'>이전</a>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/searchCampInfoList.do?reqPage=" + pageNo + "&searchCategory="
						+ searchCategory + "&search=" + search + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}

		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/searchCampInfoList.do?reqPage=" + pageNo + "&searchCategory="
					+ searchCategory + "&search=" + search + "'>다음</a>";
		}
		AdminCampInfoPageData acipd = new AdminCampInfoPageData(list, pageNavi);

		return acipd;
	}

	@Transactional
	public int insertCampInfo(Camp camp) {
		int result = dao.insertCampInfo(camp);

		return result;
	}

	@Transactional
	// camp : 신규 등록 대기 중인 캠핑장
	// campFiles : 신규 등록 대기 중인 캠핑장 이미지
	public int insertCampFile(Camp camp, CampFiles campFiles) {
		Camp realCampInfo = dao.selectCampInfo(camp.getCeoId()); // 신규 등록 대기중인 사장님 아이디를 가지고 실제 등록된 테이블의 캠핑장 정보 얻음
		int result = 0;
		String[] fileNames = campFiles.getCampFileName();
		String[] filePaths = campFiles.getCampFilePath();

		if (campFiles.getCampFileName() != null && campFiles.getCampFilePath() != null) {
			int fileLength = campFiles.getCampFilePath().length; // 파일 갯수

			for (int i = 0; i < fileLength; i++) {
				CampFile campFile = new CampFile(realCampInfo.getCampNo(), fileNames[i], filePaths[i]);

				result = dao.insertCampFiles(campFile);
			}
		} else {
			CampFile campFile = new CampFile(realCampInfo.getCampNo(), null, null);
			result = dao.insertCampFiles(campFile);
		}
		return result;
	}

	@Transactional
	public int insertCampEnv(Camp camp, CampEnv campEnv) {
		Camp realCampInfo = dao.selectCampInfo(camp.getCeoId());
		campEnv.setCampNo(realCampInfo.getCampNo());
		int result = dao.insertCampEnv(campEnv);

		return result;
	}

	@Transactional
	public int deleteCampInfo(int campNo) {
		return dao.deleteCampInfo(campNo);
	}

	/* 
	 * ***************************************************************************
	 * Temp Camp Info List
	 * ***************************************************************************
	*/
	public int getTempCampCount() {
		return dao.getTempCampCount();
	}

	public Camp selectTempCampInfo(int campNo) {
		Camp campInfo = dao.selectTempCampInfo(campNo);

		campInfo.setCampEnv(dao.selectTempCampEnv(campNo));
		campInfo.setCampFiles(dao.selectTempCampFiles(campNo));
		campInfo.setCeoInfo(userDao.selectCeoInfo(campInfo.getCeoId()));

		return campInfo;
	}

	public AdminCampInfoPageData selectTempCampList(int reqPage) {
		int totalTempCamp = dao.getTotalTempCampCount();
		int numPerPage = 10;
		int totalPage = (totalTempCamp / numPerPage) == 0 ? (totalTempCamp / numPerPage)
				: (totalTempCamp / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<Camp> list = dao.selectTempCampInfoList(start, end);

		if (!list.isEmpty()) {
			for (Camp camp : list) {
				User user = userDao.selectCeoInfo(camp.getCeoId());

				camp.setCeoInfo(user);
			}
		}

		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/selectTempCampInfoList.do?reqPage=" + (pageNo - 1) + "'>이전</a>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/selectTempCampInfoList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}

		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/selectTempCampInfoList.do?reqPage=" + pageNo + "'>다음</a>";
		}
		AdminCampInfoPageData acipd = new AdminCampInfoPageData(list, pageNavi);

		return acipd;
	}

	public AdminCampInfoPageData searchTempCampInfoList(int reqPage, String searchCategory, String search) {
		int totalSearchTempCampInfo = dao.getTotalSearchTempCampCount(searchCategory, search);
		int numPerPage = 10;
		int totalPage = (totalSearchTempCampInfo / numPerPage == 0) ? (totalSearchTempCampInfo / numPerPage)
				: (totalSearchTempCampInfo / numPerPage) + 1;
		int start = (reqPage - 1) / numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<Camp> list = dao.searchTempCampInfoList(start, end, searchCategory, search);

		if (!list.isEmpty()) {
			for (Camp camp : list) {
				User user = userDao.selectCeoInfo(camp.getCeoId());

				camp.setCeoInfo(user);
			}
		}

		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/searchTempCampInfoList.do?reqPage=" + (pageNo - 1) + "&searchCategory="
					+ searchCategory + "&search=" + search + "'>이전</a>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/searchTempCampInfoList.do?reqPage=" + pageNo + "&searchCategory="
						+ searchCategory + "&search=" + search + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}

		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/searchTempCampInfoList.do?reqPage=" + pageNo + "&searchCategory="
					+ searchCategory + "&search=" + search + "'>다음</a>";
		}
		AdminCampInfoPageData acipd = new AdminCampInfoPageData(list, pageNavi);

		return acipd;
	}

	@Transactional
	public int deleteTempCampInfo(int campNo) {
		return dao.deleteTempCampInfo(campNo);
	}

}
