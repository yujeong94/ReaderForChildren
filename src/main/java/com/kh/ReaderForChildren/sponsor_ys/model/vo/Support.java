package com.kh.ReaderForChildren.sponsor_ys.model.vo;


import java.sql.Date;

public class Support {

	private int snum;
	private int donation;
	private Date supdate;
	private String userId;
	private String spName;
	
	public Support () {}

	public Support(int snum, int donation, Date supdate, String userId, String spName) {
		super();
		this.snum = snum;
		this.donation = donation;
		this.supdate = supdate;
		this.userId = userId;
		this.spName = spName;
	}

	public int getSnum() {
		return snum;
	}

	public void setSnum(int snum) {
		this.snum = snum;
	}

	public int getDonation() {
		return donation;
	}

	public void setDonation(int donation) {
		this.donation = donation;
	}

	public Date getSupdate() {
		return supdate;
	}

	public void setSupdate(Date supdate) {
		this.supdate = supdate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getSpName() {
		return spName;
	}

	public void setSpName(String spName) {
		this.spName = spName;
	}

	@Override
	public String toString() {
		return "Support [snum=" + snum + ", donation=" + donation + ", supdate=" + supdate + ", userId=" + userId
				+ ", spName=" + spName + "]";
	}


	
	
	
}
