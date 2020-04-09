package com.kh.ReaderForChildren.sponsor_ys.model.vo;

import java.sql.Date;

public class Support {

	private int snum;
	private int donation;
	private Date supdate;
	
	public Support () {}

	public Support(int snum, int donation, Date supdate) {
		super();
		this.snum = snum;
		this.donation = donation;
		this.supdate = supdate;
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

	@Override
	public String toString() {
		return "Support [snum=" + snum + ", donation=" + donation + ", supdate=" + supdate + "]";
	}
	
	
}
