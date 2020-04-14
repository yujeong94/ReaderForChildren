package com.kh.ReaderForChildren.member_ej.model.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ReaderForChildren.member_ej.model.dao.MemberDAO;
import com.kh.ReaderForChildren.member_ej.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public Member memberLogin(Member m) {
		return mDAO.selectMember(sqlSession, m);
	}

	@Override
	public int checkId(String userId) {
		return mDAO.idCheck(sqlSession,userId);
	}

	@Override
	public int updateMember(Member m) {
		return mDAO.updateMember(sqlSession, m);
	}

	@Override
	public int memberPwdUpdate(HashMap<String, String> map) {
		return mDAO.pwdUpdate(sqlSession, map);
  }
	public int insertMember(Member m) {
		return mDAO.insertMember(sqlSession, m);
	}

	@Override
	public String findMemberId(Member m) {
		return mDAO.findMemberId(sqlSession, m);
	}

	@Override
	public int finMemberPwd(Member m) {
		return mDAO.findMemberPwd(sqlSession, m);
	}

	@Override
	public int updateTemPwd(HashMap<String, String> map) {
		return mDAO.updateTemPwd(sqlSession, map);
	}

}
