package com.campkok.camp.model.vo;

import lombok.Data;

@Data
public class CampResVO {
	private int resNo;
	private int userNo;
	private int campNo;
	private int campRoom;
	private String resInTime;
	private String resOutTime;
	private String resInDate;
	private String resOutDate;
	private String resMember;
	private String resPrice;
	private String resMemo;
	private String resCount;

}
