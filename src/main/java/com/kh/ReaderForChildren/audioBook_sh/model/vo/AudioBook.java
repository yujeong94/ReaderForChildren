package com.kh.ReaderForChildren.audioBook_sh.model.vo;

import java.sql.Date;

public class AudioBook {
	private String audCode;
	private Date audDate;
	private int audPrice;
	private String rdIntro;
	private String audStatus;
	private String bkCode;
	
	public AudioBook() {}

	public AudioBook(String audCode, Date audDate, int audPrice, String rdIntro, String audStatus, String bkCode) {
		super();
		this.audCode = audCode;
		this.audDate = audDate;
		this.audPrice = audPrice;
		this.rdIntro = rdIntro;
		this.audStatus = audStatus;
		this.bkCode = bkCode;
	}

	public String getAudCode() {
		return audCode;
	}

	public void setAudCode(String audCode) {
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

	public String getBkCode() {
		return bkCode;
	}

	public void setBkCode(String bkCode) {
		this.bkCode = bkCode;
	}

	@Override
	public String toString() {
		return "AudioBook [audCode=" + audCode + ", audDate=" + audDate + ", audPrice=" + audPrice + ", rdIntro="
				+ rdIntro + ", audStatus=" + audStatus + ", bkCode=" + bkCode + "]";
	}
	
}
