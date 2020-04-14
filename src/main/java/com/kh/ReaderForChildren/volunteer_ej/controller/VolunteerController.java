package com.kh.ReaderForChildren.volunteer_ej.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class VolunteerController {
	
	
	@RequestMapping("volView.vo")
	public String volunteerView() {
		return "volSchedule";
	}
	
}
