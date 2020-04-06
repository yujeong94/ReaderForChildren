package com.kh.ReaderForChildren.audioBook_sh.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ReaderForChildren.audioBook_sh.model.exception.audioBookException;
import com.kh.ReaderForChildren.audioBook_sh.model.service.audioBookService;
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
	
}
