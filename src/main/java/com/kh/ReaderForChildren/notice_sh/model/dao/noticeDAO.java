package com.kh.ReaderForChildren.notice_sh.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ReaderForChildren.notice_sh.model.vo.Notice;
import com.kh.ReaderForChildren.notice_sh.model.vo.PageInfo;
import com.kh.ReaderForChildren.notice_sh.model.vo.SearchCondition;

@Repository("nDAO")
public class noticeDAO {

	public int getListCount(SqlSessionTemplate session) {
		return session.selectOne("noticeMapper.getListCount");
	}

	public ArrayList<Notice> selectList(SqlSessionTemplate session, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getNoticeLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getNoticeLimit());
		
		return (ArrayList)session.selectList("noticeMapper.selectList", null, rowBounds);
	}

	public int getSearchListCount(SqlSessionTemplate session, SearchCondition sc) {
		return session.selectOne("noticeMapper.getSearchListCount", sc);
	}

	public ArrayList<Notice> selectSearchList(SqlSessionTemplate session, PageInfo pi, SearchCondition sc) {
		int offset = (pi.getCurrentPage() - 1) * pi.getNoticeLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getNoticeLimit());
		
		return (ArrayList)session.selectList("noticeMapper.selectSearchList", sc, rowBounds);
	}

}
