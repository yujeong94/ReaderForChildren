package com.kh.ReaderForChildren.chat_ej.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Pattern;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.ReaderForChildren.chat_ej.model.service.ChatService;
import com.kh.ReaderForChildren.chat_ej.model.service.ChatServiceImpl;
import com.kh.ReaderForChildren.chat_ej.model.vo.Chat;

@Controller
@ServerEndpoint("/chat")
public class ChatWebSocketHandler extends TextWebSocketHandler {

	@Autowired
	private ChatService cService;

	/*
	 * private List<WebSocketSession> connectedUsers;
	 * 
	 * public ChatWebSocketHandler() { connectedUsers = new
	 * ArrayList<WebSocketSession>(); }
	 * 
	 * private Map<String, WebSocketSession> users = new ConcurrentHashMap<String,
	 * WebSocketSession>();
	 */

	private static List<Session> sessionUsers = Collections.synchronizedList(new ArrayList<>());

	private static Pattern pattern = Pattern.compile("^\\{\\{.*?\\}\\}");

	@OnOpen
	public void handleOpen(Session userSession) {
		sessionUsers.add(userSession);
		System.out.println("client is now connected...");
		System.out.println(sessionUsers);
	}

	@OnMessage
	public void handleMessage(String message, Session userSession) throws IOException {
		System.out.println("receive from client : " + message);

//		String name = "";

//		Matcher matcher = pattern.matcher(message);
//
//		if (matcher.find()) {
//			name = matcher.group();
//		}
//		final String msg = message.replaceAll(pattern.pattern(), "");
//		final String username = name.replaceFirst("^\\{\\{", "").replaceFirst("\\}\\}$", "");
		String[] idnickNContent = message.split(":");
		String msg = idnickNContent[1];
		
		String[] idNnick = idnickNContent[0].split("/");
		String username = idNnick[1].substring(0, idNnick[1].length()-1);
		String userId = idNnick[0].substring(1);
		
//		Chat chatVo = new Chat();
//		chatVo.setUserId(userId);
//		chatVo.setChatContent(msg);
//		
//		ChatService service = new ChatServiceImpl();
//		int result = service.insertChat(chatVo);
//		System.out.println(result);
		
//		HttpSession loginsession = request.getSession();
//
//		Member loginUser = (Member) loginsession.getAttribute("loginUser");
//		String userId = loginUser.getUserId();
//
//		Chat chatVo = new Chat();
//		chatVo.setUserId(userId);
//		chatVo.setChatContent(msg);
//		
//		System.out.println(chatVo);
		
//		int result = cService.insertChat(chatVo);
//		System.out.println(result);

		sessionUsers.forEach(session -> {

			if (session == userSession) {
				return;
			}
			try {
				session.getBasicRemote().sendText(username + " : " + msg);
			} catch (IOException e) {
				e.printStackTrace();
			}
		});

	}

	@OnClose
	public void handleClose(Session userSession) {
		sessionUsers.remove(userSession);

		System.out.println("client is now disconnected...");
	}
// ---------------------------------------------
//	@Override
//	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//
//		/*
//		 * log(session.getId() + " 연결 됨!!");
//		 * 
//		 * users.put(session.getId(), session); connectedUsers.add(session);
//		 */
//		System.out.println("afterConnectionEstablished :" + session);
//	}
//
//	@Override
//	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//
//		/*
//		 * log(session.getId() + " 연결 종료됨"); connectedUsers.remove(session);
//		 * users.remove(session.getId());
//		 */
//		System.out.println("afterConnectionEstablished :" + session);
//	}
//	
//	@Override
//	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//		
//		/*System.out.println(message.getPayload());
//
//		Map<String, Object> map = null;
//
//		Chat chat = Chat.convertMessage(message.getPayload());*/
//
//		System.out.println("afterConnectionEstablished :" + session);
//		
//   }
//	
//	
//	
//	
//	
//	
//	
//	
//	private void log(String logmsg) {
//
//		System.out.println(new Date() + " : " + logmsg);
//
//	}

}
