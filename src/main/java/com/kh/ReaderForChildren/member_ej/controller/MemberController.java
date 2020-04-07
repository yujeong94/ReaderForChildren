package com.kh.ReaderForChildren.member_ej.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ReaderForChildren.member_ej.model.service.MemberService;
import com.kh.ReaderForChildren.member_ej.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	
	
	@RequestMapping("login.me")
	public String memberLogin(Member m, Model model) {
		
		Member loginUser = mService.memberLogin(m);
		
	}
	
	
}
