package com.kh.ReaderForChildren.member_ej.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ReaderForChildren.member_ej.model.vo.Member;

@Repository("mDAO")
public class MemberDAO {

	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.selectOne", m);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.idCheck", userId);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int pwdUpdate(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("memberMapper.pwdUpdate", map);
	}

}
