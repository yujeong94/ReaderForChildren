package com.kh.ReaderForChildren.adminPage_ssj.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ReaderForChildren.adminPage_ssj.model.exception.AdminPageException;
import com.kh.ReaderForChildren.adminPage_ssj.model.service.AdminPageService;
import com.kh.ReaderForChildren.adminPage_ssj.model.vo.Admin;
import com.kh.ReaderForChildren.adminPage_ssj.model.vo.AdminOrderList;
import com.kh.ReaderForChildren.adminPage_ssj.model.vo.ReaderAudio;
import com.kh.ReaderForChildren.audition_yj.model.vo.Audition;
import com.kh.ReaderForChildren.audition_yj.model.vo.Career;
import com.kh.ReaderForChildren.audition_yj.model.vo.Reader;
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
	public ModelAndView buyerListView(ModelAndView mv) {
		
		ArrayList<AdminOrderList> list = aService.buyerListView();
		
		mv.addObject("list", list).setViewName("buyerList");
		
		return mv;
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
	public ModelAndView revenueStatusView(ModelAndView mv) {
		
		Integer r = aService.revenueView();
		
		mv.addObject("r", r).setViewName("revenueStatus");
		
		return mv;
	}
	
	// 오디션 리스트
	@RequestMapping("auditionList.ad")
	public ModelAndView auditionListView(ModelAndView mv) {
		
		ArrayList<Reader> list = aService.selectAuditionList();
		
		if(list != null) {
			mv.addObject("list", list).setViewName("auditionList");
		} else {
			throw new AdminPageException("오디션 리스트 조회 실패");
		}
		
		return mv;
	}
	
	// 오디션 카테고리
	@RequestMapping("auditionListSelect.ad")
	public ModelAndView auditionListSelectView(ModelAndView mv, @RequestParam("selectbox") String selectbox) {
		
		ArrayList<Reader> list = aService.selectCategoryAuditionList(selectbox);
		
		if(list != null) {
			mv.addObject("list", list).addObject("selectbox", selectbox).setViewName("auditionList");
		} else {
			throw new AdminPageException("카테고리별 오디션 리스트 조회 실패");
		}
		
		return mv;
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
		ArrayList<Support> support = aService.selectUserSupport(userId);
		ArrayList<ReaderAudio> audio = aService.selectUserReaderAudio(userId);
		
		if(member != null) {
			mv.addObject("member", member).addObject("support", support).addObject("audio", audio).setViewName("userInfoForm");
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
	
	// auditionForm 상세보기
	@RequestMapping("auditionForm.ad")
	public ModelAndView auditionDetailView(ModelAndView mv, @RequestParam("userId") String userId) {
		Member m = aService.selectUser(userId);
		Reader r = aService.selectReader(userId);
		ArrayList<Career> c = aService.selectCareer(userId);
		Audition a = aService.selectAudition(r.getaNum());
		
		if(r != null && c != null) {
			mv.addObject("r", r).addObject("c", c).addObject("a", a).addObject("m", m).setViewName("auditionForm");
		} else {
			throw new AdminPageException("지원서 상세페이지 실패");
		}
		
		return mv;
	}
	
	// audition 결과
	// 합격
	@RequestMapping("passReader.ad")
	public String resultPassReader(@RequestParam("userId") String userId) {
		
		int result1 = aService.resultPassReaderTable(userId);
		int result2 = aService.resultPassMemberTable(userId);
		
		if(result1 > 0 && result2 > 0) {
			return "redirect:auditionList.ad";
		} else {
			throw new AdminPageException("합격 결과 등록 실패");
		}
	}
	
	// 불합격
	@RequestMapping("failReader.ad")
	public String resultFailReader(@RequestParam("userId") String userId) {
		
		int result1 = aService.resultFailReaderTable(userId);
		
		if(result1 > 0) {
			return "redirect:auditionList.ad";
		} else {
			throw new AdminPageException("뷸합격 결과 등록 실패");
		}
	}
	
	// 영구정지
	@RequestMapping("banReader.ad")
	public String resultBanReader(@RequestParam("userId") String userId) {
		
		int result1 = aService.resultBanReaderTable(userId);
		int result2 = aService.resultBanMemberTable(userId);
		
		if(result1 > 0 && result2 > 0) {
			return "redirect:auditionList.ad";
		} else {
			throw new AdminPageException("영구정지 결과 등록 실패");
		}
	}
	
	// buyerList 배송접수
	@RequestMapping("orderReceipt.ad")
	@ResponseBody
	public String orderReceipt(@RequestParam("userId") String userId, @RequestParam("orNum") int orNum) {
		
		AdminOrderList ao = new AdminOrderList();
		ao.setUser_id(userId);
		ao.setOr_no(orNum);
		
		int result = aService.orderReceipt(ao);
		
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// buyerList 카테고리
	@RequestMapping("buyerListCategory.ad")
	public ModelAndView buyerListCategory(ModelAndView mv, @RequestParam("selectbox") String selectbox) {
		
		ArrayList<AdminOrderList> list = aService.buyerListCategory(selectbox);
		
		if(list != null) {
			mv.addObject("list", list).addObject("selectbox", selectbox).setViewName("buyerList");
		} else {
			throw new AdminPageException("카테고리별 구매자 리스트 조회 실패");
		}
		
		return mv;
	}
	
	// 전체수익 달별
	@RequestMapping("revenueSearch.ad")
	@ResponseBody
	public int revenueSearch(@RequestParam("dateYear") String dateYear, @RequestParam("dateMonth") String dateMonth) {
		
		int dateMonth1 = Integer.parseInt(dateMonth) + 1;
		String dateMonth2 = Integer.toString(dateMonth1);
		
		if(dateMonth.length() == 1) {
			dateMonth = "0" + dateMonth;
		}
		if(dateMonth2.length() == 1) {
			dateMonth2 = "0" + dateMonth2;
		}
		
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("year", dateYear);
		map.put("month", dateMonth);
		map.put("month2", dateMonth2);
		
		int r = aService.revenueSearch(map);
		System.out.println("Controller r : " + r);
		if(r > 0) {
			return r;
		} else {
			return 0;
		}
	}
	
	
	
	
}
