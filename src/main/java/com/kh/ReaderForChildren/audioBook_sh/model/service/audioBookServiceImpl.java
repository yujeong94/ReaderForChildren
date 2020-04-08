package com.kh.ReaderForChildren.audioBook_sh.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ReaderForChildren.audioBook_sh.model.dao.audioBookDAO;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.AudioBook;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.Book;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.BookImage;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.PageInfo;

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
	public Book selectBook(int bkCode) {
		return abDAO.selectBook(sqlSession, bkCode);
	}

	@Override
	public AudioBook selectAudioBook(int bkCode) {
		return abDAO.selectAudioBook(sqlSession, bkCode);
	}

	@Override
	public BookImage selectBookImage(int bkCode) {
		return abDAO.selectBookImage(sqlSession, bkCode);
	}
	
	
}
