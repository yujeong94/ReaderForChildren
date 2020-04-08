package com.kh.ReaderForChildren.event_ssj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ReaderForChildren.event_ssj.model.service.EventService;

@Controller
public class EventController {
	
	@Autowired
	private EventService eService; 
	
//	관리자 페이지 메뉴바 이동!
	@RequestMapping("eventInsert.ev")
	public String eventInsertView() {
		return "eventInsert";
	}
	
	// list로 이동!
	@RequestMapping("eventList.ev")
	public String eventListView() {
		return "eventList";
	}
	
}
