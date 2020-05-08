package com.kh.ReaderForChildren.audioBook_sh.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ReaderForChildren.audioBook_sh.model.vo.AudioBook;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.AudioFile;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.Book;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.BookImage;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.Cart;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.OrderDetail;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.PageInfo;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.SearchCondition;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.Shipping;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.cartList;

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
	
	public ArrayList<AudioBook> selectabList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("audioBookMapper.selectabList");
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
		return sqlSession.insert("audioBookMapper.insertAudioBook", abF);
	}

	public int insertAudioFileF(SqlSessionTemplate sqlSession, AudioFile afF) {
		return sqlSession.insert("audioBookMapper.insertAudioFile", afF);
	}

	public int insertAudioBookM(SqlSessionTemplate sqlSession, AudioBook abM) {
		return sqlSession.insert("audioBookMapper.insertAudioBook", abM);
	}

	public int insertAudioFileM(SqlSessionTemplate sqlSession, AudioFile afM) {
		return sqlSession.insert("audioBookMapper.insertAudioFile", afM);
	}

	public int selectDefaultSA(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("audioBookMapper.selectDefaultSA", userId);
	}
	
	public ArrayList<Shipping> shipAddList(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("audioBookMapper.selectShipAddList", userId);
	}

	public int addShipAddress(SqlSessionTemplate sqlSession, Shipping s) {
		return sqlSession.insert("audioBookMapper.addShipAddress", s);
	}

	public int orderInsert(SqlSessionTemplate sqlSession, OrderDetail order) {
		return sqlSession.insert("audioBookMapper.orderInsert", order);
	}

	public int deleteBook(SqlSessionTemplate sqlSession, int bkCode) {
		return sqlSession.update("audioBookMapper.deleteBook", bkCode);
	}

	public int deleteAudioBook(SqlSessionTemplate sqlSession, int bkCode) {
		return sqlSession.update("audioBookMapper.deleteAudioBook", bkCode);
	}

	public int deleteBookImage(SqlSessionTemplate sqlSession, int bkCode) {
		return sqlSession.update("audioBookMapper.deleteBookImage", bkCode);
	}

	public int deleteAudioFile(SqlSessionTemplate sqlSession, int bkCode) {
		return sqlSession.update("audioBookMapper.deleteAudioFile", bkCode);
	}

	public int cartInsert(SqlSessionTemplate sqlSession, Cart c) {
		return sqlSession.insert("audioBookMapper.cartInsert", c);
	}

	public int updateBook(SqlSessionTemplate sqlSession, Book b) {
		return sqlSession.update("audioBookMapper.updateBook", b);
	}

	public int updateBookImage(SqlSessionTemplate sqlSession, BookImage bi) {
		return sqlSession.update("audioBookMapper.updateBookImage", bi);
	}

	public int updateAudioBookF(SqlSessionTemplate sqlSession, AudioBook abF) {
		return sqlSession.update("audioBookMapper.updateAudioBook", abF);
	}
	
	public int updateAudioFileF(SqlSessionTemplate sqlSession, AudioFile afF) {
		return sqlSession.update("audioBookMapper.updateAudioFile", afF);
	}

	public int updateAudioBookM(SqlSessionTemplate sqlSession, AudioBook abM) {
		return sqlSession.update("audioBookMapper.updateAudioBook", abM);
	}

	public int updateAudioFileM(SqlSessionTemplate sqlSession, AudioFile afM) {
		return sqlSession.update("audioBookMapper.updateAudioFile", afM);
	}

	public ArrayList<BookImage> selectBestList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("audioBookMapper.selectBestList");
	}

	public ArrayList<cartList> selectcartList(SqlSessionTemplate sqlSession, String[] arr) {
		ArrayList<cartList> ca = new ArrayList<cartList>();
		
		for(int i = 0; i < arr.length; i++) {
			cartList cl = sqlSession.selectOne("audioBookMapper.selectcartList", arr[i]);
			ca.add(cl);
		}
		return ca;
	}


}
