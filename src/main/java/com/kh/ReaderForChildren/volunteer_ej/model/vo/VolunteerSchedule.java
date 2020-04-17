package com.kh.ReaderForChildren.volunteer_ej.model.vo;

import java.sql.Date;

public class VolunteerSchedule {
	
	private int volAddNum;
	private String volContent;
	private Date volStart;
	private Date volEnd;
	private int volMax;
	private String volStatus;
	
	public VolunteerSchedule() {}

	public VolunteerSchedule(int volAddNum, String volContent, Date volStart, Date volEnd, int volMax,
			String volStatus) {
		super();
		this.volAddNum = volAddNum;
		this.volContent = volContent;
		this.volStart = volStart;
		this.volEnd = volEnd;
		this.volMax = volMax;
		this.volStatus = volStatus;
	}

	public int getVolAddNum() {
		return volAddNum;
	}

	public void setVolAddNum(int volAddNum) {
		this.volAddNum = volAddNum;
	}

	public String getVolContent() {
		return volContent;
	}

	public void setVolContent(String volContent) {
		this.volContent = volContent;
	}

	public Date getVolStart() {
		return volStart;
	}

	public void setVolStart(Date volStart) {
		this.volStart = volStart;
	}

	public Date getVolEnd() {
		return volEnd;
	}

	public void setVolEnd(Date volEnd) {
		this.volEnd = volEnd;
	}

	public int getVolMax() {
		return volMax;
	}

	public void setVolMax(int volMax) {
		this.volMax = volMax;
	}

	public String getVolStatus() {
		return volStatus;
	}

	public void setVolStatus(String volStatus) {
		this.volStatus = volStatus;
	}

	@Override
	public String toString() {
		return "VolunteerSchedule [volAddNum=" + volAddNum + ", volContent=" + volContent + ", volStart=" + volStart
				+ ", volEnd=" + volEnd + ", volMax=" + volMax + ", volStatus=" + volStatus + "]";
	}
	
	
	
}
