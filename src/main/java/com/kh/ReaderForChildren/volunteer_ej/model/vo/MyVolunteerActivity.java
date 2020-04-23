package com.kh.ReaderForChildren.volunteer_ej.model.vo;

import java.sql.Date;

public class MyVolunteerActivity {
	private String userId;
	private String vlStatus;
	private Date volStart;
	private Date volEnd;
	private String volStatus;
	private String volContent;
	private int vlNum2;
	
	public MyVolunteerActivity() {}

	public MyVolunteerActivity(String userId, String vlStatus, Date volStart, Date volEnd, String volStatus,
			String volContent, int vlNum2) {
		super();
		this.userId = userId;
		this.vlStatus = vlStatus;
		this.volStart = volStart;
		this.volEnd = volEnd;
		this.volStatus = volStatus;
		this.volContent = volContent;
		this.vlNum2 = vlNum2;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getVlStatus() {
		return vlStatus;
	}

	public void setVlStatus(String vlStatus) {
		this.vlStatus = vlStatus;
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

	public String getVolStatus() {
		return volStatus;
	}

	public void setVolStatus(String volStatus) {
		this.volStatus = volStatus;
	}

	public String getVolContent() {
		return volContent;
	}

	public void setVolContent(String volContent) {
		this.volContent = volContent;
	}

	public int getVlNum2() {
		return vlNum2;
	}

	public void setVlNum2(int vlNum2) {
		this.vlNum2 = vlNum2;
	}

	
	
}
