package com.kh.ReaderForChildren.audioBook_sh.model.vo;

public class cartList {

	private int cNo;
	private int bkCode;
	private String status;
	private String bkName;
	private int audCodeF;
	private int audCodeM;
	private int cPrice;
	private String userId;
	private String changeName;
	
	public cartList() {}

	public cartList(int cNo, int bkCode, String status, String bkName, int audCodeF, int audCodeM, int cPrice,
			String userId, String changeName) {
		super();
		this.cNo = cNo;
		this.bkCode = bkCode;
		this.status = status;
		this.bkName = bkName;
		this.audCodeF = audCodeF;
		this.audCodeM = audCodeM;
		this.cPrice = cPrice;
		this.userId = userId;
		this.changeName = changeName;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public int getBkCode() {
		return bkCode;
	}

	public void setBkCode(int bkCode) {
		this.bkCode = bkCode;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getBkName() {
		return bkName;
	}

	public void setBkName(String bkName) {
		this.bkName = bkName;
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

	public int getcPrice() {
		return cPrice;
	}

	public void setcPrice(int cPrice) {
		this.cPrice = cPrice;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	@Override
	public String toString() {
		return "cartList [cNo=" + cNo + ", bkCode=" + bkCode + ", status=" + status + ", bkName=" + bkName
				+ ", audCodeF=" + audCodeF + ", audCodeM=" + audCodeM + ", cPrice=" + cPrice + ", userId=" + userId
				+ ", changeName=" + changeName + "]";
	}

	


	

	
	
	
}
