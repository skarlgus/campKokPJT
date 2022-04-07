package com.campkok.camp.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.camp.notice.model.dao.CampNoticeDao;
import com.campkok.camp.notice.model.vo.CampNoticeVO;
import com.campkok.camp.notice.model.vo.NoticePageData;

@Service
public class CampNoticeService {
	@Autowired
	private CampNoticeDao dao;

	public NoticePageData noticeList(int reqPage) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage +1;
		/*
		 * HashMap<String,Object> map = new HashMap<String,Object>();
		 * map.put("start",start); map.put("end",end); 
		 * ArrayList<CampNoticeVO> list = dao.selectList(map);
		 */
		ArrayList<CampNoticeVO> list = dao.selectList(start,end);
		//pageNavi 제작
		//총 게시물 수 
		int totalCount = dao.totalCount();
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		//페이지네비의 길이
		int pageNaviSize = 5; //1-5까지의 끝번호 변수
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1; //1 - 5까지 출력인데 그중 1의 처음 시작번호를 구하는변수
		//페이지네비 작성
		String pageNavi = "";
		//이전버튼 생성
		if(pageNo != 1) {
			pageNavi += "<a href='/CampNoticeList.do?reqPage="+(pageNo-1)+"'>[이전]</a>";
		}
		for(int i=0; i<pageNaviSize;i++) {
			if(pageNo != reqPage) {
				
				pageNavi += "<a href='CampNoticeList.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}else {
				pageNavi += "<span class='selectedPage'>"+pageNo+"</span>";
			}
			pageNo++;
			if(pageNo >totalPage) {
				break;
			}
		}
		//다음
		if(pageNo <= totalPage) {
			pageNavi += "<a href='/CampNoticeList.do?reqPage="+pageNo+"'>[다음]</a>";
		}
		NoticePageData npd = new NoticePageData(list,pageNavi);
		return npd;
	}
}
