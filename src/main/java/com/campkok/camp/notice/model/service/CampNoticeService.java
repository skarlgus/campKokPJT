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
		//pageNavi ����
		//�� �Խù� �� 
		int totalCount = dao.totalCount();
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		//�������׺��� ����
		int pageNaviSize = 5; //1-5������ ����ȣ ����
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1; //1 - 5���� ����ε� ���� 1�� ó�� ���۹�ȣ�� ���ϴº���
		//�������׺� �ۼ�
		String pageNavi = "";
		//������ư ����
		if(pageNo != 1) {
			pageNavi += "<a href='/CampNoticeList.do?reqPage="+(pageNo-1)+"'>[����]</a>";
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
		//����
		if(pageNo <= totalPage) {
			pageNavi += "<a href='/CampNoticeList.do?reqPage="+pageNo+"'>[����]</a>";
		}
		NoticePageData npd = new NoticePageData(list,pageNavi);
		return npd;
	}
}
