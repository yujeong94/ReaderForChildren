package com.kh.ReaderForChildren.sponsor_ys.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ReaderForChildren.member_ej.model.vo.Member;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.PageInfo;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.Sponsor;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.Support;

@Repository("spDAO")
public class sponsorDAO {




	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("sponsorMapper.getListCount");
	}

	public ArrayList<Sponsor> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		
		return (ArrayList)sqlSession.selectList("sponsorMapper.selectspList", null);
	}

	/*public int spupdateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("sponsorMapper.spupdateMember", m);
	}*/

	public int getSponserListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("sponsorMapper.getSponserListCount");
	}

	public ArrayList<Support> selectslList(SqlSessionTemplate sqlSession, PageInfo pi) {
		return  (ArrayList)sqlSession.selectList("supportMapper.selectslList", null);
	}

	public int suupdateMember(SqlSessionTemplate sqlSession, Support s) {
		return sqlSession.update("supportrMapper.suupdateMember", s);
	}

	public int insertSupport(SqlSessionTemplate sqlSession, Support support) {
		return sqlSession.insert("supportMapper.insertSupport", support);
	}



}
