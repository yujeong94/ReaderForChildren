package com.kh.ReaderForChildren.sponsor_ys.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ReaderForChildren.sponsor_ys.model.vo.PageInfo;
import com.kh.ReaderForChildren.member_ej.model.vo.Member;
import com.kh.ReaderForChildren.sponsor_ys.model.dao.sponsorDAO;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.Sponsor;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.Support;

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
/*
	@Override
	public int spupdateMember(Member m) {
		return spDAO.spupdateMember(sqlSession, m);
	}*/

	@Override
	public int getSponserListCount() {
		return spDAO.getSponserListCount(sqlSession);
	}


	@Override
	public int suupdateMember(Support s) {
		return spDAO.suupdateMember(sqlSession, s);
	}

	@Override
	public ArrayList<Support> selectslList(PageInfo pi) {
		return spDAO.selectslList(sqlSession, pi);
	}

	@Override
	public int insertSupport(Support s) {
		return spDAO.insertSupport(sqlSession, s);
	}




}
