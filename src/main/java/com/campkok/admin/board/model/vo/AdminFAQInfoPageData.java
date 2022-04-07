package com.campkok.admin.board.model.vo;

import java.util.ArrayList;

public class AdminFAQInfoPageData {
	private ArrayList<FAQ> list;
	private String pageNavi;

	public AdminFAQInfoPageData() {
		// TODO Auto-generated constructor stub
	}

	public AdminFAQInfoPageData(ArrayList<FAQ> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}

	public ArrayList<FAQ> getList() {
		return list;
	}

	public void setList(ArrayList<FAQ> list) {
		this.list = list;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}

}
