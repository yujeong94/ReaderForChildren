package com.kh.ReaderForChildren.audition_yj.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ReaderForChildren.audition_yj.model.exception.AuditionException;
import com.kh.ReaderForChildren.audition_yj.model.service.AuditionService;
import com.kh.ReaderForChildren.audition_yj.model.vo.Audition;

@Controller
public class AuditionController {

	@Autowired
	private AuditionService auService;
	
	@RequestMapping("aulist.au")
	public ModelAndView auditionList(ModelAndView mv) {
		
		ArrayList<Audition> aulist = auService.selectList();
		
		if(aulist != null) {
			mv.addObject("aulist",aulist);
			mv.setViewName("auditionListView");
		} else {
			throw new AuditionException("게시글 리스트 조회에 실패했습니다.");
		}
		return mv;
	}
	
	@RequestMapping("apinsertView.au")
	public String applyInsertView() {
		return "auditionApplyForm";
	}
}
