package com.kh.ReaderForChildren.audioBook_sh.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ReaderForChildren.audioBook_sh.model.exception.audioBookException;
import com.kh.ReaderForChildren.audioBook_sh.model.service.audioBookService;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.AudioBook;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.AudioFile;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.Book;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.BookImage;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.Cart;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.OrderDetail;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.PageInfo;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.Pagination;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.SearchCondition;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.Shipping;
import com.kh.ReaderForChildren.member_ej.model.vo.Member;

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
	
	
	// 오디오북 검색결과 리스트
	@RequestMapping("search.ab")
	public ModelAndView searchAudioBookList(@RequestParam("searchCondition") String condition,
										@RequestParam("searchValue") String value,
										@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		SearchCondition sc = new SearchCondition();
		if(condition.equals("title")) {
			sc.setTitle(value);
		} else if(condition.equals("writer")) {
			sc.setWriter(value);
		} else if(condition.equals("publisher")) {
			sc.setPublisher(value);
		}
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = abService.getSearchListCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Book> blist = abService.selectSearchbList(pi, sc);
		ArrayList<BookImage> bilist = abService.selectbiList();
		
		if(bilist != null) {
			mv.addObject("blist", blist);
			mv.addObject("pi", pi);
			mv.addObject("bilist", bilist);
			mv.addObject("searchCondition", condition);
			mv.addObject("searchValue", value);
			mv.setViewName("audioBookList");
		} else {
			throw new audioBookException("검색 결과 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	
	// 오디오북 상세조회
	@RequestMapping("abdetail.ab")
	public ModelAndView audioBookDetail(@RequestParam("bkCode") int bkCode, ModelAndView mv) {
		
		Book b = abService.selectBook(bkCode);
		ArrayList<AudioBook> ab = abService.selectAudioBook(bkCode);
		BookImage i = abService.selectBookImage(bkCode);
		ArrayList<AudioFile> af = abService.selectAudioFile(bkCode);
		
		AudioBook abF = ab.get(0);
		AudioBook abM = ab.get(1);
		
		AudioFile afF = af.get(0);
		AudioFile afM = af.get(1);
		
		if(b != null) {
			mv.addObject("b", b);
			mv.addObject("i", i);
			mv.addObject("abF", abF);
			mv.addObject("abM", abM);
			mv.addObject("afF", afF);
			mv.addObject("afM", afM);
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
				afM.setUserId(rdIdM);
			}
		}
		
		int result = abService.insertAudioBook(b, bi, abF, abM, afF, afM);
		
		if(result >= 6) {
			return "redirect:ablist.ab";
		} else {
			throw new audioBookException("상품 등록에 실패하였습니다.");
		}
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
	
	
	// 구매 페이지
	@RequestMapping("purchase.ab")
	public ModelAndView audioBookPurchase(String bkName, int bkCode, int sum, String hidden1, String hidden2, String hidden3,
										HttpSession session, ModelAndView mv) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		String phone = loginUser.getPhone();
		String num1 = phone.substring(0, 3);
		String num2 = phone.substring(3, 7);
		String num3 = phone.substring(7, 11);
		String newPhone = num1+"-"+num2+"-"+num3;
		
		int sNo = abService.selectDefaultSA(userId);
		
		mv.addObject("lu", loginUser);
		mv.addObject("newPhone", newPhone);
		mv.addObject("bkName", bkName);
		mv.addObject("bkCode", bkCode);
		mv.addObject("sum", sum);
		mv.addObject("hidden1", hidden1);
		mv.addObject("hidden2", hidden2);
		mv.addObject("hidden3", hidden3);
		mv.addObject("sNo", sNo);
		mv.setViewName("audioBookPurchase");
		
		return mv;
	}
	
	
	// 개인정보 제공 동의 페이지 이동
	@RequestMapping("agreeInform.ab")
	public String agreeForInformProvision() {
		return "agreeForInformProvision";
	}
	
	
	// 배송지 목록
	@RequestMapping("shipAddList.ab")
	public ModelAndView shippingAddressList(ModelAndView mv, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		ArrayList<Shipping> list = abService.shipAddList(userId);
		
		String newPhone = "";
		if(list != null) {
			for(int i = 0; i < list.size(); i++) {
				String phone = list.get(i).getrPhone();
				String num1 = phone.substring(0, 3);
				String num2 = phone.substring(3, 7);
				String num3 = phone.substring(7, 11);
				newPhone = num1+"-"+num2+"-"+num3;
				list.get(i).setrPhone(newPhone);
			}
			mv.addObject("list", list);
			mv.setViewName("shippingAddressList");
		} else {
			throw new audioBookException("배송지 목록 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 배송지 추가 페이지로 이동
	@RequestMapping("addShipAddView.ab")
	public String addShipAddView() {
		return "addShippingAddress";
	}
	
	// 배송지 추가
	@RequestMapping("addShipAdd.ab")
	public String addShippingAddress(@ModelAttribute Shipping s, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		s.setUserId(userId);
		
		int result = abService.addShipAddress(s);
		
		if(result > 0) {
			return "redirect:shipAddList.ab";
		} else {
			throw new audioBookException("배송지 추가에 실패하였습니다.");
		}
	}
	
	
	// 결제 후 주문정보 insert
	@RequestMapping("orderInsert.ab")
	public String orderInsert(String hidden3, int bkCode, int sum, String delRequest, String selboxDirect, int sNo,
							String containBk, HttpSession session) {
		
		if(delRequest.equals("direct")) {
			delRequest = selboxDirect;
		}
		
		int audCodeF = 0;
		int audCodeM = 0;
		if(hidden3.contains(",")) {
			String[] hiddenArr = hidden3.split(",");
			audCodeF = Integer.parseInt(hiddenArr[0]);
			audCodeM = Integer.parseInt(hiddenArr[1]);
		} else if((Integer.parseInt(hidden3)) % 2 == 1){
			audCodeF = Integer.parseInt(hidden3);
		} else {
			audCodeM = Integer.parseInt(hidden3);
		}
		
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		OrderDetail order = new OrderDetail();
		order.setBkCode(bkCode);
		order.setAudCodeF(audCodeF);
		order.setAudCodeM(audCodeM);
		order.setOrPrice(sum);
		order.setDelRequest(delRequest);
		order.setContainBk(containBk);
		order.setsNo(sNo);
		order.setUserId(userId);
		
		int result = abService.orderInsert(order);
		
		if(result > 0) {
			return "successPayment";
		} else {
			throw new audioBookException("상품 주문에 실패하였습니다.");
		}
		
	}
	
	
	// 장바구니 insert
	@RequestMapping("cartInsert.ab")
	@ResponseBody
	public String cartInsert(HttpSession session, int bkCode, String hidden3, String hidden1) {
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		String containBk = "";
		if(hidden1.equals("[도서+오디오북]")) {
			containBk = "Y";
		} else {
			containBk = "N";
		}
		
		int audCodeF = 0;
		int audCodeM = 0;
		if(hidden3.contains(",")) {
			String[] hiddenArr = hidden3.split(",");
			audCodeF = Integer.parseInt(hiddenArr[0]);
			audCodeM = Integer.parseInt(hiddenArr[1]);
		} else if((Integer.parseInt(hidden3)) % 2 == 1){
			audCodeF = Integer.parseInt(hidden3);
		} else {
			audCodeM = Integer.parseInt(hidden3);
		}
		
		Cart c = new Cart(0, userId, bkCode, audCodeF, audCodeM, containBk, null);
		int result = abService.cartInsert(c);
		
		if(result > 0) {
			return "success";
		} else {
			throw new audioBookException("상품을 장바구니에 담는 것에 실패하였습니다.");
		}
	}
	
	
	// 상품 삭제
	@RequestMapping("deleteProduct.ab")
	public void deleteProduct(int bkCode, HttpServletResponse response) {
		
		int result = abService.deleteProduct(bkCode);
		
		response.setContentType("text/html; charset=utf-8");
		
		if(result >= 4) {
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script type='text/javascript'>");
				out.println("alert('상품이 삭제되었습니다.'); location.href='ablist.ab';");
				out.println("</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		} else {
			throw new audioBookException("상품 삭제에 실패하였습니다.");
		}
	}
	
	
	// 상품 수정페이지로 이동
	@RequestMapping("updateProductView.ab")
	public String updateProductView() {
		return null;
	}
	
}
