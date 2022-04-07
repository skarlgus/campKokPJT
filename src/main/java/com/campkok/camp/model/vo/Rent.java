package com.campkok.camp.model.vo;

import lombok.Data;

@Data
public class Rent {
	private int rentNo;
	private int campNo;
	private String rentName;
	private String rentFilename;
	private String rentFilepath;
	private int rentPrice;
	private String rentContents;
}
