package com.kh.ReaderForChildren.audioBook_sh.model.vo;

import java.sql.Date;

public class AudioBook {
	private int audCode;
	private Date audDate;
	private int audPrice;
	private String rdName;
	private String rdIntro;
	private String audStatus;
	private int bkCode;
	
	public AudioBook() {}

	public AudioBook(int audCode, Date audDate, int audPrice, String rdName, String rdIntro, String audStatus,
			int bkCode) {
		super();
		this.audCode = audCode;
		this.audDate = audDate;
		this.audPrice = audPrice;
		this.rdName = rdName;
		this.rdIntro = rdIntro;
		this.audStatus = audStatus;
		this.bkCode = bkCode;
	}

	public int getAudCode() {
		return audCode;
	}

	public void setAudCode(int audCode) {
		this.audCode = audCode;
	}

	public Date getAudDate() {
		return audDate;
	}

	public void setAudDate(Date audDate) {
		this.audDate = audDate;
	}

	public int getAudPrice() {
		return audPrice;
	}

	public void setAudPrice(int audPrice) {
		this.audPrice = audPrice;
	}

	public String getRdName() {
		return rdName;
	}

	public void setRdName(String rdName) {
		this.rdName = rdName;
	}

	public String getRdIntro() {
		return rdIntro;
	}

	public void setRdIntro(String rdIntro) {
		this.rdIntro = rdIntro;
	}

	public String getAudStatus() {
		return audStatus;
	}

	public void setAudStatus(String audStatus) {
		this.audStatus = audStatus;
	}

	public int getBkCode() {
		return bkCode;
	}

	public void setBkCode(int bkCode) {
		this.bkCode = bkCode;
	}

	@Override
	public String toString() {
		return "AudioBook [audCode=" + audCode + ", audDate=" + audDate + ", audPrice=" + audPrice + ", rdName="
				+ rdName + ", rdIntro=" + rdIntro + ", audStatus=" + audStatus + ", bkCode=" + bkCode + "]";
	}

}
