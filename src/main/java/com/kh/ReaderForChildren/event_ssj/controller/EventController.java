package com.kh.ReaderForChildren.event_ssj.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ReaderForChildren.event_ssj.model.exception.EventException;
import com.kh.ReaderForChildren.event_ssj.model.service.EventService;
import com.kh.ReaderForChildren.event_ssj.model.vo.Event;
import com.kh.ReaderForChildren.event_ssj.model.vo.Reply;
import com.kh.ReaderForChildren.member_ej.model.vo.Member;

@Controller
public class EventController {
	
	@Autowired
	private EventService evService; 
	
//	관리자 페이지 메뉴바 이동!
	@RequestMapping("eventInsert.ev")
	public String eventInsertView() {
		return "eventInsert";
	}
	
	// list로 이동!
	@RequestMapping("eventList.ev")
	public ModelAndView eventListView(ModelAndView mv) {
		
		ArrayList<Event> event = evService.selectList();
		
		if(event != null) {
			mv.addObject("event", event).setViewName("eventList");
		} else {
			throw new EventException("이벤트 게시판 조회 실패");
		}
		
		return mv;
	}
	
	// endList로 이동!
	@RequestMapping("eventEndList.ev")
	public ModelAndView eventEndListView(ModelAndView mv) {
		
		ArrayList<Event> event = evService.selectEndList();
		
		if(event != null) {
			mv.addObject("event", event).setViewName("endEventList");
		} else {
			throw new EventException("당첨 게시판 조회 실패");
		}
		
		return mv;
	}
	
	@RequestMapping("eventDataInsert.ev")
	public String eventInsert(@ModelAttribute Event e, @RequestParam("uploadBtn1") MultipartFile uploadFile, HttpServletRequest request) {
		
		// 파일명 변경
		if(uploadFile != null && !uploadFile.isEmpty()) {
			Event ev = saveFile(uploadFile, request);
			
			if(ev != null) {
				e.setOriginName(uploadFile.getOriginalFilename());
				e.setChangeName(ev.getChangeName());
				e.setImPath(ev.getImPath());
			}
		}
		
		int result = evService.insertEvent(e);
		
		if(result > 0) {
			return "redirect:eventList.ev";
		} else {
			throw new EventException("이벤트 등록 실패");
		}
	}
	
	// 파일명 변경
	public Event saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\uploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originName = file.getOriginalFilename();
		String changeName = sdf.format(new Date(System.currentTimeMillis()))
							+ "." + originName.substring(originName.lastIndexOf(".") + 1);
		String renamePath = folder + "\\" + changeName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
			e.printStackTrace();
		}
		
		Event ev = new Event();
		ev.setChangeName(changeName);
		ev.setImPath(savePath);
		
		return ev;
	}
	
	@RequestMapping("eventDetail.ev")
	public ModelAndView eventDetailView(@RequestParam("eNum") int eNum, ModelAndView mv) {
		
		Event event = evService.selectEvent(eNum);
		
		if(event != null) {
			mv.addObject("event", event).setViewName("eventDetail");
		} else {
			throw new EventException("이벤트 상세 페이지 조회 실패");
		}
		
		return mv;
	}
	
	// 댓글 등록
	@RequestMapping("addReply.ev")
	@ResponseBody
	public String addReplyList(Reply r, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		r.setUserId(userId);
		
		int result = evService.insertReply(r);
		
		if(result > 0) {
			return "success";
		} else {
			throw new EventException("댓글 등록에 실패하였습니다.");
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
