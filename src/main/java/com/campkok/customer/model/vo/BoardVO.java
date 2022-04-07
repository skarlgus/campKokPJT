package com.campkok.customer.model.vo;

import lombok.Data;

@Data
public class BoardVO {
	private int rnum;
	private int boardNo;
	private String userId;
	private String boardFilename;
	private String boardFilepath;
	private String boardContents;
	private String boardDate;
	private String boardTitle;
}
