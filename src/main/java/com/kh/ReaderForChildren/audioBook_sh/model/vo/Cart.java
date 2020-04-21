package com.kh.ReaderForChildren.audioBook_sh.model.vo;

public class Cart {
	private int cNo;
	private String userId;
	private int bkCode;
	private int audCodeF;
	private int audCodeM;
	private String containBk;
	private String status;
	
	public Cart() {}

	public Cart(int cNo, String userId, int bkCode, int audCodeF, int audCodeM, String containBk, String status) {
		super();
		this.cNo = cNo;
		this.userId = userId;
		this.bkCode = bkCode;
		this.audCodeF = audCodeF;
		this.audCodeM = audCodeM;
		this.containBk = containBk;
		this.status = status;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	public String getContainBk() {
		return containBk;
	}

	public void setContainBk(String containBk) {
		this.containBk = containBk;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Cart [cNo=" + cNo + ", userId=" + userId + ", bkCode=" + bkCode + ", audCodeF=" + audCodeF
				+ ", audCodeM=" + audCodeM + ", containBk=" + containBk + ", status=" + status + "]";
	}

}
