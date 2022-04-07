package com.campkok.customer.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class ReviewInfoPageData {
	private ArrayList<ReviewVO> list;
	private String pageNavi;
	public ReviewInfoPageData(ArrayList<ReviewVO> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
}
