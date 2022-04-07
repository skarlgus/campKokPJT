package com.campkok.admin.notice.model.vo;

public class ClientNotice {
	private int rNum;
	private int clientNoticeNo;
	private String userId;
	private String clientNoticeTitle;
	private String clientNoticeContents;
	private String clientNoticeDate;
	private String clientNoticeFileName;
	private String clientNoticeFilePath;

	public ClientNotice() {
		// TODO Auto-generated constructor stub
	}

	public ClientNotice(int clientNoticeNo, String userId, String clientNoticeTitle, String clientNoticeContents,
			String clientNoticeDate, String clientNoticeFileName, String clientNoticeFilePath) {
		super();
		this.clientNoticeNo = clientNoticeNo;
		this.userId = userId;
		this.clientNoticeTitle = clientNoticeTitle;
		this.clientNoticeContents = clientNoticeContents;
		this.clientNoticeDate = clientNoticeDate;
		this.clientNoticeFileName = clientNoticeFileName;
		this.clientNoticeFilePath = clientNoticeFilePath;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public int getClientNoticeNo() {
		return clientNoticeNo;
	}

	public void setClientNoticeNo(int clientNoticeNo) {
		this.clientNoticeNo = clientNoticeNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getClientNoticeTitle() {
		return clientNoticeTitle;
	}

	public void setClientNoticeTitle(String clientNoticeTitle) {
		this.clientNoticeTitle = clientNoticeTitle;
	}

	public String getClientNoticeContents() {
		return clientNoticeContents;
	}

	public void setClientNoticeContents(String clientNoticeContents) {
		this.clientNoticeContents = clientNoticeContents;
	}

	public String getClientNoticeDate() {
		return clientNoticeDate;
	}

	public void setClientNoticeDate(String clientNoticeDate) {
		this.clientNoticeDate = clientNoticeDate;
	}

	public String getClientNoticeFileName() {
		return clientNoticeFileName;
	}

	public void setClientNoticeFileName(String clientNoticeFileName) {
		this.clientNoticeFileName = clientNoticeFileName;
	}

	public String getClientNoticeFilePath() {
		return clientNoticeFilePath;
	}

	public void setClientNoticeFilePath(String clientNoticeFilePath) {
		this.clientNoticeFilePath = clientNoticeFilePath;
	}
}
