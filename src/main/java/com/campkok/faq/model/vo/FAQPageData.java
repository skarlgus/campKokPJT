package com.campkok.faq.model.vo;

import java.util.ArrayList;


public class FAQPageData {
	private ArrayList<FAQVO> list;
	private String pageNavi;
	public FAQPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FAQPageData(ArrayList<FAQVO> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<FAQVO> getList() {
		return list;
	}
	public void setList(ArrayList<FAQVO> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
}
