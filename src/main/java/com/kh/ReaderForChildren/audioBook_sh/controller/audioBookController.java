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
	public ModelAndView audioBookDetail(@RequestParam("bkCode") int bkCode, int page, ModelAndView mv) {
		
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
			mv.addObject("page", page);
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
		int random = (int)(Math.random() * 100) + 1;
		String changeName
			= originName.substring(0, 1) + random + sdf.format(new Date(System.currentTimeMillis()))
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
		int random = (int)(Math.random() * 100) + 1;
		String changeName
			= originName.substring(0, 1) + random + sdf.format(new Date(System.currentTimeMillis()))
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
	public ModelAndView audioBookPurchase(String bkName, int bkCode, @RequestParam("sum") String total, String hidden1, String hidden2, String hidden3,
										HttpSession session, ModelAndView mv) {
		
		int sum = 0;
		if(total.contains(",")) {
			String[] arr = total.split(",");
			String str = "";
			for(int i=0; i<arr.length; i++) {
				str += arr[i];
			}
			sum = Integer.parseInt(str);
		}
		
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
	public String cartInsert(HttpSession session, int bkCode, String hidden3, String hidden1, @RequestParam("sum") String total) {
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
		
		int sum = 0;
		if(total.contains(",")) {
			String[] arr = total.split(",");
			String str = "";
			for(int i=0; i<arr.length; i++) {
				str += arr[i];
			}
			sum = Integer.parseInt(str);
		}
		
		Cart c = new Cart(0, userId, bkCode, audCodeF, audCodeM, containBk, null, sum);
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
	public ModelAndView updateProductView(int bkCode, int page, ModelAndView mv) {
		
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
			mv.addObject("page", page);
			mv.setViewName("audioBookUpdate");
		} else {
			throw new audioBookException("오디오북 수정 페이지로의 이동에 실패하였습니다.");
		}
		
		return mv;
	}
	
	
	// 상품 수정
	@RequestMapping("updateProduct.ab")
	public ModelAndView updateProduct(@ModelAttribute Book b, int bkCode, int audPrice, String rdNameF, String rdIdF, String audDateF, String rdIntroF,
								String rdNameM, String rdIdM, String audDateM, String rdIntroM, HttpServletRequest request,
								@RequestParam("thumbnailImg") MultipartFile thumbnailImg, String imgOriginName, String imgChangeName,
								@RequestParam("fileF") MultipartFile fileF, String audioFileFOr, String audioFileF,
								@RequestParam("fileM") MultipartFile fileM, String audioFileMOr, String audioFileM,
								int biNo, int audCodeF, int audCodeM, int page, int afCodeF, int afCodeM, ModelAndView mv) {
		
		// [BookImage]
		// 		thumbnailImg는 새로 첨부한 사진 확인
		// 		imgChangeName는 원래 들어있던 사진 이름
		BookImage bi = new BookImage();
		bi.setBiNo(biNo);
		bi.setOriginName(imgOriginName);
		bi.setChangeName(imgChangeName);
		
		// 새로 첨부한 사진이 있으면
		if(thumbnailImg != null && !thumbnailImg.isEmpty()) {
			deleteImage(imgChangeName, request); // 원래 들어있던 사진 지우고
		
			String[] imgArr = saveImage(thumbnailImg, request); // 새로 첨부한 사진 이름을 rename하여 저장
			String changeName = imgArr[0];
			
			if(changeName != null) {
				bi.setOriginName(thumbnailImg.getOriginalFilename());
				bi.setChangeName(changeName);
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
		
		// [AudioBook-여자]
		AudioBook abF = new AudioBook(audCodeF, audioDateF, audPrice, rdNameF, rdIntroF, null, b.getBkCode());
		
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
		
		// [AudioBook-남자]
		AudioBook abM = new AudioBook(audCodeM, audioDateM, audPrice, rdNameM, rdIntroM, null, b.getBkCode());
		
		
		// [AudioFile-여자]
		// 		fileF는 새로 첨부한 파일 확인
		// 		audioFileF는 원래 들어있던 파일 이름
		AudioFile afF = new AudioFile();
		afF.setAfCode(afCodeF);
		afF.setOriginName(audioFileFOr);
		afF.setChangeName(audioFileF);
				
		// 새로 첨부한 파일이 있으면
		if(fileF != null && !fileF.isEmpty()) {
			deleteFile(audioFileF, request); // 원래 들어있던 파일 지우고
				
			String[] fileArr = saveFile(fileF, request); // 새로 첨부한 사진 이름을 rename하여 저장
			String changeName = fileArr[0];
					
			if(changeName != null) {
				afF.setOriginName(fileF.getOriginalFilename());
				afF.setChangeName(changeName);
			}
		}
		
		// [AudioFile-남자]
		// 		fileM은 새로 첨부한 파일 확인
		// 		audioFileM은 원래 들어있던 파일 이름
		AudioFile afM = new AudioFile();
		afM.setAfCode(afCodeM);
		afM.setOriginName(audioFileMOr);
		afM.setChangeName(audioFileM);
		
		// 새로 첨부한 파일이 있으면
		if(fileM != null && !fileM.isEmpty()) {
			deleteFile(audioFileM, request); // 원래 들어있던 파일 지우고
			
			String[] fileArr = saveFile(fileM, request); // 새로 첨부한 사진 이름을 rename하여 저장
			String changeName = fileArr[0];
			
			if(changeName != null) {
				afM.setOriginName(fileM.getOriginalFilename());
				afM.setChangeName(changeName);
			}
		}
		
		
		int result = abService.updateProduct(b, bi, abF, abM, afF, afM);
		
		if(result >= 6) {
			mv.addObject("page", page);
			mv.addObject("bkCode", b.getBkCode());
			mv.setViewName("redirect:abdetail.ab?bkCode="+b.getBkCode()+"&page="+page);
		} else {
			throw new audioBookException("상품 수정에 실패하였습니다.");
		}
		
		return mv;
	}
	
	public void deleteImage(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\bookUploadImages";
		
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) {
			f.delete();
		}
	}
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\bookUploadImages";
		
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) {
			f.delete();
		}
	}
	
}
