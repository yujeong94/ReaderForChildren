package com.kh.ReaderForChildren.audioBook_sh.model.vo;

import java.sql.Date;

public class OrderDetail {
	private int orNo;
	private int bkCode;
	private int audCodeF;
	private int audCodeM;
	private int orPrice;
	private Date orDate;
	private String delRequest;
	private String delStatus;
	private String orStatus;
	private String containBk;
	private int sNo;
	private String userId;
	
	public OrderDetail() {}

	public OrderDetail(int orNo, int bkCode, int audCodeF, int audCodeM, int orPrice, Date orDate, String delRequest,
			String delStatus, String orStatus, String containBk, int sNo, String userId) {
		super();
		this.orNo = orNo;
		this.bkCode = bkCode;
		this.audCodeF = audCodeF;
		this.audCodeM = audCodeM;
		this.orPrice = orPrice;
		this.orDate = orDate;
		this.delRequest = delRequest;
		this.delStatus = delStatus;
		this.orStatus = orStatus;
		this.containBk = containBk;
		this.sNo = sNo;
		this.userId = userId;
	}

	public int getOrNo() {
		return orNo;
	}

	public void setOrNo(int orNo) {
		this.orNo = orNo;
	}

	public int getBkCode() {
		return bkCode;
	}

	public void setBkCode(int bkCode) {
		this.bkCode = bkCode;
	}

	public int getAudCodeF() {
		return audCodeF;
	}

	public void setAudCodeF(int audCodeF) {
		this.audCodeF = audCodeF;
	}

	public int getAudCodeM() {
		return audCodeM;
	}

	public void setAudCodeM(int audCodeM) {
		this.audCodeM = audCodeM;
	}

	public int getOrPrice() {
		return orPrice;
	}

	public void setOrPrice(int orPrice) {
		this.orPrice = orPrice;
	}

	public Date getOrDate() {
		return orDate;
	}

	public void setOrDate(Date orDate) {
		this.orDate = orDate;
	}

	public String getDelRequest() {
		return delRequest;
	}

	public void setDelRequest(String delRequest) {
		this.delRequest = delRequest;
	}

	public String getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(String delStatus) {
		this.delStatus = delStatus;
	}

	public String getOrStatus() {
		return orStatus;
	}

	public void setOrStatus(String orStatus) {
		this.orStatus = orStatus;
	}

	public String getContainBk() {
		return containBk;
	}

	public void setContainBk(String containBk) {
		this.containBk = containBk;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "OrderDetail [orNo=" + orNo + ", bkCode=" + bkCode + ", audCodeF=" + audCodeF + ", audCodeM=" + audCodeM
				+ ", orPrice=" + orPrice + ", orDate=" + orDate + ", delRequest=" + delRequest + ", delStatus="
				+ delStatus + ", orStatus=" + orStatus + ", containBk=" + containBk + ", sNo=" + sNo + ", userId="
				+ userId + "]";
	}

}
