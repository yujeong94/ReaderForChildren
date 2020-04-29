package com.kh.ReaderForChildren.notice_sh.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.ReaderForChildren.notice_sh.model.exception.noticeException;
import com.kh.ReaderForChildren.notice_sh.model.service.noticeService;
import com.kh.ReaderForChildren.notice_sh.model.vo.Notice;
import com.kh.ReaderForChildren.notice_sh.model.vo.PageInfo;
import com.kh.ReaderForChildren.notice_sh.model.vo.Pagination;
import com.kh.ReaderForChildren.notice_sh.model.vo.SearchCondition;

@Controller
public class noticeController {

	@Autowired
	private noticeService nService;
	
	// 공지사항 리스트
	@RequestMapping("noList.no")
	public ModelAndView noticeList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = nService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Notice> list = nService.selectList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("noticeList");
		} else {
			throw new noticeException("공지사항 리스트 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 공지사항 카테고리 검색 결과 리스트
	@RequestMapping("search.no")
	public void searchNotice(@RequestParam("searchCondition") String searchCondition,
								@RequestParam(value="page", required=false) Integer page, HttpServletResponse response) throws JsonIOException, IOException {
		
		SearchCondition sc = new SearchCondition();
		if(searchCondition.equals("delivery")) {
			sc.setDelivery("결제/배송");
		} else if(searchCondition.equals("audition")) {
			sc.setAudition("리더 오디션");
		} else if(searchCondition.equals("sponsor")) {
			sc.setSponsor("아동 후원");
		} else if(searchCondition.equals("volunteer")) {
			sc.setVolunteer("봉사활동");
		} else if(searchCondition.equals("record")) {
			sc.setRecord("녹음부스 예약");
		} else {
			sc.setEvent("이벤트");
		}
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = nService.getSearchListCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Notice> list = nService.selectSearchList(pi, sc);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
		gson.toJson(pi, response.getWriter());
		gson.toJson(searchCondition, response.getWriter());
		
	}
}
