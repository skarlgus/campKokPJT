package com.campkok.camplist.model.vo;

import java.util.ArrayList;

import com.campkok.admin.camp.model.vo.CampFile;

import lombok.Data;

@Data
public class CampList {
	private int campNo;
	private String campName;
	private String campAddr;
	private String campSite;
	private String campTel;
	private String campTheme;
	private String campFac;			// 캠핑장 시설
	private String campCtg;			// 캠핑장 카테고리
	private String campEnv;			// 캠핑장 주변환경
	private String campMinPrice;	// 캠핑장 최저가
	private String campStar;		// 캠핑장 별점
	private ArrayList<CampFile> campFiles;
	private String imgpath;			// 리스트 이미지 불러오는거
}