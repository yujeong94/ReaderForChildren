package com.kh.ReaderForChildren.notice_sh.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ReaderForChildren.notice_sh.model.dao.noticeDAO;

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
}
