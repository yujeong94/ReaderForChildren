package com.kh.ReaderForChildren.sponsor_ys.controller;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ReaderForChildren.member_ej.model.service.MemberService;
import com.kh.ReaderForChildren.member_ej.model.vo.Member;
import com.kh.ReaderForChildren.sponsor_ys.model.exception.sponsorException;
import com.kh.ReaderForChildren.sponsor_ys.model.service.sponsorService;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.PageInfo;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.Pagination;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.Sponsor;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.Support;

@Controller
public class sponsorController {


	@Autowired
	private sponsorService spService;
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("splist.sp")
public ModelAndView sponsorList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		
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
	
	@RequestMapping("suinsertView.sp")
	public ModelAndView suinsertFormView(ModelAndView mv, HttpSession session) {
		String email = ((Member)session.getAttribute("loginUser")).getEmail();
	      String birth = ((Member)session.getAttribute("loginUser")).getBirth();
	      
	      String bir1 = birth.substring(0,4);
	      String bir2 = birth.substring(4,6);
	      String bir3 = birth.substring(6,8);
	      String newBirth = bir1+"년"+bir2+"월"+bir3+"일";
	      
	      String[] emailArr = email.split("@");
	      String email1 = emailArr[0];
	      String email2 = emailArr[1];
	      
	      mv.addObject("email1",email1).addObject("email2",email2).addObject("bir1",bir1).addObject("bir2",bir2).addObject("bir3",bir3).addObject("newBirth",newBirth).setViewName("sponser2");
	      
		return mv;
	}
	
	@RequestMapping("suupdateView.sp")
	public String suupdateFormView() {
		return "sponser3";
	}
	
	//후원 업데이트?
	/*@RequestMapping("mupdate.sp")
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
	}*/
	
	@RequestMapping("sllist.sp")
	public ModelAndView supportList(@RequestParam(value="page", required=false) Integer page,ModelAndView mv, HttpSession session) {
			
			Member loginUser = (Member)session.getAttribute("loginUser");
			String userId = loginUser.getUserId();	
		
		
			int currentPage = 1;
			if(page != null) {
				currentPage = page;
			}
			
			// Book 전체 개수
			int listCount = spService.getSponserListCount();
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			ArrayList<Support> list = spService.selectslList(pi, userId);
			
			if(list != null) {
				mv.addObject("pi", pi);
				mv.addObject("list", list);
				mv.setViewName("sponserlist");
				/*mv.setViewName("sponser2");*/
			} else {
				throw new sponsorException("게시글 전체 조회에 실패하였습니다.");
			}
			
			return mv;
		}
	
	@RequestMapping("suinsert.sp")												
	public String boardInsert(HttpSession session, @RequestParam("donation") int donation, String spName, Date supdate, String spCode) {
		
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		System.out.println(donation);
		
		Support support = new Support();
		support.setDonation(donation);
		support.setSpName(spName);
		support.setUserId(userId);
		support.setSupdate(supdate);
		support.setSpCode(spCode);

		int result = spService.insertSupport(support);
		int result2 = spService.updateMember(support);
		
		/*Member loginUser = */
		
		if(result > 0 && result2 > 0) {
			return "sponser3";
		}else {
			throw new sponsorException("실패");
		}
	}
	
	
	/*@RequestMapping("suupdate.sp")
	public String memberUpdate(@ModelAttribute Support s,  Member m, Model model)  {
		
		
		int result = spService.suupdateMember(s);
	
		if(result > 0) {
			model.addAttribute("loginUser", m);
			return "sponser3";
		}else {
			throw new MemberException("결제값 불러오기 실패.");
		}
	}
	
	*/
	
}
	



