package com.kh.ReaderForChildren.event_ssj.model.vo;

public class Winner {
	
	private int eNum;
	private String userId;
	
	public Winner() {}
	
	public Winner(int eNum, String userId) {
		super();
		this.eNum = eNum;
		this.userId = userId;
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
		return "Winner [eNum=" + eNum + ", userId=" + userId + "]";
	}
	
}
