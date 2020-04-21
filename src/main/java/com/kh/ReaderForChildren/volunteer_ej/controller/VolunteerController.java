package com.kh.ReaderForChildren.volunteer_ej.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ReaderForChildren.member_ej.model.exception.MemberException;
import com.kh.ReaderForChildren.member_ej.model.vo.Member;
import com.kh.ReaderForChildren.volunteer_ej.model.service.VolunteerService;
import com.kh.ReaderForChildren.volunteer_ej.model.vo.Volunteer;
import com.kh.ReaderForChildren.volunteer_ej.model.vo.VolunteerSchedule;

@Controller
public class VolunteerController {

	@Autowired
	private VolunteerService vService;

	@RequestMapping("volView.vo")
	public ModelAndView volunteerView(ModelAndView mv) {
		
		ArrayList<VolunteerSchedule> vs = vService.getSchedule();
		System.out.println("VS : " + vs);
		mv.addObject("vs", vs).setViewName("volSchedule");
		
		return mv;
	}

	@RequestMapping("addVolSchedule.vo")
	public String addVolSchedule(@ModelAttribute VolunteerSchedule vs, Model model) {

		int result = vService.addVolSchedule(vs);

		System.out.println("result:" + result);

		/* ArrayList<VolunteerSchedule> vsS = vService.getSchedule(); */

//		model.addAttribute("content", vs.getVolContent());
//		model.addAttribute("start", vs.getVolStart());
//		model.addAttribute("end", vs.getVolEnd());
		
		model.addAttribute("result", result);

		return "addScheduleForm";

	}

	@RequestMapping("submitInform.vo")
	public ModelAndView serviceAsk(ModelAndView mv, @ModelAttribute Volunteer v, HttpSession session, HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		v.setUserID(userId);
		System.out.println("asdf:" + v.getVlNum2());
		int result = vService.checkMax(v);
		
		if(result > 0) {
			int result2 = vService.serviceAsk(v);
			
			if(result2>0) {
				mv.addObject("msg", "신청완료")
				.setViewName("volSchedule");
			
			}else {
				throw new MemberException("봉사활동 신청에 실패했습니다.");
			}
		}else {
			PrintWriter out;
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
		
		
		
		return mv;
	}
	
	
	
}
