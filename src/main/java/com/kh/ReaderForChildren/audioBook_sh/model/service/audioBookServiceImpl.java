package com.kh.ReaderForChildren.audioBook_sh.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ReaderForChildren.audioBook_sh.model.dao.audioBookDAO;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.AudioBook;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.AudioFile;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.Book;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.BookImage;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.OrderDetail;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.PageInfo;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.SearchCondition;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.Shipping;

@Service("abService")
public class audioBookServiceImpl implements audioBookService{

	@Autowired
	private audioBookDAO abDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount() {
		return abDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Book> selectbList(PageInfo pi) {
		return abDAO.selectbList(sqlSession, pi);
	}

	@Override
	public ArrayList<BookImage> selectbiList() {
		return abDAO.selectbiList(sqlSession);
	}
	
	@Override
	public int getSearchListCount(SearchCondition sc) {
		return abDAO.getSearchListCount(sqlSession, sc);
	}

	@Override
	public ArrayList<Book> selectSearchbList(PageInfo pi, SearchCondition sc) {
		return abDAO.selectSearchbList(sqlSession, pi, sc);
	}
	
	@Override
	public Book selectBook(int bkCode) {
		return abDAO.selectBook(sqlSession, bkCode);
	}

	@Override
	public ArrayList<AudioBook> selectAudioBook(int bkCode) {
		return abDAO.selectAudioBook(sqlSession, bkCode);
	}

	@Override
	public BookImage selectBookImage(int bkCode) {
		return abDAO.selectBookImage(sqlSession, bkCode);
	}
	
	@Override
	public ArrayList<AudioFile> selectAudioFile(int bkCode) {
		return abDAO.selectAudioFile(sqlSession, bkCode);
	}

	@Override
	public int insertAudioBook(Book b, BookImage bi, AudioBook abF, AudioBook abM, AudioFile afF, AudioFile afM) {
		int result1 = abDAO.insertBook(sqlSession, b);
		int result2 = abDAO.insertBookImage(sqlSession, bi);
		int result3 = abDAO.insertAudioBookF(sqlSession, abF);
		int result4 = abDAO.insertAudioFileF(sqlSession, afF);
		int result5 = abDAO.insertAudioBookM(sqlSession, abM);
		int result6 = abDAO.insertAudioFileM(sqlSession, afM);
		
		return result1 + result2 + result3 + result4 + result5 + result6;
	}
	
	@Override
	public int selectDefaultSA(String userId) {
		return abDAO.selectDefaultSA(sqlSession, userId);
	}

	@Override
	public ArrayList<Shipping> shipAddList(String userId) {
		return abDAO.shipAddList(sqlSession, userId);
	}

	@Override
	public int addShipAddress(Shipping s) {
		return abDAO.addShipAddress(sqlSession, s);
	}

	@Override
	public int orderInsert(OrderDetail order) {
		return abDAO.orderInsert(sqlSession, order);
	}

}
