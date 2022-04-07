package com.campkok.admin.board.model.vo;

public class FAQ {
	private int rNum;
	private int faqNo;
	private String userId;
	private String faqUser;
	private String faqTitle;
	private String faqContents;
	private String faqDate;

	public FAQ() {
		// TODO Auto-generated constructor stub
	}

	public FAQ(int faqNo, String userId, String faqUser, String faqTitle, String faqContents, String faqDate) {
		super();
		this.faqNo = faqNo;
		this.userId = userId;
		this.faqUser = faqUser;
		this.faqTitle = faqTitle;
		this.faqContents = faqContents;
		this.faqDate = faqDate;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getFaqUser() {
		return faqUser;
	}

	public void setFaqUser(String faqUser) {
		this.faqUser = faqUser;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContents() {
		return faqContents;
	}

	public void setFaqContents(String faqContents) {
		this.faqContents = faqContents;
	}

	public String getFaqDate() {
		return faqDate;
	}

	public void setFaqDate(String faqDate) {
		this.faqDate = faqDate;
	}

}
