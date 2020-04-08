package com.kh.ReaderForChildren.adminPage_ssj.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ReaderForChildren.adminPage_ssj.model.exception.AdminPageException;
import com.kh.ReaderForChildren.adminPage_ssj.model.service.AdminPageService;
import com.kh.ReaderForChildren.member_ej.model.vo.Member;

@Controller
public class AdminPageController {
	
	@Autowired
	private AdminPageService aService;
	
//	관리자 페이지 메뉴바 이동!
	@RequestMapping("userList.ad")
	public ModelAndView allUserListView(ModelAndView mv) {
		
		ArrayList<Member> list = aService.selectUserList();
		
		if(list != null	) {
			mv.addObject("list", list);
			mv.setViewName("allUserList");
		} else {
			throw new AdminPageException("전체 회원 리트스 조회에 실패하였습니다.");
		}
		
		return mv;
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
	
	// 검색기능
	@RequestMapping("userSearch.ad")
	public ModelAndView userSearchView(ModelAndView mv, @RequestParam("userId") String userId) {
		
		ArrayList<Member> list = aService.selectUserSearch(userId);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.setViewName("allUserList");
		} else {
			throw new AdminPageException("검색 실패");
		}
		
		return mv;
	}
	
	// 회원 상세 정보
	@RequestMapping("userInfo.ad")
	public ModelAndView userInfoDetail(@RequestParam("userId") String userId, ModelAndView mv) {
		
		Member member = aService.selectUserInfo(userId);
		
		if(member != null) {
			mv.addObject("member", member).setViewName("userInfoForm");
		} else {
			throw new AdminPageException("회원 상세 정보 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
}
