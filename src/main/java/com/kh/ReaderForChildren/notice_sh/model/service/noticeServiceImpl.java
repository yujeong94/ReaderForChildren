package com.kh.ReaderForChildren.notice_sh.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ReaderForChildren.notice_sh.model.dao.noticeDAO;
import com.kh.ReaderForChildren.notice_sh.model.vo.Notice;
import com.kh.ReaderForChildren.notice_sh.model.vo.PageInfo;
import com.kh.ReaderForChildren.notice_sh.model.vo.SearchCondition;

@Service("nService")
public class noticeServiceImpl implements noticeService {

	@Autowired
	private noticeDAO nDAO;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int getListCount() {
		return nDAO.getListCount(session);
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return nDAO.selectList(session, pi);
	}

	@Override
	public int getSearchListCount(SearchCondition sc) {
		return nDAO.getSearchListCount(session, sc);
	}

	@Override
	public ArrayList<Notice> selectSearchList(PageInfo pi, SearchCondition sc) {
		return nDAO.selectSearchList(session, pi, sc);
	}

	@Override
	public int insertNotice(Notice n) {
		return nDAO.insertNotice(session, n);
	}

	@Override
	public Notice selectNotice(int noCode) {
		
		Notice n = null;
		
		int result = nDAO.addReadCount(session, noCode);
		
		if(result > 0) {
			return nDAO.selectNotice(session, noCode);
		}
		
		return n;
	}

	@Override
	public int updateNotice(Notice n) {
		return nDAO.updateNotice(session, n);
	}

	@Override
	public int deleteNotice(int noCode) {
		return nDAO.deleteNotice(session, noCode);
	}
}
