package com.kh.ReaderForChildren.chat_ej.controller;

import java.io.IOException;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/adminsocket")
public class AdminSocket {
	private static Session admin = null;
	
	@OnOpen
	public void handleOpen(Session userSession) {
		if (admin != null) {
			try {
				admin.close();
			} catch (IOException e) {
			}
		}
		admin = userSession;
		for(String key : UserSocket.getUserKeys()) {
			visit(key);
		}
	}
	
	@OnMessage
	public void handleMessage(String message, Session userSession) throws IOException {
		String[] split = message.split("#####", 2);
		String key = split[0];
		String msg = split[1];
		
		// 일반 유저의 key로 탐색후 메시지 전송
		UserSocket.sendMessage(key, msg);
	}
	
	@OnClose
	public void handleClose(Session userSession) {
		admin = null;
	}
	// 운영자 유저로 메시지를 보내는 함수
	private static void send(String message) {
		if (admin != null) {
			try {
				admin.getBasicRemote().sendText(message);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 일반 유저가 접속했을 때, 운영자 유저에게 알리는 함수
	public static void visit(String key) {
		send("{\"status\":\"visit\", \"key\":\"" + key + "\"}");
	}
	// 일반 유저가 메시지를 보낼 때, 운영자 유저에게 알리는 함수
	public static void sendMessage(String key, String message) {
		send("{\"status\":\"message\", \"key\":\"" + key + "\", \"message\":\"" + message + "\"}");
	}
	public static void bye(String key) {
		send("{\"status\":\"bye\", \"key\":\"" + key + "\"}");
	}

}
