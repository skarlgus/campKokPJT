package com.campkok.camplist.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.admin.camp.model.vo.CampFile;
import com.campkok.camp.model.vo.ReviewVO;
import com.campkok.camp.notice.model.vo.CampNoticeVO;
import com.campkok.camplist.model.dao.CampListDao;
import com.campkok.camplist.model.vo.CampList;
import com.campkok.camplist.model.vo.CampListPageData;
import com.campkok.camplist.model.vo.CampRoomList;

@Service
public class CampListService {

	@Autowired
	private CampListDao dao;
	
	// 罹좏븨�옣 由ъ뒪�듃
	public CampListPageData campList(int reqPage) {
		int numPerPage = 12;	// �븳 �럹�씠吏��떦 寃뚯떆臾� �닔
		// 1 : 1~12, 2 : 13~24, 3 : 25~37
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		ArrayList<CampList> list = dao.selectList(start,end);
		
		/****** pageNavi ******/
		int totalCount = dao.totalCount();	// 珥� 寃뚯떆臾� �닔
		int totalPage = 0;	// 珥� �럹�씠吏� �닔
		
		// 109媛쒖씪 寃쎌슦 11�럹�씠吏� 蹂댁뿬二쇨퀬, 100媛쒕㈃ 10�럹�씠吏� 蹂댁뿬二쇰뒗 肄붾뱶
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		
		// pageNavi 湲몄씠
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		// 10/5 2  10  11 
		
		// pageNavi �옉�꽦
		String pageNavi = "";
		
		// �씠�쟾踰꾪듉
		if(pageNo != 1) {
			pageNavi += "<a href='/campList.do?reqPage="+(pageNo-1)+"'>�씠�쟾</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo != reqPage) {
				pageNavi += "<a href='campList.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}else {
				pageNavi += "<span class='selectedPage'>"+pageNo+"</span>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		
		// �떎�쓬踰꾪듉
		if(pageNo <= totalPage) {
			pageNavi += "<a href='/campList.do?reqPage="+pageNo+"'>�떎�쓬</a>";
		}
		CampListPageData clpd = new CampListPageData(list, pageNavi);
		return clpd;
	}
	
	// 罹좏븨�옣 �긽�꽭 �럹�씠吏�
	public CampList selectOneCamp(int campNo) {
		CampList cl = dao.selectOneCamp(campNo);
		ArrayList<CampFile> campFiles = dao.selectCampFiles(campNo);
		cl.setCampFiles(campFiles);
		return cl;
	}

	// 罹좏븨�옣 寃��깋
	public CampListPageData searchCampList(int reqPage, String searchSelect, String keyword) {
		int numPerPage = 12;	// �븳 �럹�씠吏��떦 寃뚯떆臾� �닔
		// 1 : 1~12, 2 : 13~24, 3 : 25~37
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		ArrayList<CampList> list = dao.searchCampList(start,end,searchSelect,keyword);
		
		/****** pageNavi ******/
		int totalSearchCampList = dao.totalSerchCampList(searchSelect, keyword);	// 寃��깋 �맂 罹좏븨�옣 珥� 媛쒖닔
		int totalPage = 0;	// 珥� �럹�씠吏� �닔
		
		// 109媛쒖씪 寃쎌슦 11�럹�씠吏� 蹂댁뿬二쇨퀬, 100媛쒕㈃ 10�럹�씠吏� 蹂댁뿬二쇰뒗 肄붾뱶
		if(totalSearchCampList%numPerPage == 0) {
			totalPage = totalSearchCampList/numPerPage;
		}else {
			totalPage = totalSearchCampList/numPerPage+1;
		}
		
		// pageNavi 湲몄씠
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
				
		// pageNavi �옉�꽦
		String pageNavi = "";
		
		// �씠�쟾踰꾪듉
		if(pageNo != 1) {
			pageNavi += "<a href='/campList.do?reqPage="+(pageNo-1)+"&searchSelect="+searchSelect+"&keyword="+keyword+"'>�씠�쟾</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo != reqPage) {
				pageNavi += "<a href='campList.do?reqPage="+pageNo+"&searchSelect="+searchSelect+"&keyword="+keyword+"'>"+pageNo+"</a>";
			}else {
				pageNavi += "<span class='selectedPage'>"+pageNo+"</span>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		
		// �떎�쓬踰꾪듉
		if(pageNo <= totalPage) {
			pageNavi += "<a href='/campList.do?reqPage="+pageNo+"&searchSelect="+searchSelect+"&keyword="+keyword+"'>�떎�쓬</a>";
		}
		CampListPageData clpd = new CampListPageData(list, pageNavi);
		return clpd;
	}

	public ArrayList<CampList> mainAdCampList() {
		return dao.mainAdCampList();
	}

	public ArrayList<CampList> mainNewCampList() {
		return dao.mainNewCampList();
	}

	public ArrayList<CampList> mainCampRanking() {
		return dao.mainCampRanking();
	}

	public ArrayList<CampNoticeVO> selectCampNoticeList(int campNo) {
		return dao.selectCampNoticeList(campNo);
	}

	public ArrayList<ReviewVO> selectCampReviewList(int campNo) {
		return dao.selectCampReviewList(campNo);
	}

	public ArrayList<CampRoomList> campRoomList(int campNo) {
		return dao.campRoomList(campNo);
	}



}
