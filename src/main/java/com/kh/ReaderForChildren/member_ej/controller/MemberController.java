package com.kh.ReaderForChildren.member_ej.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.ReaderForChildren.member_ej.model.exception.MemberException;
import com.kh.ReaderForChildren.member_ej.model.service.MemberService;
import com.kh.ReaderForChildren.member_ej.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	
	
	@RequestMapping("login.me")
	public String memberLogin(Member m, Model model) {
		
		System.out.println("m :" + m);
		
		Member loginUser = mService.memberLogin(m);
		
		System.out.println("loginUser : " + loginUser );
		
		if(loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			return "redirect:home.do";
		}else {
			throw new MemberException("로그인에 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("join.me")
	public String joinView() {
		return "memberJoin";
	}
	
	@RequestMapping("check.me")
	public int idCheck(@RequestParam("id") String userId) {
		
		System.out.println("id : "+ userId);
		
		int result = mService.checkId(userId);
		
		System.out.println("result : " + result);
		
		return result;	
	}
	
	@RequestMapping("myinfo.me")
	public String myInfoView() {
		return "mypage";
	}
	
	@RequestMapping("mupdateView.me")
	public String updateFormView() {
		return "memberUpdateForm";
	}
	
	@RequestMapping("mupdate.me")
	public String memberUpdate(@ModelAttribute Member m, @RequestParam("post")int post,
														 @RequestParam("baddress")String bad,
														 @RequestParam("laddress")String lad, Model model) {
		m.setPostalCode(post);
		m.setbAddress(bad);
		m.setlAddress(lad);
		
		int result = mService.updateMember(m);
	
		if(result > 0) {
			model.addAttribute("loginUser", model);
			return "mypage";
		}else {
			throw new MemberException("회원정보 수정에 실패했습니다.");
		}
	}
}
