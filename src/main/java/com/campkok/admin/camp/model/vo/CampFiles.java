package com.campkok.admin.camp.model.vo;

public class CampFiles {
	private int fileNo;
	private int campNo;
	private String[] campFileNames;
	private String[] campFilePaths;

	public CampFiles() {
		// TODO Auto-generated constructor stub
	}

	public CampFiles(int fileNo, int campNo, String[] campFileName, String[] campFilePath) {
		super();
		this.fileNo = fileNo;
		this.campNo = campNo;
		this.campFileNames = campFileName;
		this.campFilePaths = campFilePath;
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

	public String[] getCampFileName() {
		return campFileNames;
	}

	public void setCampFileName(String[] campFileName) {
		this.campFileNames = campFileName;
	}

	public String[] getCampFilePath() {
		return campFilePaths;
	}

	public void setCampFilePath(String[] campFilePath) {
		this.campFilePaths = campFilePath;
	}
}
