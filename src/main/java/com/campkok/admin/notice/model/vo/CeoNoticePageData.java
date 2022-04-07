package com.campkok.admin.notice.model.vo;

import java.util.ArrayList;

public class CeoNoticePageData {
	private ArrayList<CeoNotice> list;
	private String pageNavi;

	public CeoNoticePageData() {
		// TODO Auto-generated constructor stub
	}

	public CeoNoticePageData(ArrayList<CeoNotice> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}

	public ArrayList<CeoNotice> getList() {
		return list;
	}

	public void setList(ArrayList<CeoNotice> list) {
		this.list = list;
	}

	public String getpageNavi() {
		return pageNavi;
	}

	public void setpageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}

}
