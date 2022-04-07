package com.campkok.customer.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class BoardPageData {
	private ArrayList<BoardVO> list;
	private String pageNavi;
	public BoardPageData(ArrayList<BoardVO> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	
}
