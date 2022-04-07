package com.campkok.customer.model.vo;

import lombok.Data;

@Data
public class PointVO {
	private int pointNo;
	private int userNo;
	private String pointSaveContents;
	private String pointSaveDate;
	private int pointSave;
	private String pointUseContents;
	private String pointUseDate;
	private int pointUse;
	private int pointTotal;
}
