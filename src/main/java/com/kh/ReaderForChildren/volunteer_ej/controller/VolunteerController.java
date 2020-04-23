package com.kh.ReaderForChildren.volunteer_ej.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ReaderForChildren.member_ej.model.exception.MemberException;
import com.kh.ReaderForChildren.member_ej.model.vo.Member;
import com.kh.ReaderForChildren.volunteer_ej.model.exception.VolunteerException;
import com.kh.ReaderForChildren.volunteer_ej.model.service.VolunteerService;
import com.kh.ReaderForChildren.volunteer_ej.model.vo.MyVolunteerActivity;
import com.kh.ReaderForChildren.volunteer_ej.model.vo.Volunteer;
import com.kh.ReaderForChildren.volunteer_ej.model.vo.VolunteerSchedule;

@Controller
public class VolunteerController {

	@Autowired
	private VolunteerService vService;

	@RequestMapping("volView.vo")
	public ModelAndView volunteerView(ModelAndView mv) {
		
		ArrayList<VolunteerSchedule> vs = vService.getSchedule();
		mv.addObject("vs", vs).setViewName("volSchedule");
		
		return mv;
	}

	@RequestMapping("addVolSchedule.vo")
	public String addVolSchedule(@ModelAttribute VolunteerSchedule vs, Model model) {

		int result = vService.addVolSchedule(vs);

		/* ArrayList<VolunteerSchedule> vsS = vService.getSchedule(); */

//		model.addAttribute("content", vs.getVolContent());
//		model.addAttribute("start", vs.getVolStart());
//		model.addAttribute("end", vs.getVolEnd());
		
		model.addAttribute("result", result);

		return "addScheduleForm";

	}

	@RequestMapping("submitInform.vo")
	public String serviceAsk(@ModelAttribute Volunteer v, HttpSession session, HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out;

		int result = vService.checkMax(v);
		
		if(result>0) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			String userId = loginUser.getUserId();
			v.setUserID(userId);
			
			int result2 = vService.serviceAsk(v);
			
			if(result2 > 0) {
				try {
					out = response.getWriter();
					out.println("<script language='javascript'>");
					out.println("alert('신청이 완료되었습니다.'); location.href='/ReaderForChildren/volView.vo';");
					out.println("</script>");
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else {
				throw new VolunteerException("봉사활동 신청 실패.");
			}
		}else {
			
			try {
				out = response.getWriter();
				out.println("<script language='javascript'>");
				out.println("alert('모집인원이 초과되었습니다.'); location.href='/ReaderForChildren/volView.vo';");
				out.println("</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		return null;
	}
	
	@RequestMapping("myVolunteer.vo")
	public ModelAndView myVolunteerView(ModelAndView mv, HttpSession session) {
		
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		ArrayList<MyVolunteerActivity> mva = vService.selMyVol(userId);
		
		mv.addObject("mva", mva)
		.setViewName("myVolunteer");
		
		
		return mv;
	}
	
	@RequestMapping("cancelVol.vo")
	public String cancelVolunteer(@RequestParam("vlNum2") int vlNum2) {
		
		int result = vService.cancelVol(vlNum2);
		
		if(result > 0) {
			
			int result2 = vService.updateCur(vlNum2);
			
			if(result2 > 0) {
				return "redirect:myVolunteer.vo";
			}else {
				throw new VolunteerException("현재인원 수정에 실패했습니다.");
			}
		}else {
			throw new VolunteerException("봉사활동 취소에 실패했습니다.");
		}
		
	}
	
	@RequestMapping("checkDe.vo")
	public void checkDemander(@RequestParam("vlNum2") int vlNum2, HttpSession session, HttpServletResponse response) throws IOException {
		
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		System.out.println("vlNum2 : " + vlNum2);
		Volunteer v = new Volunteer();
		v.setUserID(userId);
		v.setVlNum2(vlNum2);
		
		int result = vService.checkDemander(v);
		
		if(result > 0) {
			response.getWriter().print(true);
		}else {
			response.getWriter().print(false);
		}
	}
	
	@RequestMapping("checkDate.vo")
	public void checkDate(@RequestParam("vlNum2") int vlNum2, HttpServletResponse response) throws IOException{
		
		VolunteerSchedule vs = new VolunteerSchedule();
		vs.setVolAddNum(vlNum2);
		
		int result = vService.checkDate(vs);
		
		if(result > 0) {
			response.getWriter().print(true);
		}else {
			response.getWriter().print(false);
		}
	}
	
}
