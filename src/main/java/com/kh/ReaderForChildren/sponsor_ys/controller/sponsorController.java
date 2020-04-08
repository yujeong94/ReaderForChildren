package com.kh.ReaderForChildren.sponsor_ys.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ReaderForChildren.sponsor_ys.model.vo.PageInfo;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.Pagination;
import com.kh.ReaderForChildren.member_ej.model.exception.MemberException;
import com.kh.ReaderForChildren.member_ej.model.vo.Member;
import com.kh.ReaderForChildren.sponsor_ys.model.exception.sponsorException;
import com.kh.ReaderForChildren.sponsor_ys.model.service.sponsorService;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.Sponsor;

@SessionAttributes("loginUser")
@Controller
public class sponsorController {


	@Autowired
	private sponsorService spService;
	
	@RequestMapping("splist.sp")
public ModelAndView sponsorList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		// Book 전체 개수
		int listCount = spService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Sponsor> list = spService.selectspList(pi);
		
		
		if(list != null) {
			mv.addObject("pi", pi);
			mv.addObject("list", list);
			mv.setViewName("sponser1");
		} else {
			throw new sponsorException("게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("spupdateView.sp")
	public String spupdateFormView() {
		return "sponser2";
	}
	
	@RequestMapping("mupdate.me")
	public String memberUpdate(@ModelAttribute Member m, @RequestParam("post")int post,
														 @RequestParam("baddress")String bad,
														 @RequestParam("laddress")String lad, Model model) {
		m.setPostalCode(post);
		m.setbAddress(bad);
		m.setlAddress(lad);
		
		
		int result = spService.spupdateMember(m);
	
		if(result > 0) {
			model.addAttribute("loginUser", model);
			return "sponser3";
		}else {
			throw new MemberException("회원정보 수정에 실패했습니다.");
		}
	}
}
	
	


