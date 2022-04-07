package com.campkok.admin.notice.model.vo;

import java.util.ArrayList;

public class ClientNoticePageData {
	private ArrayList<ClientNotice> list;
	private String pageNavi;

	public ClientNoticePageData() {
		// TODO Auto-generated constructor stub
	}

	public ClientNoticePageData(ArrayList<ClientNotice> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}

	public ArrayList<ClientNotice> getList() {
		return list;
	}

	public void setList(ArrayList<ClientNotice> list) {
		this.list = list;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}

}
