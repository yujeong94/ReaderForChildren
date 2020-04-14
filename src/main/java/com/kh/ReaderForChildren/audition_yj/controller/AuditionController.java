package com.kh.ReaderForChildren.audition_yj.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
			mv.addObject("aulist", aulist);
			mv.setViewName("auditionListView");
		} else {
			throw new AuditionException("게시글 리스트 조회에 실패했습니다.");
		}
		return mv;
	}
	
	@RequestMapping("applyInsert.au")
	public ModelAndView applyInsertView(@RequestParam("bkName") String bkName, ModelAndView mv) {
		mv.addObject("bkName", bkName);
		mv.setViewName("auditionApplyForm");
		return mv;
	}
	
	@RequestMapping("auListInsertView.au")
	public String auditionListUpdateView() {
		return "auditionListInsert";
	}
	
	@RequestMapping("auListInsert.au")
	public String auditionListInsert(@ModelAttribute Audition a, HttpServletRequest request, 
									 @RequestParam("testFile") MultipartFile testFile, @RequestParam("bookFile") MultipartFile bookFile) {
		
		//텍스트 구절 파일 설정
		if(testFile != null && !testFile.isEmpty()) {
			ArrayList<String> renameTest = saveFile(testFile,request);
			if(renameTest != null) {
				a.setTeName(renameTest.get(0));
				a.setTePath(renameTest.get(1));
			}
		}
		
		//도서사진 파일 설정
		if(bookFile != null && !bookFile.isEmpty()) {
			ArrayList<String> renameBook = saveFile(bookFile,request);
			if(renameBook != null) {
				a.setBiName(renameBook.get(0));
				a.setBiPath(renameBook.get(1));
			}
		}
		
		int result = auService.insertAudition(a);
		if(result > 0) {
			return "redirect:aulist.au";
		} else {
			throw new AuditionException("게시글 등록 실패");
		}
	}
	
	public ArrayList<String> saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\uploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFile = file.getOriginalFilename();
		String renameFile  = sdf.format(new Date(System.currentTimeMillis())) + "." + originFile.substring(originFile.lastIndexOf(".") + 1);
		
		String renamePath = folder + "\\" +renameFile;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
			e.printStackTrace();
		}
		
		ArrayList<String> fileArr = new ArrayList<String>();
		fileArr.add(renameFile);
		fileArr.add(renamePath);
		
		return fileArr;
	}
	
	@RequestMapping("auListUpView.au")
	public ModelAndView auditionListUpdate(@RequestParam("aNum") int aNum, ModelAndView mv) {
		
		Audition a = auService.selectAudition(aNum);
		
		mv.addObject("audition", a).setViewName("auditionListUpdate");
		
		return mv;
	}
}
