package com.kh.ReaderForChildren.audition_yj.controller;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ReaderForChildren.audition_yj.model.exception.AuditionException;
import com.kh.ReaderForChildren.audition_yj.model.service.AuditionService;
import com.kh.ReaderForChildren.audition_yj.model.vo.Audition;
import com.kh.ReaderForChildren.audition_yj.model.vo.Career;
import com.kh.ReaderForChildren.audition_yj.model.vo.Reader;
import com.kh.ReaderForChildren.member_ej.model.vo.Member;

@Controller
public class AuditionController {

	@Autowired
	private AuditionService auService;
	
	// 오디션 공고 리스트 조회
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
	
	// 지원서 작성폼 화면이동
	@RequestMapping("applyInsert.au")
	public ModelAndView applyInsertView(@RequestParam("aNum") int aNum, @RequestParam("bkName") String bkName, ModelAndView mv) {
		
		mv.addObject("aNum", aNum).addObject("bkName", bkName);
		mv.setViewName("auditionApplyForm");
		return mv;
	}
	
	// 오디션 공고 작성화면이동
	@RequestMapping("auListInsertView.au")
	public String auditionListUpdateView() {
		return "auditionListInsert";
	}
	
	// 오디션 공고 등록
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
	
	// 오디션 공고 수정 화면 이동
	@RequestMapping("auListUpView.au")
	public ModelAndView auditionListUpView(@RequestParam("aNum") int aNum, ModelAndView mv) {
		
		Audition a = auService.selectAudition(aNum);
		
		mv.addObject("audition", a).setViewName("auditionListUpdate");
		
		return mv;
	}
	
	// 오디션 공고 수정
	@RequestMapping("auListUpdate.au")
	public String auditionListUpdate(@ModelAttribute Audition a, HttpServletRequest request,
									 @RequestParam("reloadBook") MultipartFile reloadBook, @RequestParam("reloadTest") MultipartFile reloadTest) {
		
		if(reloadBook != null && !reloadBook.isEmpty()) {
			if(a.getBiName() != null) {
				deleteFile(a.getBiName(),request);
			}
			
			ArrayList<String> renameBook = saveFile(reloadBook,request);
			
			if(renameBook != null) {
				a.setBiName(renameBook.get(0));
				a.setBiPath(renameBook.get(1));
			}
		}
		
		if(reloadTest != null && !reloadTest.isEmpty()) {
			if(a.getTeName() != null) {
				deleteFile(a.getTeName(),request);
			}
			
			ArrayList<String> renameTest = saveFile(reloadTest, request);
			
			if(renameTest != null) {
				a.setTeName(renameTest.get(0));
				a.setTePath(renameTest.get(1));
			}
		}
		
		int result = auService.updateAudition(a);
		if(result > 0) {
			return "redirect:aulist.au";
		} else {
			throw new AuditionException("게시글 수정 실패");
		}
	}
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) {
			f.delete();
		}
	}
	
	// 오디션 공고 삭제
	@RequestMapping("auListDelete.au")
	public String deleteAudition(@RequestParam("aNum") int aNum) {
		
		int result = auService.deleteAudition(aNum);
		
		if(result > 0) {
			return "redirect:aulist.au";
		} else {
			throw new AuditionException("게시글 삭제 실패");
		}
	}
	
	// 지원서 등록 
	@RequestMapping("insertApply.au")
	public String insertApply(@ModelAttribute Reader r, HttpServletRequest request, HttpSession session,
			@RequestParam("profileImg") MultipartFile profileImg, @RequestParam("recordFile") MultipartFile recordFile,
			@RequestParam("cDate") String[] cDateArr, @RequestParam("cContent") String[] cContentArr, @RequestParam("cCompany") String[] cComArr) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId= loginUser.getUserId();
		r.setUserId(userId);
		
		// 경력사항 데이터 담기
		ArrayList<Career> cArr = new ArrayList<Career>();
		for(int i = 0; i < cDateArr.length; i++) {
			Career c = new Career(0, userId, cDateArr[i], cContentArr[i], cComArr[i]);
			cArr.add(c);
		}
		
		// 지원서사진
		if(profileImg != null && !profileImg.isEmpty()) {
			ArrayList<String> renameProImg = saveFile(profileImg, request);
			if(renameProImg != null) {
				r.setImgOrigin(profileImg.getOriginalFilename());
				r.setImgChange(renameProImg.get(0));
				r.setImgPath(renameProImg.get(1));
			}
		}
		
		// 녹음파일
		if(recordFile != null && !recordFile.isEmpty()) {
			ArrayList<String> renameRecord = saveFile(recordFile, request);
			if(renameRecord != null) {
				r.setRecName(renameRecord.get(0));
				r.setRecPath(renameRecord.get(1));
			}
		}
		
		int result = auService.insertApply(r,cArr);
		
		if(result > 0) {
			return "applyResult";			
		} else {
			throw new AuditionException("리더 지원 실패!");
		}
				
	}
	
	/*@RequestMapping("apDetail.au")
	public ModelAndView applyDetailView(HttpSession session, ModelAndView mv) {
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		Reader r = auService.selectReader(userId);
		Career c = auService.selectAudition(userId);
		
		mv.addObject("r", r).addObject("c", c).setViewName("auditionApplyDetail");
	}*/
}
