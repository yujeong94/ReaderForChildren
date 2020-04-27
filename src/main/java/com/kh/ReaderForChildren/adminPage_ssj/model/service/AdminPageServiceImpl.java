package com.kh.ReaderForChildren.adminPage_ssj.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ReaderForChildren.adminPage_ssj.model.dao.AdminPageDAO;
import com.kh.ReaderForChildren.adminPage_ssj.model.vo.Admin;
import com.kh.ReaderForChildren.event_ssj.model.vo.Event;
import com.kh.ReaderForChildren.member_ej.model.vo.Member;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.Support;

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

	@Override
	public ArrayList<Event> eventWinnerList() {
		return aDAO.eventWinnerList(sqlSession);
	}

	@Override
	public ArrayList<Event> eventIngList() {
		return aDAO.eventIngLIst(sqlSession);
	}

	@Override
	public ArrayList<Event> eventEndList() {
		return aDAO.eventEndList(sqlSession);
	}

	@Override
	public ArrayList<Support> selectSponsorList() {
		return aDAO.selectSponsorList(sqlSession);
	}

	@Override
	public ArrayList<Support> sponsorSearch(String spName) {
		return aDAO.sponsorSearch(sqlSession, spName);
	}
}
