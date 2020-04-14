package com.kh.ReaderForChildren.audioBook_sh.model.vo;

public class Shipping {
	private int sNo;
	private String sName;
	private String rName;
	private String rPhone;
	private int rZipcode;
	private String rBasicadd;
	private String rDetailadd;
	private String sStatus;
	private String userId;
	
	public Shipping() {}

	public Shipping(int sNo, String sName, String rName, String rPhone, int rZipcode, String rBasicadd,
			String rDetailadd, String sStatus, String userId) {
		super();
		this.sNo = sNo;
		this.sName = sName;
		this.rName = rName;
		this.rPhone = rPhone;
		this.rZipcode = rZipcode;
		this.rBasicadd = rBasicadd;
		this.rDetailadd = rDetailadd;
		this.sStatus = sStatus;
		this.userId = userId;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	public String getrPhone() {
		return rPhone;
	}

	public void setrPhone(String rPhone) {
		this.rPhone = rPhone;
	}

	public int getrZipcode() {
		return rZipcode;
	}

	public void setrZipcode(int rZipcode) {
		this.rZipcode = rZipcode;
	}

	public String getrBasicadd() {
		return rBasicadd;
	}

	public void setrBasicadd(String rBasicadd) {
		this.rBasicadd = rBasicadd;
	}

	public String getrDetailadd() {
		return rDetailadd;
	}

	public void setrDetailadd(String rDetailadd) {
		this.rDetailadd = rDetailadd;
	}

	public String getsStatus() {
		return sStatus;
	}

	public void setsStatus(String sStatus) {
		this.sStatus = sStatus;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Shipping [sNo=" + sNo + ", sName=" + sName + ", rName=" + rName + ", rPhone=" + rPhone + ", rZipcode="
				+ rZipcode + ", rBasicadd=" + rBasicadd + ", rDetailadd=" + rDetailadd + ", sStatus=" + sStatus
				+ ", userId=" + userId + "]";
	}
	
}
