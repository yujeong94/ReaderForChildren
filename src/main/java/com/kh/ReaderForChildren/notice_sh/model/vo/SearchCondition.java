package com.kh.ReaderForChildren.notice_sh.model.vo;

public class SearchCondition {
	private String delivery;
	private String audition;
	private String sponsor;
	private String volunteer;
	private String record;
	private String event;
	
	public SearchCondition() {}

	public SearchCondition(String delivery, String audition, String sponsor, String volunteer, String record,
			String event) {
		super();
		this.delivery = delivery;
		this.audition = audition;
		this.sponsor = sponsor;
		this.volunteer = volunteer;
		this.record = record;
		this.event = event;
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	public String getAudition() {
		return audition;
	}

	public void setAudition(String audition) {
		this.audition = audition;
	}

	public String getSponsor() {
		return sponsor;
	}

	public void setSponsor(String sponsor) {
		this.sponsor = sponsor;
	}

	public String getVolunteer() {
		return volunteer;
	}

	public void setVolunteer(String volunteer) {
		this.volunteer = volunteer;
	}

	public String getRecord() {
		return record;
	}

	public void setRecord(String record) {
		this.record = record;
	}

	public String getEvent() {
		return event;
	}

	public void setEvent(String event) {
		this.event = event;
	}

	@Override
	public String toString() {
		return "SearchCondition [delivery=" + delivery + ", audition=" + audition + ", sponsor=" + sponsor
				+ ", volunteer=" + volunteer + ", record=" + record + ", event=" + event + "]";
	}
	
}
