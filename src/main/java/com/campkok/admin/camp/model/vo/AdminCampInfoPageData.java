package com.campkok.admin.camp.model.vo;

import java.util.ArrayList;

public class AdminCampInfoPageData {
	private ArrayList<Camp> list;
	private String pageNavi;

	public AdminCampInfoPageData() {
		// TODO Auto-generated constructor stub
	}

	public AdminCampInfoPageData(ArrayList<Camp> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}

	public ArrayList<Camp> getList() {
		return list;
	}

	public void setList(ArrayList<Camp> list) {
		this.list = list;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}

}
