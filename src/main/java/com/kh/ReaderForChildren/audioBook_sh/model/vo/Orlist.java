package com.kh.ReaderForChildren.audioBook_sh.model.vo;
 
import java.sql.Date;

public class Orlist {

	private int orNo;
	private String bkName;
	private Date orDate;
	private String orStatus;
	private int bkCode;
	private String delStatus;
	private String changeName;
	private String ima;
	
	public Orlist() {}

	public Orlist(int orNo, String bkName, Date orDate, String orStatus, int bkCode, String delStatus,
			String changeName, String ima) {
		super();
		this.orNo = orNo;
		this.bkName = bkName;
		this.orDate = orDate;
		this.orStatus = orStatus;
		this.bkCode = bkCode;
		this.delStatus = delStatus;
		this.changeName = changeName;
		this.ima = ima;
	}

	public int getOrNo() {
		return orNo;
	}

	public void setOrNo(int orNo) {
		this.orNo = orNo;
	}

	public String getBkName() {
		return bkName;
	}

	public void setBkName(String bkName) {
		this.bkName = bkName;
	}

	public Date getOrDate() {
		return orDate;
	}

	public void setOrDate(Date orDate) {
		this.orDate = orDate;
	}

	public String getOrStatus() {
		return orStatus;
	}

	public void setOrStatus(String orStatus) {
		this.orStatus = orStatus;
	}

	public int getBkCode() {
		return bkCode;
	}

	public void setBkCode(int bkCode) {
		this.bkCode = bkCode;
	}

	public String getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(String delStatus) {
		this.delStatus = delStatus;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getIma() {
		return ima;
	}

	public void setIma(String ima) {
		this.ima = ima;
	}

	@Override
	public String toString() {
		return "Orlist [orNo=" + orNo + ", bkName=" + bkName + ", orDate=" + orDate + ", orStatus=" + orStatus
				+ ", bkCode=" + bkCode + ", delStatus=" + delStatus + ", changeName=" + changeName + ", ima=" + ima
				+ "]";
	}

	
	
	
	
}
