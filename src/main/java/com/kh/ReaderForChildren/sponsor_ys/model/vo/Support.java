package com.kh.ReaderForChildren.sponsor_ys.model.vo;

import com.kh.ReaderForChildren.member_ej.model.vo.Member;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.*;

import java.sql.Date;

public class Support {

	private int snum;
	private int donation;
	private Date supdate;
	private String userId;
	private int spCode;
	
	public Support () {}

	public Support(int snum, int donation, Date supdate, String userId, int spCode) {
		super();
		this.snum = snum;
		this.donation = donation;
		this.supdate = supdate;
		this.userId = userId;
		this.spCode = spCode;
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

	public int getSpCode() {
		return spCode;
	}

	public void setSpCode(int spCode) {
		this.spCode = spCode;
	}

	@Override
	public String toString() {
		return "Support [snum=" + snum + ", donation=" + donation + ", supdate=" + supdate + ", userId=" + userId
				+ ", spCode=" + spCode + "]";
	}

	
	
}
