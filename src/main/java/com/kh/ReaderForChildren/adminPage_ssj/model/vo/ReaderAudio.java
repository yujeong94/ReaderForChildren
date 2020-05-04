package com.kh.ReaderForChildren.adminPage_ssj.model.vo;

import java.sql.Date;

public class ReaderAudio {
	private int af_code;
	private String change_name;
	private Date upload_date;
	private String bk_name;
	
	public ReaderAudio() {}

	public ReaderAudio(int af_code, String change_name, Date upload_date, String bk_name) {
		super();
		this.af_code = af_code;
		this.change_name = change_name;
		this.upload_date = upload_date;
		this.bk_name = bk_name;
	}

	public int getAf_code() {
		return af_code;
	}

	public void setAf_code(int af_code) {
		this.af_code = af_code;
	}

	public String getChange_name() {
		return change_name;
	}

	public void setChange_name(String change_name) {
		this.change_name = change_name;
	}

	public Date getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}

	public String getBk_name() {
		return bk_name;
	}

	public void setBk_name(String bk_name) {
		this.bk_name = bk_name;
	}

	@Override
	public String toString() {
		return "ReaderAudio [af_code=" + af_code + ", change_name=" + change_name + ", upload_date=" + upload_date
				+ ", bk_name=" + bk_name + "]";
	}
	
}
