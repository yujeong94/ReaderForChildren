package com.kh.ReaderForChildren.event_ssj.model.vo;

import java.sql.Date;

public class Event {
	
	private int eNum;
	private String eTitle;
	private Date eStart;
	private Date eEnd;
	private Date eAnno;
	private String eTarget;
	private String eContent;
	private String eWay;
	private String eStand;
	private Date eDate;
	private int eCount;
	private String eStatus;
	private int eDivision;
	private int eEventNum;
	
	public Event() {}

	public Event(String eTitle, Date eStart, Date eEnd, Date eAnno, String eTarget, String eContent, String eWay,
			String eStand, Date eDate, int eEventNum) {
		super();
		this.eTitle = eTitle;
		this.eStart = eStart;
		this.eEnd = eEnd;
		this.eAnno = eAnno;
		this.eTarget = eTarget;
		this.eContent = eContent;
		this.eWay = eWay;
		this.eStand = eStand;
		this.eDate = eDate;
		this.eEventNum = eEventNum;
	}

	public Event(int eNum, String eTitle, Date eStart, Date eEnd, Date eAnno, String eTarget, String eContent,
			String eWay, String eStand, Date eDate, int eCount, String eStatus, int eDivision, int eEventNum) {
		super();
		this.eNum = eNum;
		this.eTitle = eTitle;
		this.eStart = eStart;
		this.eEnd = eEnd;
		this.eAnno = eAnno;
		this.eTarget = eTarget;
		this.eContent = eContent;
		this.eWay = eWay;
		this.eStand = eStand;
		this.eDate = eDate;
		this.eCount = eCount;
		this.eStatus = eStatus;
		this.eDivision = eDivision;
		this.eEventNum = eEventNum;
	}

	public int geteNum() {
		return eNum;
	}

	public void seteNum(int eNum) {
		this.eNum = eNum;
	}

	public String geteTitle() {
		return eTitle;
	}

	public void seteTitle(String eTitle) {
		this.eTitle = eTitle;
	}

	public Date geteStart() {
		return eStart;
	}

	public void seteStart(Date eStart) {
		this.eStart = eStart;
	}

	public Date geteEnd() {
		return eEnd;
	}

	public void seteEnd(Date eEnd) {
		this.eEnd = eEnd;
	}

	public Date geteAnno() {
		return eAnno;
	}

	public void seteAnno(Date eAnno) {
		this.eAnno = eAnno;
	}

	public String geteTarget() {
		return eTarget;
	}

	public void seteTarget(String eTarget) {
		this.eTarget = eTarget;
	}

	public String geteContent() {
		return eContent;
	}

	public void seteContent(String eContent) {
		this.eContent = eContent;
	}

	public String geteWay() {
		return eWay;
	}

	public void seteWay(String eWay) {
		this.eWay = eWay;
	}

	public String geteStand() {
		return eStand;
	}

	public void seteStand(String eStand) {
		this.eStand = eStand;
	}

	public Date geteDate() {
		return eDate;
	}

	public void seteDate(Date eDate) {
		this.eDate = eDate;
	}

	public int geteCount() {
		return eCount;
	}

	public void seteCount(int eCount) {
		this.eCount = eCount;
	}

	public String geteStatus() {
		return eStatus;
	}

	public void seteStatus(String eStatus) {
		this.eStatus = eStatus;
	}

	public int geteDivision() {
		return eDivision;
	}

	public void seteDivision(int eDivision) {
		this.eDivision = eDivision;
	}

	public int geteEventNum() {
		return eEventNum;
	}

	public void seteEventNum(int eEventNum) {
		this.eEventNum = eEventNum;
	}

	@Override
	public String toString() {
		return "Event [eNum=" + eNum + ", eTitle=" + eTitle + ", eStart=" + eStart + ", eEnd=" + eEnd + ", eAnno="
				+ eAnno + ", eTarget=" + eTarget + ", eContent=" + eContent + ", eWay=" + eWay + ", eStand=" + eStand
				+ ", eDate=" + eDate + ", eCount=" + eCount + ", eStatus=" + eStatus + ", eDivision=" + eDivision
				+ ", eEventNum=" + eEventNum + "]";
	}
	
	
}
