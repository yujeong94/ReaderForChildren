package com.kh.ReaderForChildren.event_ssj.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.ReaderForChildren.audition_yj.model.vo.Reader;
import com.kh.ReaderForChildren.event_ssj.model.exception.EventException;
import com.kh.ReaderForChildren.event_ssj.model.service.EventService;
import com.kh.ReaderForChildren.event_ssj.model.vo.Event;
import com.kh.ReaderForChildren.event_ssj.model.vo.Reply;
import com.kh.ReaderForChildren.event_ssj.model.vo.Winner;
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
		
		mv.addObject("event", event).setViewName("endEventList");
		
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
	public ModelAndView eventDetailView(@RequestParam("eNum") int eNum, ModelAndView mv, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		Reader reader = null;
		
		if(loginUser != null) {
			String userId = loginUser.getUserId();
			
			reader = evService.selectReader(userId);
			
			mv.addObject("reader", reader);
		}
		
		Event event = evService.selectEvent(eNum);
		
		if(event != null) {
			mv.addObject("event", event).setViewName("eventDetail");
		} else {
			throw new EventException("이벤트 상세 페이지 조회 실패");
		}
		
		return mv;
	}
	
	// 이벤트 종료 상세페이지
	@RequestMapping("eventEndDetail.ev")
	public ModelAndView eventEndDetailView(@RequestParam("eNum") int eNum, ModelAndView mv) {
		
		ArrayList<Winner> winner = evService.selectEventWinner(eNum);
		
		ArrayList<Member> member = evService.selectEventWinnerMember(winner);
		
		Event event = evService.selectEvent(eNum);
		
		if(winner != null) {
			mv.addObject("winner", winner).addObject("member", member).addObject("event", event).setViewName("endEventDetail");
		} else {
			throw new EventException("당첨자 이벤트 상세 페이지 조회 실패");
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
	
	//댓글 리스트
	@RequestMapping("replyList.ev")
	public void replyList(HttpServletResponse response, @RequestParam("eNum") int eNum) throws JsonIOException, IOException {
		
		ArrayList<Reply> rList = evService.selectReplyList(eNum);
		
		for(Reply r:rList) {
			r.setrContent(URLEncoder.encode(r.getrContent(), "UTF-8"));
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(rList, response.getWriter());
		
	}
	
	// 댓글 삭제
	@RequestMapping("deleteReply.ev")
	public String deleteReply(Reply r) {
		
		int result = evService.deleteReply(r);
		
		if(result > 0) {
			return "success";
		} else {
			throw new EventException("댓글 삭제를 실패하셨습니다.");
		}
	}
	
	// 댓글 여부
	@RequestMapping("replyCheck.ev")
	public void replyCheck(Reply r, HttpServletResponse response) throws IOException {
		
		int result = evService.replyCheck(r);
		System.out.println("result:" + result);
		response.getWriter().print(result);
		
	}
	
	// 이벤트게시글 수정 페이지로 이동
	@RequestMapping("updateEventView.ev")
	public ModelAndView updateEventView(@RequestParam("eNum") int eNum, ModelAndView mv) {
		
		Event event = evService.updateEventView(eNum);
		
		if(event != null) {
			mv.addObject("event", event).setViewName("updateEvent");
		} else {
			throw new EventException("이벤트 수정 페이지 이동 실패");
		}
		
		return mv;
	}
	
	// 이벤트 수정
	@RequestMapping("updateEvent.ev")
	public ModelAndView updateEvent(@ModelAttribute Event e, @RequestParam("uploadBtn1") MultipartFile uploadFile, 
									HttpServletRequest request, ModelAndView mv) {
		
		if(uploadFile != null & !uploadFile.isEmpty()) {
			if(e.getChangeName() != null) {
				deleteFile(e.getChangeName(), request);
			}
			
			Event ev = saveFile(uploadFile, request);
			
			if(ev != null) {
				e.setOriginName(uploadFile.getOriginalFilename());
				e.setChangeName(ev.getChangeName());
				e.setImPath(ev.getImPath());
			}
		} else {
			e.setChangeName(e.getChangeName());
			e.setOriginName(e.getOriginName());
			e.setImPath(e.getImPath());
		}
		
		int result = evService.updateEvent(e);
		
		if(result > 0) {
			mv.setViewName("redirect:eventDetail.ev?eNum=" + e.geteNum());
		} else {
			throw new EventException("게시글 등록을 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 파일 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) {
			f.delete();
		}
	}
	
	// 이벤트 랜덤 창
	@RequestMapping("eventRandom.ev")
	public ModelAndView eventRandom(ModelAndView mv, @RequestParam("eNum") int eNum) {
		
		Event event = evService.selectEvent(eNum);
		Integer reply = evService.countReply(eNum);
		
		if(event != null) {
			mv.addObject("event", event).addObject("reply", reply).setViewName("eventRandom");
		} else {
			throw new EventException("랜덤 실패");
		}
		
		return mv;
	}
	
	// 이벤트 램덤 
	@RequestMapping("eventWinnerRandom.ev")
	public void eventWinnerRandom(HttpServletResponse response, @RequestParam("eNum") int eNum) throws JsonIOException, IOException {
		System.out.println("controller eNum : "+eNum);
		
		
		ArrayList<Winner> winner = evService.selectEventWinner(eNum);
		
		ArrayList<Member> member = evService.selectEventWinnerMember(winner);
		
		for(Member m : member) {
			m.setUserName(URLEncoder.encode(m.getUserName(), "UTF-8"));
			m.setPhone(URLEncoder.encode(m.getPhone(), "UTF-8"));
		}
		
		Gson gson = new GsonBuilder().create();
		gson.toJson(member, response.getWriter());
		
	}
	
	// 이벤트 데이터 넣기
	@RequestMapping("eventRandomInsert.ev")
	public void eventRandom(HttpServletResponse response, HttpServletRequest request, 
							@RequestParam("eNum") int eNum, @RequestParam("eEventNum") int eEventNum) throws JsonIOException, IOException {
		
		ArrayList<Reply> rList = evService.selectReplyList(eNum);
		Collections.shuffle(rList);
		
		for(int i = rList.size()-1; i > eEventNum -1; i--) {
			rList.remove(i);
		}
		
		int result = evService.insertEventRandom(rList, eNum);
		
		Gson gson = new GsonBuilder().create();
		gson.toJson(result, response.getWriter());
	
	}
	
	
	
}
