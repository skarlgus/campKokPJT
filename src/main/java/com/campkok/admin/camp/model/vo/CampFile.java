package com.campkok.admin.camp.model.vo;

public class CampFile {
	private int fileNo;
	private int campNo;
	private String campFileName;
	private String campFilePath;

	public CampFile() {
		// TODO Auto-generated constructor stub
	}

	public CampFile(int campNo, String campFileName, String campFilePath) {
		super();
		this.campNo = campNo;
		this.campFileName = campFileName;
		this.campFilePath = campFilePath;
	}

	public CampFile(int fileNo, int campNo, String campFileName, String campFilePath) {
		super();
		this.fileNo = fileNo;
		this.campNo = campNo;
		this.campFileName = campFileName;
		this.campFilePath = campFilePath;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getCampNo() {
		return campNo;
	}

	public void setCampNo(int campNo) {
		this.campNo = campNo;
	}

	public String getCampFileName() {
		return campFileName;
	}

	public void setCampFileName(String campFileName) {
		this.campFileName = campFileName;
	}

	public String getCampFilePath() {
		return campFilePath;
	}

	public void setCampFilePath(String campFilePath) {
		this.campFilePath = campFilePath;
	}
}
