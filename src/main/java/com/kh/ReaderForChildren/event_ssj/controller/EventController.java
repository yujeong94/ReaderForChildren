package com.kh.ReaderForChildren.event_ssj.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ReaderForChildren.event_ssj.model.service.EventService;
import com.kh.ReaderForChildren.event_ssj.model.vo.Event;

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
	
	@RequestMapping("eventDataInsert.ev")
	public String eventInsert(@ModelAttribute Event e, @RequestParam("uploadBtn1") MultipartFile uploadFile, 
								HttpServletRequest request) {
		System.out.println("eventinsert e : " + e);
		System.out.println("eventinsert uploadFile : " + uploadFile);
		
		return null;
	}
	
}
