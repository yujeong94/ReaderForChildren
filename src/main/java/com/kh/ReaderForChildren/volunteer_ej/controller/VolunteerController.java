package com.kh.ReaderForChildren.volunteer_ej.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView serviceAsk(ModelAndView mv, @ModelAttribute Volunteer v) {
		
		/* int result = vService.serviceAsk(v); */
		System.out.println("v :" + v.getUserID());
		System.out.println("v :" + v.getVlNum2());
		System.out.println("v :" + v.getVlPhone());
		System.out.println("v :" + v.getUserName());
		return null;
	}
	
	
	
}
