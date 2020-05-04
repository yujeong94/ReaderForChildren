package com.kh.ReaderForChildren.notice_sh.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ReaderForChildren.adminPage_ssj.model.vo.Admin;
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
	public ModelAndView searchNotice(@RequestParam("searchCondition") String searchCondition,
								@RequestParam(value="page", required=false) Integer page, ModelAndView mv){
		
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
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("searchCondition", searchCondition);
			mv.setViewName("noticeList");
		} else {
			throw new noticeException("공지사항 검색 결과 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	
	// 공지사항 글 작성 페이지로 이동
	@RequestMapping("noInsertView.no")
	public String noticeInsertView() {
		return "noticeInsert";
	}
	
	// 공지사항 글 작성
	@RequestMapping("noInsert.no")
	public ModelAndView noticeInsert(@ModelAttribute Notice n, HttpSession session, ModelAndView mv) {
		
		String adId = ((Admin)session.getAttribute("adminUser")).getUserId();
		n.setAdId(adId);
		
		int result = nService.insertNotice(n);
		
		if(result > 0) {
			mv.addObject("n", n);
			mv.setViewName("redirect:noList.no");
		} else {
			throw new noticeException("공지사항 글 작성에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 공지사항 글 상세 조회
	@RequestMapping("noDetail.no")
	public ModelAndView noticeDetail(int noCode, int page, ModelAndView mv) {
		
		Notice n = nService.selectNotice(noCode);
		
		if(n != null) {
			mv.addObject("n", n);
			mv.addObject("page", page);
			mv.setViewName("noticeDetail");
		} else {
			throw new noticeException("공지사항 글 상세 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	
	// 공지사항 글 수정 페이지로 이동
	@RequestMapping("noUpdateView.no")
	public ModelAndView noticeUpdateView(int noCode, int page, ModelAndView mv) {
		
		Notice n = nService.selectNotice(noCode);
		
		if(n != null) {
			mv.addObject("n", n);
			mv.addObject("page", page);
			mv.setViewName("noticeUpdate");
		} else {
			throw new noticeException("공지사항 글 수정 페이지로의 이동에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 공지사항 글 수정
	@RequestMapping("noUpdate.no")
	public ModelAndView noticeUpdate(@ModelAttribute Notice n, int page, ModelAndView mv) {
		
		int result = nService.updateNotice(n);
		
		if(result > 0) {
			mv.addObject("page", page);
			mv.setViewName("redirect:noDetail.no?noCode="+n.getNoCode());
		} else {
			throw new noticeException("공지사항 글 수정에 실패하였습니다.");
		}
		
		return mv;
	}
	
	
	// 공지사항 글 삭제
	@RequestMapping("noDelete.no")
	public void noticeDelete(int noCode, HttpServletResponse response) {
		int result = nService.deleteNotice(noCode);
		
		response.setContentType("text/html; charset=utf-8");
		
		if(result > 0) {
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script type='text/javascript'>");
				out.println("alert('게시글이 삭제되었습니다.'); location.href='noList.no';");
				out.println("</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			throw new noticeException("공지사항 글 삭제에 실패하였습니다.");
		}
		
	}
	
}
