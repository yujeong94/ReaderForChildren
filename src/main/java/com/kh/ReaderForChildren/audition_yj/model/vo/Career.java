package com.kh.ReaderForChildren.audition_yj.model.vo;

public class Career {
	private int cNum;
	private String userId;
	private String cDate;
	private String cContent;
	private String cCompany;
	
	public Career() {}

	public Career(int cNum, String userId, String cDate, String cContent, String cCompany) {
		super();
		this.cNum = cNum;
		this.userId = userId;
		this.cDate = cDate;
		this.cContent = cContent;
		this.cCompany = cCompany;
	}

	public int getcNum() {
		return cNum;
	}

	public void setcNum(int cNum) {
		this.cNum = cNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getcDate() {
		return cDate;
	}

	public void setcDate(String cDate) {
		this.cDate = cDate;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public String getcCompany() {
		return cCompany;
	}

	public void setcCompany(String cCompany) {
		this.cCompany = cCompany;
	}

	@Override
	public String toString() {
		return "Career [cNum=" + cNum + ", userId=" + userId + ", cDate=" + cDate + ", cContent=" + cContent
				+ ", cCompany=" + cCompany + "]";
	}
	
}
