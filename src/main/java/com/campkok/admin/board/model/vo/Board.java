package com.campkok.admin.board.model.vo;

public class Board {
	private int rNum;
	private int boardNo;
	private String userId;
	private String boardTitle;
	private String boardContents;
	private String boardDate;
	private String boardFileName;
	private String boardFilePath;

	public Board() {
		// TODO Auto-generated constructor stub
	}

	public Board(int boardNo, String userId, String boardTitle, String boardContents, String boardDate,
			String boardFileName, String boardFilePath) {
		super();
		this.boardNo = boardNo;
		this.userId = userId;
		this.boardTitle = boardTitle;
		this.boardContents = boardContents;
		this.boardDate = boardDate;
		this.boardFileName = boardFileName;
		this.boardFilePath = boardFilePath;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContents() {
		return boardContents;
	}

	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}

	public String getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}

	public String getBoardFileName() {
		return boardFileName;
	}

	public void setBoardFileName(String boardFileName) {
		this.boardFileName = boardFileName;
	}

	public String getBoardFilePath() {
		return boardFilePath;
	}

	public void setBoardFilePath(String boardFilePath) {
		this.boardFilePath = boardFilePath;
	}

}
