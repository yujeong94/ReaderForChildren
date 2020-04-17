package com.kh.ReaderForChildren.chat_ej.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	
	
	@RequestMapping("chatView.ch")
	public String chatView() {
		return "chat";
	}
}
