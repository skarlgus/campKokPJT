package com.campkok.customer.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class BoardViewData {
	private BoardVO b;
	private ArrayList<BoardCommentVO> list;
	public BoardViewData(BoardVO b, ArrayList<BoardCommentVO> list) {
		super();
		this.b = b;
		this.list = list;
	}
}
