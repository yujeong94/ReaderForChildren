package com.kh.ReaderForChildren.volunteer_ej.model.vo;

public class Volunteer {
	private int vlNum;
	private String vlStatus;
	private String userID;
	private int vlNum2;
	private String vlPhone;
	private String userName;
	
	public Volunteer() {}

	public Volunteer(int vlNum, String vlStatus, String userID, int vlNum2, String vlPhone, String userName) {
		super();
		this.vlNum = vlNum;
		this.vlStatus = vlStatus;
		this.userID = userID;
		this.vlNum2 = vlNum2;
		this.vlPhone = vlPhone;
		this.userName = userName;
	}

	public int getVlNum() {
		return vlNum;
	}

	public void setVlNum(int vlNum) {
		this.vlNum = vlNum;
	}

	public String getVlStatus() {
		return vlStatus;
	}

	public void setVlStatus(String vlStatus) {
		this.vlStatus = vlStatus;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public int getVlNum2() {
		return vlNum2;
	}

	public void setVlNum2(int vlNum2) {
		this.vlNum2 = vlNum2;
	}

	public String getVlPhone() {
		return vlPhone;
	}

	public void setVlPhone(String vlPhone) {
		this.vlPhone = vlPhone;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "Volunteer [vlNum=" + vlNum + ", vlStatus=" + vlStatus + ", userID=" + userID + ", vlNum2=" + vlNum2
				+ ", vlPhone=" + vlPhone + ", userName=" + userName + "]";
	}
	
	
	
}
