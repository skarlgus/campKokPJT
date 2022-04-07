package com.campkok.camp.notice.model.vo;

import java.util.ArrayList;


public class NoticePageData {
	private ArrayList<CampNoticeVO> list;
	private String pageNavi;
	
	public NoticePageData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NoticePageData(ArrayList<CampNoticeVO> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}

	public ArrayList<CampNoticeVO> getList() {
		return list;
	}

	public void setList(ArrayList<CampNoticeVO> list) {
		this.list = list;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	
	
}
