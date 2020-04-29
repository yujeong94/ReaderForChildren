package com.kh.ReaderForChildren.adminPage_ssj.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ReaderForChildren.adminPage_ssj.model.dao.AdminPageDAO;
import com.kh.ReaderForChildren.adminPage_ssj.model.vo.Admin;
import com.kh.ReaderForChildren.adminPage_ssj.model.vo.AdminOrderList;
import com.kh.ReaderForChildren.audition_yj.model.vo.Audition;
import com.kh.ReaderForChildren.audition_yj.model.vo.Career;
import com.kh.ReaderForChildren.audition_yj.model.vo.Reader;
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

	@Override
	public ArrayList<Reader> selectAuditionList() {
		return aDAO.selectAuditionList(sqlSession);
	}

	@Override
	public ArrayList<Reader> selectCategoryAuditionList(String selectbox) {
		return aDAO.selectCategoryAuditionList(sqlSession, selectbox);
	}

	@Override
	public Reader selectReader(String userId) {
		return aDAO.selectReader(sqlSession, userId);
	}

	@Override
	public ArrayList<Career> selectCareer(String userId) {
		return aDAO.selectCareer(sqlSession, userId);
	}

	@Override
	public Audition selectAudition(int aNum) {
		return aDAO.selectAudition(sqlSession, aNum);
	}

	@Override
	public Member selectUser(String userId) {
		return aDAO.selectUser(sqlSession, userId);
	}

	@Override
	public int resultPassReaderTable(String userId) {
		return aDAO.resultPassReadTable(sqlSession, userId);
	}

	@Override
	public int resultPassMemberTable(String userId) {
		return aDAO.resultPassMemberTable(sqlSession, userId);
	}

	@Override
	public int resultFailReaderTable(String userId) {
		return aDAO.resultFailReaderTable(sqlSession, userId);
	}

	@Override
	public int resultBanReaderTable(String userId) {
		return aDAO.resultBanReaderTable(sqlSession, userId);
	}

	@Override
	public int resultBanMemberTable(String userId) {
		return aDAO.resultBanMemberTable(sqlSession, userId);
	}

	@Override
	public ArrayList<Support> selectUserSupport(String userId) {
		return aDAO.selectUserSupport(sqlSession, userId);
	}

	@Override
	public ArrayList<AdminOrderList> buyerListView() {
		return aDAO.buyerListView(sqlSession);
	}
}
