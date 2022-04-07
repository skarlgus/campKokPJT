package com.campkok.admin.visit.model.vo;

public class Visit {
	private int visitNo;
	private String visitId;
	private String visitIp;
	private String visitRefer;
	private String visitAgent;
	private String visitDate;

	public Visit() {
		// TODO Auto-generated constructor stub
	}

	public Visit(int visitNo, String visitId, String visitIp, String visitRefer, String visitAgent, String visitDate) {
		super();
		this.visitNo = visitNo;
		this.visitId = visitId;
		this.visitIp = visitIp;
		this.visitRefer = visitRefer;
		this.visitAgent = visitAgent;
		this.visitDate = visitDate;
	}

	public int getVisitNo() {
		return visitNo;
	}

	public void setVisitNo(int visitNo) {
		this.visitNo = visitNo;
	}

	public String getVisitId() {
		return visitId;
	}

	public void setVisitId(String visitId) {
		this.visitId = visitId;
	}

	public String getVisitIp() {
		return visitIp;
	}

	public void setVisitIp(String visitIp) {
		this.visitIp = visitIp;
	}

	public String getVisitRefer() {
		return visitRefer;
	}

	public void setVisitRefer(String visitRefer) {
		this.visitRefer = visitRefer;
	}

	public String getVisitAgent() {
		return visitAgent;
	}

	public void setVisitAgent(String visitAgent) {
		this.visitAgent = visitAgent;
	}

	public String getVisitDate() {
		return visitDate;
	}

	public void setVisitDate(String visitDate) {
		this.visitDate = visitDate;
	}

}
