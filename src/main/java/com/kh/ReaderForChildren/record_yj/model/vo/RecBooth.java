package com.kh.ReaderForChildren.record_yj.model.vo;

import java.sql.Date;

public class RecBooth {
	private int rId;
	private String recCompany;
	private String address;
	private Date rDate;
	private String rTime;
	private String userId;
	private String reStatus;
	
	public RecBooth() {}

	public RecBooth(int rId, String recCompany, String address, Date rDate, String rTime, String userId,
			String reStatus) {
		super();
		this.rId = rId;
		this.recCompany = recCompany;
		this.address = address;
		this.rDate = rDate;
		this.rTime = rTime;
		this.userId = userId;
		this.reStatus = reStatus;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public String getRecCompany() {
		return recCompany;
	}

	public void setRecCompany(String recCompany) {
		this.recCompany = recCompany;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public String getrTime() {
		return rTime;
	}

	public void setrTime(String rTime) {
		this.rTime = rTime;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getReStatus() {
		return reStatus;
	}

	public void setReStatus(String reStatus) {
		this.reStatus = reStatus;
	}

	@Override
	public String toString() {
		return "RecBooth [rId=" + rId + ", recCompany=" + recCompany + ", address=" + address + ", rDate=" + rDate
				+ ", rTime=" + rTime + ", userId=" + userId + ", reStatus=" + reStatus + "]";
	}
	
}
