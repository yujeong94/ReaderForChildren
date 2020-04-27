package com.kh.ReaderForChildren.notice_sh.model.vo;

import java.sql.Date;

public class Notice {
	private int noCode;
	private String noTitle;
	private String noContent;
	private Date noDate;
	private String noStatus;
	private String adId;
	private int noHit;
	
	public Notice() {}

	public Notice(int noCode, String noTitle, String noContent, Date noDate, String noStatus, String adId, int noHit) {
		super();
		this.noCode = noCode;
		this.noTitle = noTitle;
		this.noContent = noContent;
		this.noDate = noDate;
		this.noStatus = noStatus;
		this.adId = adId;
		this.noHit = noHit;
	}

	public int getNoCode() {
		return noCode;
	}

	public void setNoCode(int noCode) {
		this.noCode = noCode;
	}

	public String getNoTitle() {
		return noTitle;
	}

	public void setNoTitle(String noTitle) {
		this.noTitle = noTitle;
	}

	public String getNoContent() {
		return noContent;
	}

	public void setNoContent(String noContent) {
		this.noContent = noContent;
	}

	public Date getNoDate() {
		return noDate;
	}

	public void setNoDate(Date noDate) {
		this.noDate = noDate;
	}

	public String getNoStatus() {
		return noStatus;
	}

	public void setNoStatus(String noStatus) {
		this.noStatus = noStatus;
	}

	public String getAdId() {
		return adId;
	}

	public void setAdId(String adId) {
		this.adId = adId;
	}

	public int getNoHit() {
		return noHit;
	}

	public void setNoHit(int noHit) {
		this.noHit = noHit;
	}

	@Override
	public String toString() {
		return "Notice [noCode=" + noCode + ", noTitle=" + noTitle + ", noContent=" + noContent + ", noDate=" + noDate
				+ ", noStatus=" + noStatus + ", adId=" + adId + ", noHit=" + noHit + "]";
	}
	
}
