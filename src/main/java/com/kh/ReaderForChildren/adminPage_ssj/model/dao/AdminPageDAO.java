package com.kh.ReaderForChildren.adminPage_ssj.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ReaderForChildren.adminPage_ssj.model.vo.Admin;
import com.kh.ReaderForChildren.event_ssj.model.vo.Event;
import com.kh.ReaderForChildren.member_ej.model.vo.Member;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.Support;

@Repository("aDAO")
public class AdminPageDAO {

	public ArrayList<Member> selectUserList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminPageMapper.selectUserList");
	}

	public ArrayList<Member> selectUserSearch(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("adminPageMapper.selectUserSearch", userId);
	}

	public Member selectUserInfo(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("adminPageMapper.selectUserInfo", userId);
	}

	public Admin adminLogin(SqlSessionTemplate sqlSession, Admin a) {
		return sqlSession.selectOne("adminPageMapper.adminLogin", a);
	}

	public ArrayList<Event> eventWinnerList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminPageMapper.eventWinnerList");
	}

	public ArrayList<Event> eventIngLIst(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminPageMapper.eventIngList");
	}

	public ArrayList<Event> eventEndList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminPageMapper.eventEndList");
	}

	public ArrayList<Support> selectSponsorList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminPageMapper.selectSponsorList");
	}

	public ArrayList<Support> sponsorSearch(SqlSessionTemplate sqlSession, String spName) {
		return (ArrayList)sqlSession.selectList("adminPageMapper.sponsorSearch", spName);
	}

}
