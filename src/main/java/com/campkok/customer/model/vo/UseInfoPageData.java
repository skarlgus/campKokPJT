package com.campkok.customer.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class UseInfoPageData {
	private ArrayList<ReservationVO> list;
	private String pageNavi;
	public UseInfoPageData(ArrayList<ReservationVO> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
}
