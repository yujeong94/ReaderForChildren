package com.kh.ReaderForChildren.adminPage_ssj.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ReaderForChildren.adminPage_ssj.model.vo.Admin;
import com.kh.ReaderForChildren.adminPage_ssj.model.vo.AdminOrderList;
import com.kh.ReaderForChildren.audition_yj.model.vo.Audition;
import com.kh.ReaderForChildren.audition_yj.model.vo.Career;
import com.kh.ReaderForChildren.audition_yj.model.vo.Reader;
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

	public ArrayList<Reader> selectAuditionList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminPageMapper.selectAuditionList");
	}

	public ArrayList<Reader> selectCategoryAuditionList(SqlSessionTemplate sqlSession, String selectbox) {
		return (ArrayList)sqlSession.selectList("adminPageMapper.selectCategoryAdutionList", selectbox);
	}

	public Reader selectReader(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("adminPageMapper.selectReader", userId);
	}

	public ArrayList<Career> selectCareer(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("adminPageMapper.selectCareer", userId);
	}

	public Audition selectAudition(SqlSessionTemplate sqlSession, int aNum) {
		return sqlSession.selectOne("adminPageMapper.selectAudition", aNum);
	}

	public Member selectUser(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("adminPageMapper.selectUser", userId);
	}

	public int resultPassReadTable(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("adminPageMapper.resultPassReadTable", userId);
	}

	public int resultPassMemberTable(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("adminPageMapper.resultPassMemberTable", userId);
	}

	public int resultFailReaderTable(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("adminPageMapper.resultFailReaderTable", userId);
	}

	public int resultBanReaderTable(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("adminPageMapper.resultBanReaderTable", userId);
	}

	public int resultBanMemberTable(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("adminPageMapper.resultBanMemberTable", userId);
	}

	public ArrayList<Support> selectUserSupport(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("adminPageMapper.selectUserSupport", userId);
	}

	public ArrayList<AdminOrderList> buyerListView(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminPageMapper.buyerListView");
	}

}
