package com.kh.ReaderForChildren.list_ys.model.vo;

import java.sql.Date;

public class Rec {

	private int rid;
	private String recCompany;
	private String address;
	private Date rdate;
	private String rtime;
	private String userId;
	private String restatus;
	
	public Rec() {}

	public Rec(int rid, String recCompany, String address, Date rdate, String rtime, String userId, String restatus) {
		super();
		this.rid = rid;
		this.recCompany = recCompany;
		this.address = address;
		this.rdate = rdate;
		this.rtime = rtime;
		this.userId = userId;
		this.restatus = restatus;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public String getRecCompany() {
		return recCompany;
	}

	public void setRecCompany(String recCompany) {
		this.recCompany = recCompany;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public String getRtime() {
		return rtime;
	}

	public void setRtime(String rtime) {
		this.rtime = rtime;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRestatus() {
		return restatus;
	}

	public void setRestatus(String restatus) {
		this.restatus = restatus;
	}

	@Override
	public String toString() {
		return "Rec [rid=" + rid + ", recCompany=" + recCompany + ", address=" + address + ", rdate=" + rdate
				+ ", rtime=" + rtime + ", userId=" + userId + ", restatus=" + restatus + "]";
	}

	
}
