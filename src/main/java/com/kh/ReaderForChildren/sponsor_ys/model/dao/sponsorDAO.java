package com.kh.ReaderForChildren.sponsor_ys.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ReaderForChildren.member_ej.model.vo.Member;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.PageInfo;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.Sponsor;

@Repository("spDAO")
public class sponsorDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("sponsorMapper.getListCount");
	}

	public ArrayList<Sponsor> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		
		return (ArrayList)sqlSession.selectList("sponsorMapper.selectspList", null);
	}

	public int spupdateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("sponsorMapper.spupdateMember", m);
	}
	



}
