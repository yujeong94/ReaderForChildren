package com.kh.ReaderForChildren.chat_ej.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Controller
public class ChatController {
	
	
		
	  @RequestMapping("chatView.ch")
	  public String chatView() { 
		  return "chat2"; 
	  }
	 
	
	
	
}
