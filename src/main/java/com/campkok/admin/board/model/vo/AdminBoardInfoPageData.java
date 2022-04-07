package com.campkok.admin.board.model.vo;

import java.util.ArrayList;

public class AdminBoardInfoPageData {
	private ArrayList<Board> list;
	private String pageNavi;

	public AdminBoardInfoPageData() {
		// TODO Auto-generated constructor stub
	}

	public AdminBoardInfoPageData(ArrayList<Board> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}

	public ArrayList<Board> getList() {
		return list;
	}

	public void setList(ArrayList<Board> list) {
		this.list = list;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}

}
