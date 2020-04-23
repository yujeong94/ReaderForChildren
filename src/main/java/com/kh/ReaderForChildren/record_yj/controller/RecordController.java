package com.kh.ReaderForChildren.record_yj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ReaderForChildren.record_yj.model.service.RecordService;
import com.kh.ReaderForChildren.record_yj.model.vo.RecBooth;

@Controller
public class RecordController {
	
	@Autowired
	private RecordService reService;
	
	@RequestMapping("recordView.re")
	public String recordView() {
		return "recordForm";
	}
	
	@RequestMapping("testMap.re")
	public String testMap() {
		return "testMap";
	}
	
	@RequestMapping("insertRecord.re")
	public String InsertRecord(@ModelAttribute RecBooth rb) {
		return null;
	}
}
