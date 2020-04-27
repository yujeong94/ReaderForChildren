package com.kh.ReaderForChildren.adminPage_ssj.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ReaderForChildren.adminPage_ssj.model.exception.AdminPageException;
import com.kh.ReaderForChildren.adminPage_ssj.model.service.AdminPageService;
import com.kh.ReaderForChildren.adminPage_ssj.model.vo.Admin;
import com.kh.ReaderForChildren.event_ssj.model.vo.Event;
import com.kh.ReaderForChildren.member_ej.model.vo.Member;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.Support;

@SessionAttributes("adminUser")
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
	public ModelAndView sponsorListView(ModelAndView mv) {
		
		ArrayList<Support> list = aService.selectSponsorList();
		
		if(list != null) {
			mv.addObject("list", list).setViewName("sponsorList");
		} else {
			throw new AdminPageException("후원자 리스트 조회 실패");
		}
		
		return mv;
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
	public ModelAndView eventWinnerView(ModelAndView mv) {
		
		ArrayList<Event> list = aService.eventWinnerList();
		
		if(list != null) {
			mv.addObject("list", list).setViewName("eventWinner");
		} else {
			throw new AdminPageException("이벤트 리스트 출력 실패");
		}
		
		return mv;
	}
	
	// 이벤트 리스트 카테고리 별 
	@RequestMapping("eventListSelect.ad")
	public ModelAndView eventListSelect(ModelAndView mv, @RequestParam("selectbox") String selectbox) {
		
		ArrayList<Event> list = null;
		
		if(selectbox.equals("전체")) {
			list = aService.eventWinnerList();
		} else if(selectbox.equals("진행")) {
			list = aService.eventIngList();
		} else {
			list = aService.eventEndList();
		}
		
		if(list != null) {
			mv.addObject("list", list).addObject("selectbox", selectbox).setViewName("eventWinner");
		} else {
			throw new AdminPageException("이벤트 리스트 출력 실패");
		}
				
		return mv;
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
	
	@RequestMapping("loginAdmin.ad")
	public String adminLogin(Admin a, Model model, HttpServletResponse response) {
		Admin adminUser = aService.adminLogin(a);
		response.setContentType("text/html; charset=utf-8");
		
		if(adminUser != null) {
			model.addAttribute("adminUser", adminUser);
			return "redirect:home.do";
		}else {
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script language='javascript'>");
				out.println("alert('관리자 로그인에 실패하였습니다.'); location.href='/ReaderForChildren/home.do';");
				out.println("</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	
	@RequestMapping("logout.ad")
	public String logout(SessionStatus status) {
		status.setComplete();
		
		return "redirect:home.do";
	}
	
	// sponsor 검색기능
	@RequestMapping("sponsorSearch.ad")
	public ModelAndView sponsorSearch(ModelAndView mv, @RequestParam("spName") String spName) {
		
		ArrayList<Support> list = aService.sponsorSearch(spName);
		
		if(list != null) {
			mv.addObject("list", list).setViewName("sponsorList");
		} else {
			throw new AdminPageException("후원명 검색 실패");
		}
		
		return mv;
	}
	
}
