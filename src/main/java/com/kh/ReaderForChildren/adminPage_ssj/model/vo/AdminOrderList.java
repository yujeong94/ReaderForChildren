package com.kh.ReaderForChildren.adminPage_ssj.model.vo;

import java.sql.Date;

public class AdminOrderList {
	private int or_no;
	private int aud_code_f;
	private int aud_code_m;
	private int or_price;
	private Date or_date;
	private String del_status;
	private String or_status;
	private String contain_bk;
	private String user_id;
	private String bk_name;
	
	public AdminOrderList() {}

	public AdminOrderList(int or_no, int aud_code_f, int aud_code_m, int or_price, Date or_date, String del_status,
			String or_status, String contain_bk, String user_id, String bk_name) {
		super();
		this.or_no = or_no;
		this.aud_code_f = aud_code_f;
		this.aud_code_m = aud_code_m;
		this.or_price = or_price;
		this.or_date = or_date;
		this.del_status = del_status;
		this.or_status = or_status;
		this.contain_bk = contain_bk;
		this.user_id = user_id;
		this.bk_name = bk_name;
	}

	public int getOr_no() {
		return or_no;
	}

	public void setOr_no(int or_no) {
		this.or_no = or_no;
	}

	public int getAud_code_f() {
		return aud_code_f;
	}

	public void setAud_code_f(int aud_code_f) {
		this.aud_code_f = aud_code_f;
	}

	public int getAud_code_m() {
		return aud_code_m;
	}

	public void setAud_code_m(int aud_code_m) {
		this.aud_code_m = aud_code_m;
	}

	public int getOr_price() {
		return or_price;
	}

	public void setOr_price(int or_price) {
		this.or_price = or_price;
	}

	public Date getOr_date() {
		return or_date;
	}

	public void setOr_date(Date or_date) {
		this.or_date = or_date;
	}

	public String getDel_status() {
		return del_status;
	}

	public void setDel_status(String del_status) {
		this.del_status = del_status;
	}

	public String getOr_status() {
		return or_status;
	}

	public void setOr_status(String or_status) {
		this.or_status = or_status;
	}

	public String getContain_bk() {
		return contain_bk;
	}

	public void setContain_bk(String contain_bk) {
		this.contain_bk = contain_bk;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBk_name() {
		return bk_name;
	}

	public void setBk_name(String bk_name) {
		this.bk_name = bk_name;
	}

	@Override
	public String toString() {
		return "AdminOrderList [or_no=" + or_no + ", aud_code_f=" + aud_code_f + ", aud_code_m=" + aud_code_m
				+ ", or_price=" + or_price + ", or_date=" + or_date + ", del_status=" + del_status + ", or_status="
				+ or_status + ", contain_bk=" + contain_bk + ", user_id=" + user_id + ", bk_name=" + bk_name + "]";
	}
	
	
}
