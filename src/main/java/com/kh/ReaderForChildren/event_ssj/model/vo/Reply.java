package com.kh.ReaderForChildren.event_ssj.model.vo;

import java.sql.Date;

public class Reply {
	
	private int rNum;
	private String rContent;
	private Date rDate;
	private String rStatus;
	private int eNum;
	private String userId;
	
	public Reply() {}
	
	public Reply(String rContent, int eNum) {
		super();
		this.rContent = rContent;
		this.eNum = eNum;
	}

	public Reply(int rNum, String rContent, Date rDate, String rStatus, int eNum, String userId) {
		super();
		this.rNum = rNum;
		this.rContent = rContent;
		this.rDate = rDate;
		this.rStatus = rStatus;
		this.eNum = eNum;
		this.userId = userId;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	public int geteNum() {
		return eNum;
	}

	public void seteNum(int eNum) {
		this.eNum = eNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Reply [rNum=" + rNum + ", rContent=" + rContent + ", rDate=" + rDate + ", rStatus=" + rStatus
				+ ", eNum=" + eNum + ", userId=" + userId + "]";
	}
	
}
