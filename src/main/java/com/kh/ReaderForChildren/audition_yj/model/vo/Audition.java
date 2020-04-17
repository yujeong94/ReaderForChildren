package com.kh.ReaderForChildren.audition_yj.model.vo;

import java.sql.Date;

public class Audition { 
	private int aNum;
	private String bkName;
	private String qGender;
	private String qAge;
	private String qCareer;
	private String request;
	private String status;
	private String teName;
	private String tePath;
	private int downCount;
	private Date uploadDate;
	private String biName;
	private String biPath;
	private Date endDate;
	
	public Audition() {}

	public Audition(int aNum, String bkName, String qGender, String qAge, String qCareer, String request, String status,
			String teName, String tePath, int downCount, Date uploadDate, String biName, String biPath, Date endDate) {
		super();
		this.aNum = aNum;
		this.bkName = bkName;
		this.qGender = qGender;
		this.qAge = qAge;
		this.qCareer = qCareer;
		this.request = request;
		this.status = status;
		this.teName = teName;
		this.tePath = tePath;
		this.downCount = downCount;
		this.uploadDate = uploadDate;
		this.biName = biName;
		this.biPath = biPath;
		this.endDate = endDate;
	}

	public int getaNum() {
		return aNum;
	}

	public void setaNum(int aNum) {
		this.aNum = aNum;
	}

	public String getBkName() {
		return bkName;
	}

	public void setBkName(String bkName) {
		this.bkName = bkName;
	}

	public String getqGender() {
		return qGender;
	}

	public void setqGender(String qGender) {
		this.qGender = qGender;
	}

	public String getqAge() {
		return qAge;
	}

	public void setqAge(String qAge) {
		this.qAge = qAge;
	}

	public String getqCareer() {
		return qCareer;
	}

	public void setqCareer(String qCareer) {
		this.qCareer = qCareer;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTeName() {
		return teName;
	}

	public void setTeName(String teName) {
		this.teName = teName;
	}

	public String getTePath() {
		return tePath;
	}

	public void setTePath(String tePath) {
		this.tePath = tePath;
	}

	public int getDownCount() {
		return downCount;
	}

	public void setDownCount(int downCount) {
		this.downCount = downCount;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getBiName() {
		return biName;
	}

	public void setBiName(String biName) {
		this.biName = biName;
	}

	public String getBiPath() {
		return biPath;
	}

	public void setBiPath(String biPath) {
		this.biPath = biPath;
	}
	
	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "Audition [aNum=" + aNum + ", bkName=" + bkName + ", qGender=" + qGender + ", qAge=" + qAge
				+ ", qCareer=" + qCareer + ", request=" + request + ", status=" + status + ", teName=" + teName
				+ ", tePath=" + tePath + ", downCount=" + downCount + ", uploadDate=" + uploadDate + ", biName="
				+ biName + ", biPath=" + biPath + ", endDate=" + endDate + "]";
	}

}