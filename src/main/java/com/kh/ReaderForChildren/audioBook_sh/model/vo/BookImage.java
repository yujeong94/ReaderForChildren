package com.kh.ReaderForChildren.audioBook_sh.model.vo;

import java.sql.Date;

public class BookImage {
	private int biNo;
	private String originName;
	private String changeName;
	private String biPath;
	private Date uploadDate;
	private String biStatus;
	private int bkCode;
	
	public BookImage() {}

	public BookImage(int biNo, String originName, String changeName, String biPath, Date uploadDate, String biStatus,
			int bkCode) {
		super();
		this.biNo = biNo;
		this.originName = originName;
		this.changeName = changeName;
		this.biPath = biPath;
		this.uploadDate = uploadDate;
		this.biStatus = biStatus;
		this.bkCode = bkCode;
	}

	public int getBiNo() {
		return biNo;
	}

	public void setBiNo(int biNo) {
		this.biNo = biNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getBiPath() {
		return biPath;
	}

	public void setBiPath(String biPath) {
		this.biPath = biPath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getBiStatus() {
		return biStatus;
	}

	public void setBiStatus(String biStatus) {
		this.biStatus = biStatus;
	}

	public int getBkCode() {
		return bkCode;
	}

	public void setBkCode(int bkCode) {
		this.bkCode = bkCode;
	}

	@Override
	public String toString() {
		return "BookImage [biNo=" + biNo + ", originName=" + originName + ", changeName=" + changeName + ", biPath="
				+ biPath + ", uploadDate=" + uploadDate + ", biStatus=" + biStatus + ", bkCode=" + bkCode + "]";
	}
	
}
