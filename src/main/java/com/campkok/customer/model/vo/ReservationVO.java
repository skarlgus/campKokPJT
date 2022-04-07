package com.campkok.customer.model.vo;

import lombok.Data;

@Data
public class ReservationVO {
	private int resNo;
	private int userNo;
	private int campNo;
	private String campName;
	private int campRoomNo;
	private String campRoomName;
	private String campAddr;
	private String resInTime;
	private String resOutTime;
	private String resInDate;
	private String resOutDate;
	private int resMember;
	private int resPrice;
	private String resMemo;
	private int resCount;
	
}
