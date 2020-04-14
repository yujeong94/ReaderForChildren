package com.kh.ReaderForChildren.audioBook_sh.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ReaderForChildren.audioBook_sh.model.vo.AudioBook;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.AudioFile;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.Book;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.BookImage;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.PageInfo;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.SearchCondition;

@Repository("abDAO")
public class audioBookDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("audioBookMapper.getListCount");
	}

	public ArrayList<Book> selectbList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBookLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBookLimit());
		
		return (ArrayList)sqlSession.selectList("audioBookMapper.selectbList", null, rowBounds);
	}

	public ArrayList<BookImage> selectbiList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("audioBookMapper.selectbiList");
	}
	
	public int getSearchListCount(SqlSessionTemplate sqlSession, SearchCondition sc) {
		return sqlSession.selectOne("audioBookMapper.getSearchListCount", sc);
	}
	
	public ArrayList<Book> selectSearchbList(SqlSessionTemplate sqlSession, PageInfo pi, SearchCondition sc) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBookLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBookLimit());
		
		return (ArrayList)sqlSession.selectList("audioBookMapper.selectSearchbList", sc, rowBounds);
	}

	public Book selectBook(SqlSessionTemplate sqlSession, int bkCode) {
		return sqlSession.selectOne("audioBookMapper.selectBook", bkCode);
	}

	public ArrayList<AudioBook> selectAudioBook(SqlSessionTemplate sqlSession, int bkCode) {
		return (ArrayList)sqlSession.selectList("audioBookMapper.selectAudioBook", bkCode);
	}

	public BookImage selectBookImage(SqlSessionTemplate sqlSession, int bkCode) {
		return sqlSession.selectOne("audioBookMapper.selectBookImage", bkCode);
	}
	
	public ArrayList<AudioFile> selectAudioFile(SqlSessionTemplate sqlSession, int bkCode) {
		return (ArrayList)sqlSession.selectList("audioBookMapper.selectAudioFile", bkCode);
	}

	public int insertBook(SqlSessionTemplate sqlSession, Book b) {
		return sqlSession.insert("audioBookMapper.insertBook", b);
	}

	public int insertBookImage(SqlSessionTemplate sqlSession, BookImage bi) {
		return sqlSession.insert("audioBookMapper.insertBookImage", bi);
	}

	public int insertAudioBookF(SqlSessionTemplate sqlSession, AudioBook abF) {
		return sqlSession.insert("audioBookMapper.insertAudioBookF", abF);
	}

	public int insertAudioFileF(SqlSessionTemplate sqlSession, AudioFile afF) {
		return sqlSession.insert("audioBookMapper.insertAudioFileF", afF);
	}

	public int insertAudioBookM(SqlSessionTemplate sqlSession, AudioBook abM) {
		return sqlSession.insert("audioBookMapper.insertAudioBookM", abM);
	}

	public int insertAudioFileM(SqlSessionTemplate sqlSession, AudioFile afM) {
		return sqlSession.insert("audioBookMapper.insertAudioFileM", afM);
	}


}
