package com.campkok.customer.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.customer.model.dao.CustomerDao;
import com.campkok.customer.model.vo.DmVO;
import com.campkok.customer.model.vo.PointVO;
import com.campkok.customer.model.vo.ReservationVO;
import com.campkok.customer.model.vo.ReviewInfoPageData;
import com.campkok.customer.model.vo.ReviewVO;
import com.campkok.customer.model.vo.UseInfoPageData;
import com.campkok.customer.model.vo.UserVO;

@Service
public class CustomerService {

	@Autowired
	private CustomerDao dao;

	public UserVO selectOneCustomer(int userNo) {
		// TODO Auto-generated method stub
		return dao.selectOneCutomer(userNo);
	}

	public int updateCustomer(UserVO u) {
		// TODO Auto-generated method stub
		return dao.updateCustomer(u);
	}

	public ArrayList<ReservationVO> selectOneReserve(int userNo) {
		// TODO Auto-generated method stub
		return dao.selectOneReserve(userNo);
	}

	public UseInfoPageData reserveList(int reqPage, int userNo) {
		//게시물 구해올 것
		int numPerPage = 8; 	//한 페이지당 게시물 수
		//게시물 10개 가져오기
		int end = reqPage * numPerPage;
		int start = end - numPerPage +1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end",end);
		map.put("userNo",userNo);
		ArrayList<ReservationVO> list = dao.useSelectList(map);
		//pageNavi 제작
		//총 게시물 수
		int totalCount = dao.useTotalCount(userNo);
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
	         pageNavi += "<a href='/reserveAll.do?reqPage="+(pageNo-1)+"&userNo="+userNo+"'><</a>";
	      }
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo != reqPage) {
				pageNavi += "<a href='/reserveAll.do?reqPage="+pageNo+"&userNo="+userNo+"'>"+pageNo+"</a>";
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
	         pageNavi += "<a href='/reserveAll.do?reqPage="+pageNo+"&userNo="+userNo+"'>></a>";
	      }
		UseInfoPageData uipf = new UseInfoPageData(list, pageNavi);
		return uipf;
	}

	public ReviewInfoPageData reviewList(int reqPage, String userId) {
		int numPerPage = 8; 
		int end = reqPage * numPerPage;
		int start = end - numPerPage +1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end",end);
		map.put("userId",userId);
		ArrayList<ReviewVO> list = dao.reviewSelectList(map);
		int totalCount = dao.reviewTotalCount(userId);
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		String pageNavi = "";
		if(pageNo != 1) {
	         pageNavi += "<a href='/review.do?reqPage="+(pageNo-1)+"&userId="+userId+"'><</a>";
	      }
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo != reqPage) {
				pageNavi += "<a href='/review.do?reqPage="+pageNo+"&userId="+userId+"'>"+pageNo+"</a>";
			}else {
				pageNavi += "<span class='selectedPage'>"+pageNo+"</span>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
	         pageNavi += "<a href='/review.do?reqPage="+pageNo+"&userNo="+userId+"'>></a>";
	      }
		ReviewInfoPageData ripf = new ReviewInfoPageData(list, pageNavi);
		return ripf;
	}

	public ArrayList<PointVO> pointList(int userNo) {
		// TODO Auto-generated method stub
		return dao.pointList(userNo);
	}


	public ArrayList<DmVO> selectDMList(String userId) {
		// TODO Auto-generated method stub
		return dao.selectDmList(userId);
	}

	public int insertDM(DmVO dm) {
		// TODO Auto-generated method stub
		return dao.insertDM(dm);
	}

	public int deleteDm(int dmNo) {
		// TODO Auto-generated method stub
		return dao.deleteDm(dmNo);
	}

	public DmVO selectOneDm(int dmNo) {
		// TODO Auto-generated method stub
		return dao.selectOneDm(dmNo); 
	}

	public int updateDm(int dmNo) {
		// TODO Auto-generated method stub
		return dao.updateDm(dmNo);
	}

	public int deleteCustomer(int userNo) {
		// TODO Auto-generated method stub
		return dao.deleteCustomer(userNo);
	}

}
