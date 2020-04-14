package com.kh.ReaderForChildren.audioBook_sh.model.vo;

public class SearchCondition {
	private String title;
	private String writer;
	private String publisher;
	
	public SearchCondition() {}

	public SearchCondition(String title, String writer, String publisher) {
		super();
		this.title = title;
		this.writer = writer;
		this.publisher = publisher;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	@Override
	public String toString() {
		return "SearchCondition [title=" + title + ", writer=" + writer + ", publisher=" + publisher + "]";
	}
	
}
