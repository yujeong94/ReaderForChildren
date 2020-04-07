package com.kh.ReaderForChildren.sponsor_ys.model.vo;

public class Sponsor {
 
	private int spCode;
	private String spName;
	private String spIntro;
	private String spAddress;
	private String spPhone;
	
	public Sponsor() {}

	public Sponsor(int spCode, String spName, String spIntro, String spAddress, String spPhone) {
		super();
		this.spCode = spCode;
		this.spName = spName;
		this.spIntro = spIntro;
		this.spAddress = spAddress;
		this.spPhone = spPhone;
	}

	public int getSpCode() {
		return spCode;
	}

	public void setSpCode(int spCode) {
		this.spCode = spCode;
	}

	public String getSpName() {
		return spName;
	}

	public void setSpName(String spName) {
		this.spName = spName;
	}

	public String getSpIntro() {
		return spIntro;
	}

	public void setSpIntro(String spIntro) {
		this.spIntro = spIntro;
	}

	public String getSpAddress() {
		return spAddress;
	}

	public void setSpAddress(String spAddress) {
		this.spAddress = spAddress;
	}

	public String getSpPhone() {
		return spPhone;
	}

	public void setSpPhone(String spPhone) {
		this.spPhone = spPhone;
	}

	@Override
	public String toString() {
		return "Sponsor [spCode=" + spCode + ", spName=" + spName + ", spIntro=" + spIntro + ", spAddress=" + spAddress
				+ ", spPhone=" + spPhone + "]";
	}
	
	
}
