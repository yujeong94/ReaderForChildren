package com.kh.ReaderForChildren.notice_sh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.ReaderForChildren.audioBook_sh.model.vo.PageInfo;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.Pagination;
import com.kh.ReaderForChildren.notice_sh.model.service.noticeService;

@Controller
public class noticeController {

	@Autowired
	private noticeService nService;
	
	
	@RequestMapping("noList.no")
	public String noticeList(@RequestParam(value="page", required=false) Integer page) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = nService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		return "noticeList";
	}
}
