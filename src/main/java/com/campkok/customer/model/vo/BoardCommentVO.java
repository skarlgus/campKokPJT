package com.campkok.customer.model.vo;

import lombok.Data;

@Data
public class BoardCommentVO {
	private int boardCommentNo;
	private String boardCommentWriter;
	private String boardCommentContent;
	private int boardRef;
	private String boardCommentDate;
}
