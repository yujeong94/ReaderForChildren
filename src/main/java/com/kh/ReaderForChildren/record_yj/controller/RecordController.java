package com.kh.ReaderForChildren.record_yj.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.ReaderForChildren.member_ej.model.vo.Member;
import com.kh.ReaderForChildren.record_yj.model.exception.RecordException;
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
	public ModelAndView InsertRecord(@ModelAttribute RecBooth rb, @RequestParam("dateInfo") String dateInfo, HttpSession session,
								ModelAndView mv) {
		
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		System.out.println(dateInfo);
		String[] dateArr = dateInfo.split("-");
		int year = Integer.parseInt(dateArr[0]);
		int month = Integer.parseInt(dateArr[1]);
		int day = Integer.parseInt(dateArr[2]);
		
		Date rDate = new Date(new GregorianCalendar(year,month-1,day).getTimeInMillis());
		
		rb.setUserId(userId);
		rb.setrDate(rDate);
		
		int result = reService.insertRecord(rb);
		
		if(result > 0) {
			String msg = "예약이 완료되었습니다. 마이페이지에서 예약 내역을 확인하세요 :)";
			mv.addObject("msg", msg).setViewName("recordForm");
		} else {
			throw new RecordException("예약 실패");
		}
		
		return mv;
	}
	
	@RequestMapping("recInfo.re")
	public void recInfo(HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<RecBooth> recList = reService.selectRecBooth();
		
		System.out.println("recList? " + recList.get(0));
		
		for(RecBooth rb : recList) {
			rb.setRecCompany(URLEncoder.encode(rb.getRecCompany(),"UTF-8"));
			rb.setAddress(URLEncoder.encode(rb.getAddress(), "UTF-8"));
		}
		
		Gson gson = new Gson();
		gson.toJson(recList, response.getWriter());
	}
}
