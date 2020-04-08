package com.kh.ReaderForChildren.sponsor_ys.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ReaderForChildren.sponsor_ys.model.vo.PageInfo;
import com.kh.ReaderForChildren.member_ej.model.vo.Member;
import com.kh.ReaderForChildren.sponsor_ys.model.dao.sponsorDAO;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.Sponsor;

@Service("spService")
public class sponsorServiceImpl implements sponsorService {

	@Autowired
	private sponsorDAO spDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		return spDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Sponsor> selectspList(PageInfo pi) {
		return spDAO.selectList(sqlSession, pi);
	}

	@Override
	public int spupdateMember(Member m) {
		return spDAO.spupdateMember(sqlSession, m);
	}

}
