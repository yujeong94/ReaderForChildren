package com.kh.ReaderForChildren.audition_yj.model.vo;

public class Audition { 
	private int aNum;
	private String bkName;
	private String qGender;
	private String qAge;
	private String qCareer;
	private String request;
	private String status;
	
	public Audition() {}

	public Audition(int aNum, String bkName, String qGender, String qAge, String qCareer, String request,
			String status) {
		super();
		this.aNum = aNum;
		this.bkName = bkName;
		this.qGender = qGender;
		this.qAge = qAge;
		this.qCareer = qCareer;
		this.request = request;
		this.status = status;
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

	@Override
	public String toString() {
		return "Audition [aNum=" + aNum + ", bkName=" + bkName + ", qGender=" + qGender + ", qAge=" + qAge
				+ ", qCareer=" + qCareer + ", request=" + request + ", status=" + status + "]";
	}
	
}