package com.kh.ReaderForChildren.audioBook_sh.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ReaderForChildren.audioBook_sh.model.vo.Book;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.BookImage;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.PageInfo;

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

}
