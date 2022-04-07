package com.campkok.camp.notice.model.vo;

import lombok.Data;

@Data
public class CampNoticeVO {
	private int campNoticeNo;
	private int campNo;
	private String campNoticeTitle;
	private String campNoticeDate;
	private String campNoticeContents;
	private String campNoticeFilename;
	private String campNoticefilePath;
}
