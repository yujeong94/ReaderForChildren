package com.kh.ReaderForChildren.volunteer_ej.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.ReaderForChildren.volunteer_ej.model.service.VolunteerService;
import com.kh.ReaderForChildren.volunteer_ej.model.vo.VolunteerSchedule;

@Controller
public class VolunteerController {

	@Autowired
	private VolunteerService vService;

	@RequestMapping("volView.vo")
	public String volunteerView() {
		return "volSchedule";
	}

	@RequestMapping("addVolSchedule.vo")
	public String addVolSchedule(@ModelAttribute VolunteerSchedule vs, Model model) {

		int result = vService.addVolSchedule(vs);

		System.out.println("result:" + result);

		/* ArrayList<VolunteerSchedule> vsS = vService.getSchedule(); */

		model.addAttribute("content", vs.getVolContent());
		model.addAttribute("start", vs.getVolStart());
		model.addAttribute("end", vs.getVolEnd());

		return "volSchedule";

	}

	@RequestMapping("get.vo")
	public void getSchedule(HttpServletResponse response) {

		ArrayList<VolunteerSchedule> vs = vService.getSchedule();

		System.out.println("vs : " + vs);

//		JSONArray jArr = new JSONArray();
//		for (VolunteerSchedule schedule : vs) {
//			JSONObject jSchedule = new JSONObject();
//			jSchedule.put("content", schedule.getVolContent());
//			jSchedule.put("start", schedule.getVolStart());
//			jSchedule.put("end", schedule.getVolEnd());
//
//			jArr.add(jSchedule);
//		}

//		JSONObject sendJson = new JSONObject();
//		sendJson.put("sendJson", sendJson);
//		sendJson.put("jArr", jArr);

//		response.setContentType("application/json; charset=UTF-8");
//		PrintWriter out;
//		try {
//			out = response.getWriter();
//			out.println(jArr);
//			out.flush();
//			out.close();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		
		try {
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(vs, response.getWriter());
		} catch (JsonIOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
