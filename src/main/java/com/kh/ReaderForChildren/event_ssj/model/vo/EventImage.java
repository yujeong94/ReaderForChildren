package com.kh.ReaderForChildren.event_ssj.model.vo;

import java.sql.Date;

public class EventImage {
	
	private int eiNo;
	private String originName;
	private String changeName;
	private String imPath;
	private Date uploadDate;
	private String imStatus;
	private int eNum;
	
	public EventImage() {}
	
	public EventImage(String originName, String changeName, String imPath, Date uploadDate) {
		super();
		this.originName = originName;
		this.changeName = changeName;
		this.imPath = imPath;
		this.uploadDate = uploadDate;
	}

	public EventImage(int eiNo, String originName, String changeName, String imPath, Date uploadDate, String imStatus,
			int eNum) {
		super();
		this.eiNo = eiNo;
		this.originName = originName;
		this.changeName = changeName;
		this.imPath = imPath;
		this.uploadDate = uploadDate;
		this.imStatus = imStatus;
		this.eNum = eNum;
	}

	public int getEiNo() {
		return eiNo;
	}

	public void setEiNo(int eiNo) {
		this.eiNo = eiNo;
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

	public String getImPath() {
		return imPath;
	}

	public void setImPath(String imPath) {
		this.imPath = imPath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getImStatus() {
		return imStatus;
	}

	public void setImStatus(String imStatus) {
		this.imStatus = imStatus;
	}

	public int geteNum() {
		return eNum;
	}

	public void seteNum(int eNum) {
		this.eNum = eNum;
	}

	@Override
	public String toString() {
		return "EventImage [eiNo=" + eiNo + ", originName=" + originName + ", changeName=" + changeName + ", imPath="
				+ imPath + ", uploadDate=" + uploadDate + ", imStatus=" + imStatus + ", eNum=" + eNum + "]";
	}
	
}
