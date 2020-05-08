package com.kh.ReaderForChildren.audioBook_sh.model.vo;
 
import java.sql.Date;

public class Orlist {

	private int orNo;
	private String bkName;
	private Date orDate;
	private String orStatus;
	private int bkCode;
	private String delStatus;
	private String aud_code_f;
	private String aud_code_m;
	private String img;
	private String userId;
	private String containBk;
	private String changeName;
	
	public Orlist() {}

	public Orlist(int orNo, String bkName, Date orDate, String orStatus, int bkCode, String delStatus,
			String aud_code_f, String aud_code_m, String img, String userId, String containBk, String changeName) {
		super();
		this.orNo = orNo;
		this.bkName = bkName;
		this.orDate = orDate;
		this.orStatus = orStatus;
		this.bkCode = bkCode;
		this.delStatus = delStatus;
		this.aud_code_f = aud_code_f;
		this.aud_code_m = aud_code_m;
		this.img = img;
		this.userId = userId;
		this.containBk = containBk;
		this.changeName = changeName;
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

	public String getAud_code_f() {
		return aud_code_f;
	}

	public void setAud_code_f(String aud_code_f) {
		this.aud_code_f = aud_code_f;
	}

	public String getAud_code_m() {
		return aud_code_m;
	}

	public void setAud_code_m(String aud_code_m) {
		this.aud_code_m = aud_code_m;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getContainBk() {
		return containBk;
	}

	public void setContainBk(String containBk) {
		this.containBk = containBk;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	@Override
	public String toString() {
		return "Orlist [orNo=" + orNo + ", bkName=" + bkName + ", orDate=" + orDate + ", orStatus=" + orStatus
				+ ", bkCode=" + bkCode + ", delStatus=" + delStatus + ", aud_code_f=" + aud_code_f + ", aud_code_m="
				+ aud_code_m + ", img=" + img + ", userId=" + userId + ", containBk=" + containBk + ", changeName="
				+ changeName + "]";
	}

	

	
	
}
