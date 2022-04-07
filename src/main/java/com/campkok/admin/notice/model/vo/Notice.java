package com.campkok.admin.notice.model.vo;

public class Notice {
	private String userCategory;
	private String userId;
	private String noticeTitle;
	private String noticeFileName;
	private String noticeFilePath;
	private String noticeContents;

	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public Notice(String userCategory, String userId, String noticeTitle, String noticeFileName, String noticeFilePath,
			String noticeContents) {
		super();
		this.userCategory = userCategory;
		this.userId = userId;
		this.noticeTitle = noticeTitle;
		this.noticeFileName = noticeFileName;
		this.noticeFilePath = noticeFilePath;
		this.noticeContents = noticeContents;
	}

	public String getUserCategory() {
		return userCategory;
	}

	public void setUserCategory(String userCategory) {
		this.userCategory = userCategory;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeFileName() {
		return noticeFileName;
	}

	public void setNoticeFileName(String noticeFileName) {
		this.noticeFileName = noticeFileName;
	}

	public String getNoticeFilePath() {
		return noticeFilePath;
	}

	public void setNoticeFilePath(String noticeFilePath) {
		this.noticeFilePath = noticeFilePath;
	}

	public String getNoticeContents() {
		return noticeContents;
	}

	public void setNoticeContents(String noticeContents) {
		this.noticeContents = noticeContents;
	}
}
