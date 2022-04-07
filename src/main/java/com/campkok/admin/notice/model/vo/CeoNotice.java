package com.campkok.admin.notice.model.vo;

public class CeoNotice {
	private int rNum;
	private int ceoNoticeNo;
	private String userId;
	private String ceoNoticeTitle;
	private String ceoNoticeContents;
	private String ceoNoticeDate;
	private String ceoNoticeFileName;
	private String ceoNoticeFilePath;

	public CeoNotice() {
		// TODO Auto-generated constructor stub
	}

	public CeoNotice(int ceoNoticeNo, String userId, String ceoNoticeTitle, String ceoNoticeContents,
			String ceoNoticeDate, String ceoNoticeFileName, String ceoNoticeFilePath) {
		super();
		this.ceoNoticeNo = ceoNoticeNo;
		this.userId = userId;
		this.ceoNoticeTitle = ceoNoticeTitle;
		this.ceoNoticeContents = ceoNoticeContents;
		this.ceoNoticeDate = ceoNoticeDate;
		this.ceoNoticeFileName = ceoNoticeFileName;
		this.ceoNoticeFilePath = ceoNoticeFilePath;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public int getCeoNoticeNo() {
		return ceoNoticeNo;
	}

	public void setCeoNoticeNo(int ceoNoticeNo) {
		this.ceoNoticeNo = ceoNoticeNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCeoNoticeTitle() {
		return ceoNoticeTitle;
	}

	public void setCeoNoticeTitle(String ceoNoticeTitle) {
		this.ceoNoticeTitle = ceoNoticeTitle;
	}

	public String getCeoNoticeContents() {
		return ceoNoticeContents;
	}

	public void setCeoNoticeContents(String ceoNoticeContents) {
		this.ceoNoticeContents = ceoNoticeContents;
	}

	public String getCeoNoticeDate() {
		return ceoNoticeDate;
	}

	public void setCeoNoticeDate(String ceoNoticeDate) {
		this.ceoNoticeDate = ceoNoticeDate;
	}

	public String getCeoNoticeFileName() {
		return ceoNoticeFileName;
	}

	public void setCeoNoticeFileName(String ceoNoticeFileName) {
		this.ceoNoticeFileName = ceoNoticeFileName;
	}

	public String getCeoNoticeFilePath() {
		return ceoNoticeFilePath;
	}

	public void setCeoNoticeFilePath(String ceoNoticeFilePath) {
		this.ceoNoticeFilePath = ceoNoticeFilePath;
	}

}
