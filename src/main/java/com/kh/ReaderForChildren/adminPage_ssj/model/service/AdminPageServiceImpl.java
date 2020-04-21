package com.kh.ReaderForChildren.adminPage_ssj.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ReaderForChildren.adminPage_ssj.model.dao.AdminPageDAO;
import com.kh.ReaderForChildren.adminPage_ssj.model.vo.Admin;
import com.kh.ReaderForChildren.member_ej.model.vo.Member;

@Service("aService")
public class AdminPageServiceImpl implements AdminPageService {
	
	@Autowired
	private AdminPageDAO aDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Member> selectUserList() {
		return aDAO.selectUserList(sqlSession);
	}

	@Override
	public ArrayList<Member> selectUserSearch(String userId) {
		return aDAO.selectUserSearch(sqlSession, userId);
	}

	@Override
	public Member selectUserInfo(String userId) {
		return aDAO.selectUserInfo(sqlSession, userId);
	}

	@Override
	public Admin adminLogin(Admin a) {
		return aDAO.adminLogin(sqlSession, a);
	}
}
