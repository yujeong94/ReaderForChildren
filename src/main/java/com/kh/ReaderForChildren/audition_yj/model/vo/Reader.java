package com.kh.ReaderForChildren.audition_yj.model.vo;

import java.sql.Date;

public class Reader {
	private String userId;
	private String introduce;
	private String imgOrigin;
	private String imgChange;
	private String imgPath;
	private String recName;
	private String recPath;
	private Date enrollDate;
	private int status;
	private int aNum;
	
	public Reader() {}

	public Reader(String userId, String introduce, String imgOrigin, String imgChange, String imgPath, String recName,
			String recPath, Date enrollDate, int status, int aNum) {
		super();
		this.userId = userId;
		this.introduce = introduce;
		this.imgOrigin = imgOrigin;
		this.imgChange = imgChange;
		this.imgPath = imgPath;
		this.recName = recName;
		this.recPath = recPath;
		this.enrollDate = enrollDate;
		this.status = status;
		this.aNum = aNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getImgOrigin() {
		return imgOrigin;
	}

	public void setImgOrigin(String imgOrigin) {
		this.imgOrigin = imgOrigin;
	}

	public String getImgChange() {
		return imgChange;
	}

	public void setImgChange(String imgChange) {
		this.imgChange = imgChange;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getRecName() {
		return recName;
	}

	public void setRecName(String recName) {
		this.recName = recName;
	}

	public String getRecPath() {
		return recPath;
	}

	public void setRecPath(String recPath) {
		this.recPath = recPath;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getaNum() {
		return aNum;
	}

	public void setaNum(int aNum) {
		this.aNum = aNum;
	}

	@Override
	public String toString() {
		return "Reader [userId=" + userId + ", introduce=" + introduce + ", imgOrigin=" + imgOrigin + ", imgChange="
				+ imgChange + ", imgPath=" + imgPath + ", recName=" + recName + ", recPath=" + recPath + ", enrollDate="
				+ enrollDate + ", status=" + status + ", aNum=" + aNum + "]";
	}

}
