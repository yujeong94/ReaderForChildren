package com.kh.ReaderForChildren.chat_ej.model.vo;

import java.sql.Date;

import com.google.gson.Gson;

public class Chat {
	private int chatNo;
	private int roomNo;
	private String chatContent;
	private Date chatTime;
	private String adId;
	private String UserId;
	
	public Chat() {}

	public Chat(int chatNo, int roomNo, String chatContent, Date chatTime, String adId, String userId) {
		super();
		this.chatNo = chatNo;
		this.roomNo = roomNo;
		this.chatContent = chatContent;
		this.chatTime = chatTime;
		this.adId = adId;
		UserId = userId;
	}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getChatContent() {
		return chatContent;
	}

	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}

	public Date getChatTime() {
		return chatTime;
	}

	public void setChatTime(Date chatTime) {
		this.chatTime = chatTime;
	}

	public String getAdId() {
		return adId;
	}

	public void setAdId(String adId) {
		this.adId = adId;
	}

	public String getUserId() {
		return UserId;
	}

	public void setUserId(String userId) {
		UserId = userId;
	}
	
	public static Chat convertMessage(String source) {
		Chat message = new Chat();
		Gson gson = new Gson();
		message = gson.fromJson(source,  Chat.class);
		return message;
	}

	@Override
	public String toString() {
		return "Chat [chatNo=" + chatNo + ", roomNo=" + roomNo + ", chatContent=" + chatContent + ", chatTime="
				+ chatTime + ", adId=" + adId + ", UserId=" + UserId + "]";
	}
	
	
}
