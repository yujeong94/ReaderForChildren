package com.kh.ReaderForChildren.member_ej.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.ReaderForChildren.member_ej.model.exception.MemberException;
import com.kh.ReaderForChildren.member_ej.model.service.MemberService;
import com.kh.ReaderForChildren.member_ej.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
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
	public void idCheck(HttpServletResponse response, @RequestParam("id") String userId) throws IOException {
		
		
		int result = mService.checkId(userId);
		
		response.getWriter().print(result);	
	}
	
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		status.setComplete();
		
		return "redirect:home.do";
	}
	//여기부터 마이페이지 ys
	@RequestMapping("myinfo.me")
	public String myInfoView() {
		return "mypage";
	}
	
	@RequestMapping("mupdateView.me")
	public String updateFormView() {
		return "memberUpdateForm";
	}
	
	@RequestMapping("mpwdUpdateView.me")
	public String pwdUpdateFormView() {
		return "memberPwdUpdateForm";
	}
	
	@RequestMapping("mPwdUpdate.me")
	public String memberPwdUpdate(@RequestParam("newPwd1")String newPwd1, HttpSession session, Model model) {
		Member member = (Member)session.getAttribute("loginUser");
		String userId = member.getUserId();
		
		//암호화
		/*String encPwd = bcryptPasswordEncoder.encode(newPwd1);*/
		
		HashMap<String, String> map = new HashMap<String, String>(); 
		map.put("userId", userId);
		/*map.put("encPwd", encPwd);*/
		
		int result = mService.memberPwdUpdate(map);
		
		if(result > 0) {
			/*member.setUserPwd(encPwd);*/
			member.setUserPwd(newPwd1);
			model.addAttribute("loginUser", member);
			return "mypage";
		}else {
			throw new MemberException("비밀번호 변경에 실패했습니다.");
		}
		
	}
	
	@RequestMapping("mupdate.me")
	public String memberUpdate(@ModelAttribute Member m, Model model) {
	
		
		int result = mService.updateMember(m);
	
		if(result > 0) {
			
			model.addAttribute("loginUser", m);
		
			return "mypage";
		}else {
			throw new MemberException("회원정보 수정에 실패했습니다.");
		}
	}
}
