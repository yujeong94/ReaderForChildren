package com.kh.ReaderForChildren.audioBook_sh.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.GregorianCalendar;

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
import com.kh.ReaderForChildren.audioBook_sh.model.vo.AudioFile;
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
	public String audioBookInsert(@ModelAttribute Book b, String rdNameF, String rdIdF, String audDateF, String rdIntroF,
									String rdNameM, String rdIdM, String audDateM, String rdIntroM, int audPrice, HttpServletRequest request,
									@RequestParam("fileF") MultipartFile fileF, @RequestParam("fileM") MultipartFile fileM,
									@RequestParam("thumbnailImg") MultipartFile bookImg) {
		
		// 도서 이미지파일 저장
		BookImage bi = new BookImage();
		if(bookImg != null && !bookImg.isEmpty()) {
			String[] arr = saveImage(bookImg, request);
			String changeName = arr[0];
			String biPath = arr[1];
			
			if(changeName != null) {
				bi.setOriginName(bookImg.getOriginalFilename());
				bi.setChangeName(changeName);
				bi.setBiPath(biPath);
			}	
		}
		
		// 여자 오디오북 발행일 String->Date
		Date audioDateF = null;
		if(audDateF != "") {
			String[] dateArr = audDateF.split("-");
			
			int year = Integer.parseInt(dateArr[0]);
			int month = Integer.parseInt(dateArr[1])-1;
			int day = Integer.parseInt(dateArr[2]);
			
			audioDateF = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
		} else {
			audioDateF = new Date(new GregorianCalendar().getTimeInMillis());
		}
		
		// 여자 리더(오디오북)
		AudioBook abF = new AudioBook();
		abF.setAudDate(audioDateF);
		abF.setAudPrice(audPrice);
		abF.setRdIntro(rdIntroF);
		abF.setRdName(rdNameF);
		
		
		// 남자 오디오북 발행일 String->Date
		Date audioDateM = null;
		if(audDateM != "") {
			String[] dateArr = audDateM.split("-");
			
			int year = Integer.parseInt(dateArr[0]);
			int month = Integer.parseInt(dateArr[1])-1;
			int day = Integer.parseInt(dateArr[2]);
			
			audioDateM = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
		} else {
			audioDateM = new Date(new GregorianCalendar().getTimeInMillis());
		}
		
		// 남자 리더(오디오북)
		AudioBook abM = new AudioBook();
		abM.setAudDate(audioDateM);
		abM.setAudPrice(audPrice);
		abM.setRdIntro(rdIntroM);
		abM.setRdName(rdNameM);
		
		
		// 여자 오디오파일 저장
		AudioFile afF = new AudioFile();
		if(fileF != null && !fileF.isEmpty()) {
			String[] arr = saveFile(fileF, request);
			String changeName = arr[0];
			String filePath = arr[1];
			
			if(changeName != null) {
				afF.setOriginName(fileF.getOriginalFilename());
				afF.setChangeName(changeName);
				afF.setFilePath(filePath);
				afF.setUserId(rdIdF);
			}
		}
		
		// 남자 오디오파일 저장
		AudioFile afM = new AudioFile();
		if(fileM != null && !fileM.isEmpty()) {
			String[] arr = saveFile(fileM, request);
			String changeName = arr[0];
			String filePath = arr[1];
			
			if(changeName != null) {
				afM.setOriginName(fileM.getOriginalFilename());
				afM.setChangeName(changeName);
				afM.setFilePath(filePath);
				afF.setUserId(rdIdM);
			}
		}
		
		int result = abService.insertAudioBook(b, bi, abF, abM, afF, afM);
		
		if(result >= 6) {
			
		}
		
		return null;
	}
	
	public String[] saveImage(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String biPath = root + "\\bookUploadImages";
		
		File folder = new File(biPath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		String originName = file.getOriginalFilename();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String changeName
			= originName + sdf.format(new Date(System.currentTimeMillis()))
			+ "." + originName.substring(originName.lastIndexOf(".") + 1);
		
		String changePath = folder + "\\" + changeName;
		
		try {
			file.transferTo(new File(changePath));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String[] arr = {changeName, biPath};
		
		return arr;
	}
	
	public String[] saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String filePath = root + "\\audioFileUpload";
		
		File folder = new File(filePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		String originName = file.getOriginalFilename();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String changeName
			= originName + sdf.format(new Date(System.currentTimeMillis()))
			+ "." + originName.substring(originName.lastIndexOf(".") + 1);
		
		String changePath = folder + "\\" + changeName;
		
		try {
			file.transferTo(new File(changePath));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String[] arr = {changeName, filePath};
		
		return arr;
	}
	
	
}
