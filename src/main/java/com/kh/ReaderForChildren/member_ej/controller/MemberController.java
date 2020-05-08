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
	   public ModelAndView myInfoView(ModelAndView mv, HttpSession session) {
	      String email = ((Member)session.getAttribute("loginUser")).getEmail();
	      String birth = ((Member)session.getAttribute("loginUser")).getBirth();
	      
	   
	      String bir1 = birth.substring(0,4);
	      String bir2 = birth.substring(4,6);
	      String bir3 = birth.substring(6,8);
	      String newBirth = bir1+"년"+bir2+"월"+bir3+"일";
	      
	      String[] emailArr = email.split("@");
	      String email1 = emailArr[0];
	      String email2 = emailArr[1];
	      
	      int donation = ((Member)session.getAttribute("loginUser")).getDonation();
	      
//	      String[] birthArr = birth.split("년");
//	      String bir1 = birthArr[0];
//	      String bir2 = birthArr[1];
//	      String[] birth2Arr = birth.split("일");
//	      String bir3 = birth2Arr[0];
	      
	      
	      mv.addObject("email1",email1).addObject("email2",email2).addObject("bir1",bir1).addObject("bir2",bir2).addObject("bir3",bir3).addObject("newBirth",newBirth).addObject("donation",donation).setViewName("mypage");
	      
	      return mv;
	   }
	   
	   @RequestMapping("mupdateView.me")
	   public ModelAndView updateFormView(ModelAndView mv, HttpSession session) {
	      String email = ((Member)session.getAttribute("loginUser")).getEmail();
	      String birth = ((Member)session.getAttribute("loginUser")).getBirth();
	      
	      String bir1 = birth.substring(0,4);
	      String bir2 = birth.substring(4,6);
	      String bir3 = birth.substring(6,8);
	      String newBirth = bir1+"년"+bir2+"월"+bir3+"일";
	      String[] emailArr = email.split("@");
	      String email1 = emailArr[0];
	      String email2 = emailArr[1];
	      
	      mv.addObject("email1",email1).addObject("email2",email2).addObject("bir1",bir1).addObject("bir2",bir2).addObject("bir3",bir3).addObject("newBirth",newBirth).setViewName("memberUpdateForm");
	      
	      return mv;
	   }
	
	@RequestMapping("mpwdUpdateView.me")
	public String pwdUpdateFormView() {
		return "memberPwdUpdateForm";
	}
	
	@RequestMapping("mPwdUpdate.me")
	public String memberPwdUpdate(@RequestParam("newPwd1")String newPwd1,@RequestParam("userPwd")String userPwd, HttpSession session, Model model) {
		Member member = (Member)session.getAttribute("loginUser");
		String userId = member.getUserId();
		
		//암호화
		/*String encPwd = bcryptPasswordEncoder.encode(newPwd1);*/
		
		HashMap<String, String> map = new HashMap<String, String>(); 
		map.put("userId", userId);
		map.put("userPwd", userPwd);
		map.put("newPwd1", newPwd1);
		
		int result = mService.memberPwdUpdate(map);
		
		if(result > 0) {
			member.setUserPwd(newPwd1);
			model.addAttribute("loginUser", member);
			return "mypage";
		}else {
			throw new MemberException("비밀번호 변경에 실패했습니다.");
		}
		
	}
	
	@RequestMapping("mupdate.me")
	public String memberUpdate(@ModelAttribute Member m,  HttpSession session, 
														 @RequestParam("bir1") String bir1,
														 @RequestParam("bir2") String bir2,
														 @RequestParam("bir3") String bir3,
														@RequestParam("email1") String email1, 
														@RequestParam("email2") String email2,
														@RequestParam("donation")int donation, Model model) {
		
		/*String num1 = phone.substring(0,3);
		String num2 = phone.substring(3,7);
		String num3 = phone.substring(7,11);*/
		
		m.setDonation(donation);
		m.setBirth(bir1+bir2+bir3);
		m.setEmail(email1 + "@" + email2 );
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
		
		String msg = "정보와 일치하는 아이디가 없습니다.";
		
		if(result != null) {
			mv.addObject("findId", result)
			.addObject("userName", m.getUserName())
			.addObject("email", m.getEmail())
			.setViewName("findId2");
		}else {
			mv.addObject("msg", msg).setViewName("findId");
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
		
		String msg = "정확한 정보를 입력해주세요.";
		
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
			mv.addObject("msg", msg).setViewName("findPwd");
		}
		return mv;
	}
	
	
	@RequestMapping("addSchForm.vo")
	public String addScheduleForm() {
		return "addScheduleForm";
	}
	
}
