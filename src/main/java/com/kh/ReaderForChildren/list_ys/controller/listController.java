package com.kh.ReaderForChildren.list_ys.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ReaderForChildren.audioBook_sh.model.vo.OrderDetail;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.Shipping;
import com.kh.ReaderForChildren.list_ys.model.exception.listException;
import com.kh.ReaderForChildren.list_ys.model.service.listService;
import com.kh.ReaderForChildren.list_ys.model.vo.Rec;
import com.kh.ReaderForChildren.member_ej.model.vo.Member;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.PageInfo;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.Pagination;

@SessionAttributes("loginUser")
@Controller
public class listController {

	@Autowired
	private listService liService;
	
	@RequestMapping("relist.li")
	public ModelAndView boardList(@RequestParam(value="page",required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = liService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Rec> list = liService.selectList(pi);
		
		if(list != null) {
			mv.addObject("list",list);
			mv.addObject("pi", pi);
			mv.setViewName("booklist");
			
		}else {
			throw new listException("게시글 전체 조회에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("shlist.li")
	public ModelAndView shippingList(@RequestParam(value="page",required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = liService.getshListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Shipping> list = liService.selectshList(pi);
		
		if(list != null) {
			mv.addObject("list",list);
			mv.addObject("pi", pi);
			mv.setViewName("shippinglist");
			
		}else {
			throw new listException("게시글 전체 조회에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("orlist.li")
	public ModelAndView orderList(@RequestParam(value="page",required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = liService.getorListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<OrderDetail> olist = liService.selectorList(pi);
		
		if(olist != null) {
			mv.addObject("olist",olist);
			mv.addObject("pi", pi);
			mv.setViewName("basketlist");
			
		}else {
			throw new listException("게시글 전체 조회에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("shinsertView.li")
	public String shippingInsertView() {
		return "shippingInsert";
	}
	
	@RequestMapping("shinsert.li")												
	public String ShippingInsert(@ModelAttribute Shipping s, HttpSession session ) {
		
		Member member = (Member)session.getAttribute("loginUser");
		String userId = member.getUserId();
		
		s.setUserId(userId);
		
		int result = liService.insertBoard(s);
		
		if(result > 0) {
			return "redirect:shlist.li";
		}else {
			throw new listException("게시글 등록에 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("shdelete.li")
	public String boardDelete(@RequestParam("sNo") int sNo) {
		
		int result = liService.deleteShipping(sNo);
		
		if(result > 0) {
			return "redirect:shlist.li";
		}else {
			throw new listException("게시글 삭제 실패하였습니다.");
		}
	}
	
	@RequestMapping("shupView.li")
	public ModelAndView ShippingUpdateView(@RequestParam("sNo")int sNo, @RequestParam("page") int page, ModelAndView mv) {
		
		Shipping shipping = liService.selectShipping(sNo);
		
		mv.addObject("shipping", shipping)
		  .addObject("page", page)
		  .setViewName("shippingUpdate");

		return mv;
	}
	
	@RequestMapping("shupdate.li")
	public ModelAndView ShippingUpdate(@ModelAttribute Shipping s, 
								@RequestParam("page") int page, HttpServletRequest request, ModelAndView mv) {
		
		
		
		int result = liService.updateShipping(s);
		
		if(result > 0 ) {
			mv.addObject("page", page)
			  .setViewName("redirect:shdetail.li?sNo=" + s.getsNo());
			
		}else {
			throw new listException("게시글 등록을 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("shdetail.li")
	public ModelAndView shippingDetail(@RequestParam("sNo")int sNo, @RequestParam("page")int page, ModelAndView mv) {
		Shipping shipping = liService.selectShipping(sNo);
		
		if(shipping != null) {
			mv.addObject("shipping", shipping)
			  .addObject("page", page)
			  .setViewName("shippingdetailview");
			
		}else {
			throw new listException("조회에 실패했습니다.");
		}
		return mv;
	}
	
	
	
	
}
