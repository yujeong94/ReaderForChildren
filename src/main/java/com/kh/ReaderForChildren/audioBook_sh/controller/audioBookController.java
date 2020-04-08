package com.kh.ReaderForChildren.audioBook_sh.controller;

import java.io.File;
import java.io.IOException;
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

import com.kh.ReaderForChildren.audioBook_sh.model.exception.audioBookException;
import com.kh.ReaderForChildren.audioBook_sh.model.service.audioBookService;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.AudioBook;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.Book;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.BookImage;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.PageInfo;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.Pagination;

@Controller
public class audioBookController {

	@Autowired
	private audioBookService abService;
	
	// 오디오북 리스트 조회
	@RequestMapping("ablist.ab")
	public ModelAndView audioBookList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		// Book 전체 개수
		int listCount = abService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Book> blist = abService.selectbList(pi);
		ArrayList<BookImage> bilist = abService.selectbiList();
		
		if(blist != null) {
			mv.addObject("blist", blist);
			mv.addObject("pi", pi);
			mv.addObject("bilist", bilist);
			mv.setViewName("audioBookList");
		} else {
			throw new audioBookException("게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	
	// 오디오북 상세조회
	@RequestMapping("abdetail.ab")
	public ModelAndView audioBookDetail(@RequestParam("bkCode") int bkCode, ModelAndView mv) {
		
		Book b = abService.selectBook(bkCode);
		AudioBook a = abService.selectAudioBook(bkCode);
		BookImage i = abService.selectBookImage(bkCode);
		
		if(b != null) {
			mv.addObject("b", b)
				.addObject("a", a)
				.addObject("i", i);
			mv.setViewName("audioBookDetail");
		} else {
			throw new audioBookException("게시글 상세 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 오디오북 상품 등록 페이지로 이동
	@RequestMapping("abinsertView.ab")
	public String audioBookInsertView() {
		return "uploadProduct";
	}
	
	// 오디오북 상품 업로드
	@RequestMapping("abinsert.ab")
	public String audioBookInsert(@ModelAttribute Book b, String rdNameF, String audDateF, String rdIntroF,
									String rdNameM, String audDateM, String rdIntroM, HttpServletRequest request,
									@RequestParam("fileF") MultipartFile fileF, @RequestParam("fileM") MultipartFile fileM,
									@RequestParam("thumbnailImg") MultipartFile bookImg) {
		
		/*System.out.println(b);
		System.out.println(rdNameF);
		System.out.println(audDateF);
		System.out.println(fileF.getOriginalFilename());
		System.out.println(fileM.getOriginalFilename());
		System.out.println(bookImg.getOriginalFilename());*/
		
		if(bookImg != null && bookImg.isEmpty()) {
			String renameFileName = saveFile(bookImg, request);
			
		}
		
		
		return null;
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\bookUploadImages";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		String originalFileName = file.getOriginalFilename();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String renameFileName
			= sdf.format(new Date(System.currentTimeMillis()))
			+ "." + originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return renameFileName;
	}
	
	
	
}
