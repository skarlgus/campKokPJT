package com.campkok.camplist.model.vo;

import java.util.ArrayList;

public class CampListPageData {
	private ArrayList<CampList> list;
	private String pageNavi;
	public CampListPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CampListPageData(ArrayList<CampList> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<CampList> getList() {
		return list;
	}
	public void setList(ArrayList<CampList> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
}
