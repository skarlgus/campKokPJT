package com.campkok.admin.camp.model.vo;

public class CampEnv {
	private int envNo;
	private int campNo;
	private String envName;
	private String envAddr;
	private String envTel;
	private String envFileName;
	private String envFilePath;

	public CampEnv() {
		// TODO Auto-generated constructor stub
	}

	public CampEnv(int envNo, int campNo, String envName, String envAddr, String envTel, String envFileName,
			String envFilePath) {
		super();
		this.envNo = envNo;
		this.campNo = campNo;
		this.envName = envName;
		this.envAddr = envAddr;
		this.envTel = envTel;
		this.envFileName = envFileName;
		this.envFilePath = envFilePath;
	}

	public int getEnvNo() {
		return envNo;
	}

	public void setEnvNo(int envNo) {
		this.envNo = envNo;
	}

	public int getCampNo() {
		return campNo;
	}

	public void setCampNo(int campNo) {
		this.campNo = campNo;
	}

	public String getEnvName() {
		return envName;
	}

	public void setEnvName(String envName) {
		this.envName = envName;
	}

	public String getEnvAddr() {
		return envAddr;
	}

	public void setEnvAddr(String envAddr) {
		this.envAddr = envAddr;
	}

	public String getEnvTel() {
		return envTel;
	}

	public void setEnvTel(String envTel) {
		this.envTel = envTel;
	}

	public String getEnvFileName() {
		return envFileName;
	}

	public void setEnvFileName(String envFileName) {
		this.envFileName = envFileName;
	}

	public String getEnvFilePath() {
		return envFilePath;
	}

	public void setEnvFilePath(String envFilePath) {
		this.envFilePath = envFilePath;
	}
}
