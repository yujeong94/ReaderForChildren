package com.kh.ReaderForChildren.member_ej.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ReaderForChildren.member_ej.model.exception.MemberException;
import com.kh.ReaderForChildren.member_ej.model.service.MemberService;
import com.kh.ReaderForChildren.member_ej.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("login.me")
	public String memberLogin(Member m, Model model, HttpServletResponse response) {
		
		Member loginUser = mService.memberLogin(m);
		response.setContentType("text/html; charset=utf-8");
		
		if(loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			return "redirect:home.do";
		}else {
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script language='javascript'>");
				out.println("alert('로그인에 실패하였습니다.'); location.href='/ReaderForChildren/home.do';");
				out.println("</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		return null;
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
	public String memberUpdate(@ModelAttribute Member m, @RequestParam("year")String year,
														 @RequestParam("month")String month,
														 @RequestParam("day") String day,
														@RequestParam("selectEmail") String selectEmail, 
														@RequestParam("email1")String email1, Model model) {
	
		m.setBirth(year + "년" + month + "월" + day + "일");
		m.setEmail(email1 + "@" + selectEmail );
		int result = mService.updateMember(m);
	
		if(result > 0) {
			
			model.addAttribute("loginUser", m);
		
			return "mypage";
		}else {
			throw new MemberException("회원정보 수정에 실패했습니다.");
		}
	}
	
	@RequestMapping("insert.me")
	public String memberInsert(@ModelAttribute Member m) {
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			mService.shippingInsert(m);
			return "redirect:home.do";
		}else {
			throw new MemberException("회원가입에 실패하였습니다.");
		}
	}
	
	@RequestMapping("idView.me")
	public String findIdView() {
		return "findId";
	}
	
	@RequestMapping("findId.me")
	public ModelAndView findMemberId(@ModelAttribute Member m, ModelAndView mv) {
		
		String result = mService.findMemberId(m);
		
		if(result != null) {
			mv.addObject("findId", result)
			.addObject("userName", m.getUserName())
			.addObject("email", m.getEmail())
			.setViewName("findId2");
		}else {
			throw new MemberException("정보와 일치하는 아이디가 없습니다.");
		}
		return mv;
	}
	
	@RequestMapping("pwdView.me")
	public String findPwdView() {
		return "findPwd";
	}
	
	@RequestMapping("findPwd.me")
	public ModelAndView findMemberPwd(@ModelAttribute Member m, ModelAndView mv ) {
		
		int result = mService.finMemberPwd(m);
		
		if(result > 0) {
			
			// 랜덤값 생성
			char pwSet1[] = new char[] {
                    'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
                    'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'
		         };
			
			char pwSet2[] = new char[] {
		               '1','2','3','4','5','6','7','8','9','0',
		                    'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
		                    'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'
		         };
			
			int firstRan = (int)(Math.random()*(pwSet1.length));
	        char firstPw = pwSet1[firstRan];
	        String ranPw = "";
	        for(int i = 0; i < 10; i++) {
	           int ranIndex = (int)(Math.random()*(pwSet2.length));
	           ranPw += pwSet2[ranIndex];
	        }
	         
	        String lastPw = firstPw + ranPw + "!";
			
	        HashMap<String, String> map = new HashMap<>();
	        map.put("userId", m.getUserId());
	        map.put("userName", m.getUserName());
	        map.put("email", m.getEmail());
	        map.put("lastPw", lastPw);
	        
			int result2 = mService.updateTemPwd(map);
			
			if(result2 > 0) {
				
				String host = "smtp.naver.com";
				int port = 465;
			    final String admin = "togethertour_team@naver.com";
			    final String password = "totopass0101!";
			    
			    String receiver = m.getEmail();
				String title = "[ReaderForChildren 임시비밀번호]";
				String contents = "임시 비밀번호 : " + lastPw;
				
				Properties props = new Properties();
				props.put("mail.smtp.host", host);
			    props.put("mail.smtp.port", port);
			    props.put("mail.smtp.auth", "true");
			    props.put("mail.smtp.ssl.enable", "true");
			    props.put("mail.smtp.ssl.trust", host);
				
				
				Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator(){
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(admin,password);
					}
				});
				
				try {
					MimeMessage message = new MimeMessage(session);
					message.setFrom(new InternetAddress(admin));
					message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
					
					
					message.setSubject(title);
					
					message.setText(contents, "UTF-8", "html");
					
					Transport.send(message);
			        System.out.println("성공적으로 메일을 보냈습니다.");
					
				} catch (MessagingException e) {
					e.printStackTrace();
				}
				
				
				
			}
			
   
			
			
			
			
			
			
			
			
			
			
			mv.addObject("userName", m.getUserName())
			.addObject("userId", m.getUserId())
			.addObject("email", m.getEmail())
			.setViewName("findPwd2");
		}else {
			throw new MemberException("정보와 일치하는 계정이 없습니다.");
		}
		return mv;
	}
	
	
	@RequestMapping("addSchForm.vo")
	public String addScheduleForm() {
		return "addScheduleForm";
	}
}
