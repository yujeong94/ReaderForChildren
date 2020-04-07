package com.kh.ReaderForChildren.adminPage_ssj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ReaderForChildren.adminPage_ssj.model.service.AdminPageService;

@Controller
public class AdminPageController {
	
	@Autowired
	private AdminPageService aService;
	
//	관리자 페이지 메뉴바 이동!
	@RequestMapping("userList.ad")
	public String allUserListView() {
		return "allUserList";
	}
	
	@RequestMapping("buyerList.ad")
	public String buyerListView() {
		return "buyerList";
	}
	
	@RequestMapping("sponsorList.ad")
	public String sponsorListView() {
		return "sponsorList";
	}
	
	@RequestMapping("revenue.ad")
	public String revenueStatusView() {
		return "revenueStatus";
	}
	
	@RequestMapping("auditionList.ad")
	public String auditionListView() {
		return "auditionList";
	}
	
	@RequestMapping("eventWinner.ad")
	public String eventWinnerView() {
		return "eventWinner";
	}
	
}
