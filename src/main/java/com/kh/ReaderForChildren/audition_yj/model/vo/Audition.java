package com.kh.ReaderForChildren.audition_yj.model.vo;

public class Audition {
	private int aNum;
	private String bkName;
	private String qGender;
	private String aAge;
	private String gCareer;
	private String request;
	private String status;
	
	public Audition() {}
	
	public Audition(int aNum, String bkName, String qGender, String aAge, String gCareer, String request,
			String status) {
		super();
		this.aNum = aNum;
		this.bkName = bkName;
		this.qGender = qGender;
		this.aAge = aAge;
		this.gCareer = gCareer;
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

	public String getaAge() {
		return aAge;
	}

	public void setaAge(String aAge) {
		this.aAge = aAge;
	}

	public String getgCareer() {
		return gCareer;
	}

	public void setgCareer(String gCareer) {
		this.gCareer = gCareer;
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
		return "Audition [aNum=" + aNum + ", bkName=" + bkName + ", qGender=" + qGender + ", aAge=" + aAge
				+ ", gCareer=" + gCareer + ", request=" + request + ", status=" + status + "]";
	}

}
