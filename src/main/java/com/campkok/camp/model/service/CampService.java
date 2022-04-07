package com.campkok.camp.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.admin.notice.model.vo.ClientNotice;
import com.campkok.camp.model.dao.CampDao;
import com.campkok.camp.model.vo.CampEnv;
import com.campkok.camp.model.vo.CampNoticePageData;
import com.campkok.camp.model.vo.CampNoticeVO;
import com.campkok.camp.model.vo.CampResVO;
import com.campkok.camp.model.vo.CampRoomVO;
import com.campkok.camp.model.vo.CampVO;
import com.campkok.camp.model.vo.FileTBL;
import com.campkok.camp.model.vo.Rent;
import com.campkok.camp.model.vo.ReviewVO;
import com.campkok.camp.model.vo.UserVO;

@Service
public class CampService {
	@Autowired
	private CampDao dao;

	public CampRoomVO selectRoomInfo(int roomNo) {
		return dao.selectRoomInfo(roomNo);
	}

	public CampVO selectCampInfo(int campNo) {
		return dao.selectCampInfo(campNo);
	}

	public int campRes(int userNo, int campNo, int campRoomNo, String resInDate, String resOutDate, int resMember,
			int resPrice, String resMemo) {
		String resInTime = "15:00";
		String resOutTime = "10:00";
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("userNo",userNo);
		map.put("campNo",campNo);
		map.put("campRoomNo",campRoomNo);
		map.put("resInDate",resInDate);
		map.put("resOutDate",resOutDate);
		map.put("resMember",resMember);
		map.put("resPrice",resPrice);
		map.put("resMemo",resMemo);
		map.put("resInTime",resInTime);
		map.put("resOutTime",resOutTime);
		return dao.campRes(map);
	}

	public UserVO selectUserPoint(int userNo) {
		return dao.selectUserPoint(userNo);
	}

	public int userPointUpdate(int userNo, int userUsePoint) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("userNo",userNo);
		map.put("userUsePoint",userUsePoint);
		return dao.userPointUpdate(map);	
	}

	public int totalPoint(int userNo) {
		return dao.totalPoint(userNo);
	}

	public int pointUpdate(int userNo, int totalPoint, int userUsePoint) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("userNo",userNo);
		map.put("userUsePoint",userUsePoint);
		map.put("totalPoint",totalPoint);
		return dao.pointUpdate(map);
	}

	public int insertComment(String userId, int campNo, String revContents) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("userId",userId);
		map.put("campNo",campNo);
		map.put("revContents", revContents);
		return dao.insertComment(map);
	}

	public ArrayList<ReviewVO> selectAllComment(int campNo) {
		return dao.selectAllComment(campNo);
	}

	public CampNoticePageData selectCampNoticeList(int reqPage) {
		int totalCampNotice = dao.getTotalCampNotice();
		int numPerPage = 10;
		int totalPage = (totalCampNotice / numPerPage == 0) ? (totalCampNotice / numPerPage)
				: (totalCampNotice / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;
		
		ArrayList<CampNoticeVO> list = dao.selectCampNoticeList(start, end);
		
		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		
		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/camp/campNotice2.do?reqPage=" + (pageNo - 1) + "'>[����]</a>";
		}
		
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/camp/campNotice2.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}
		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/camp/campNotice2.do?reqPage=" + pageNo + "'>[����]</a>";
		}
		
		CampNoticePageData npd = new CampNoticePageData(list,pageNavi);
		return npd;
		
		
	}

	public CampNoticeVO selectCampNotice(int campNoticeNo) {
		return dao.selectCampNotice(campNoticeNo);
	}

	public ArrayList<CampResVO> selectCampResList(int roomNo) {
		return dao.selectCampResList(roomNo);
	}

	public int commentDelete(int revNo) {
		return dao.commentDelete(revNo);
	}

	public int commentUpdate(int revNo) {
		return dao.commentUpdate(revNo);
	}

	public UserVO selectUser(String userId) {
		// TODO Auto-generated method stub
		return dao.selectUserPoint(userId);
	}

	public int insertPoint(int userNo, int pointTotal) {
		HashMap<String, Object> map = new HashMap<String,Object>();
		map.put("userNo",userNo);
		map.put("pointTotal",pointTotal);
		return dao.insertPoint(map);
	}

	public int updateUserPoint(int userNo) {
		// TODO Auto-generated method stub
		return dao.updateUserPoint(userNo);
	}
		
	public UserVO selectOneUser(int userNo) {
		
		return dao.selectOneUser(userNo);
	}

	public int insertCamp(CampVO c) {
		// TODO Auto-generated method stub
		return dao.insertCamp(c);
	}

	public CampVO selectOneCamp(String userId) {
		// TODO Auto-generated method stub
		return dao.selectOneCamp(userId);
	}

	public int insertCampEnv(CampEnv ce) {
		// TODO Auto-generated method stub
		return dao.insertCampEnv(ce);
	}

	public int insertCampSeq() {
		// TODO Auto-generated method stub
		return dao.insertCampSeq();
	}

	public int insertRent(Rent r) {
		// TODO Auto-generated method stub
		return dao.insertRent(r);
	}

	public int insertFileTBL(FileTBL ft) {
		// TODO Auto-generated method stub
		return dao.insertFileTBL(ft);
	}



}
