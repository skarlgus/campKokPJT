package com.campkok.camp.model.vo;

import lombok.Data;

@Data
public class ReviewVO {
	private int revNo;
	private String userId;
	private int campNo;
	private String revContents;
	private int revStar;
	private String revDate;
	private String revImage;
	private int revHeart;
}
