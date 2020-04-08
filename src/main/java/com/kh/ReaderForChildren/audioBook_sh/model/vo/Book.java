package com.kh.ReaderForChildren.audioBook_sh.model.vo;

import java.sql.Date;

public class Book {
	private int bkCode;
	private String bkName;
	private String bkWriter;
	private String bkDraw;
	private String bkPublisher;
	private int bkPage;
	private String bkIntro;
	private Date bkPubdate;
	private int bkPrice;
	private String bkStatus;
	
	public Book() {}

	public Book(int bkCode, String bkName, String bkWriter, String bkDraw, String bkPublisher, int bkPage,
			String bkIntro, Date bkPubdate, int bkPrice, String bkStatus) {
		super();
		this.bkCode = bkCode;
		this.bkName = bkName;
		this.bkWriter = bkWriter;
		this.bkDraw = bkDraw;
		this.bkPublisher = bkPublisher;
		this.bkPage = bkPage;
		this.bkIntro = bkIntro;
		this.bkPubdate = bkPubdate;
		this.bkPrice = bkPrice;
		this.bkStatus = bkStatus;
	}

	public int getBkCode() {
		return bkCode;
	}

	public void setBkCode(int bkCode) {
		this.bkCode = bkCode;
	}

	public String getBkName() {
		return bkName;
	}

	public void setBkName(String bkName) {
		this.bkName = bkName;
	}

	public String getBkWriter() {
		return bkWriter;
	}

	public void setBkWriter(String bkWriter) {
		this.bkWriter = bkWriter;
	}

	public String getBkDraw() {
		return bkDraw;
	}

	public void setBkDraw(String bkDraw) {
		this.bkDraw = bkDraw;
	}

	public String getBkPublisher() {
		return bkPublisher;
	}

	public void setBkPublisher(String bkPublisher) {
		this.bkPublisher = bkPublisher;
	}

	public int getBkPage() {
		return bkPage;
	}

	public void setBkPage(int bkPage) {
		this.bkPage = bkPage;
	}

	public String getBkIntro() {
		return bkIntro;
	}

	public void setBkIntro(String bkIntro) {
		this.bkIntro = bkIntro;
	}

	public Date getBkPubdate() {
		return bkPubdate;
	}

	public void setBkPubdate(Date bkPubdate) {
		this.bkPubdate = bkPubdate;
	}

	public int getBkPrice() {
		return bkPrice;
	}

	public void setBkPrice(int bkPrice) {
		this.bkPrice = bkPrice;
	}

	public String getBkStatus() {
		return bkStatus;
	}

	public void setBkStatus(String bkStatus) {
		this.bkStatus = bkStatus;
	}

	@Override
	public String toString() {
		return "Book [bkCode=" + bkCode + ", bkName=" + bkName + ", bkWriter=" + bkWriter + ", bkDraw=" + bkDraw
				+ ", bkPublisher=" + bkPublisher + ", bkPage=" + bkPage + ", bkIntro=" + bkIntro + ", bkPubdate="
				+ bkPubdate + ", bkPrice=" + bkPrice + ", bkStatus=" + bkStatus + "]";
	}
	
}
