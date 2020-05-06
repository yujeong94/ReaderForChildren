package com.kh.ReaderForChildren.audition_yj.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ReaderForChildren.audition_yj.model.dao.AuditionDAO;
import com.kh.ReaderForChildren.audition_yj.model.vo.Audition;
import com.kh.ReaderForChildren.audition_yj.model.vo.Career;
import com.kh.ReaderForChildren.audition_yj.model.vo.Reader;
import com.kh.ReaderForChildren.member_ej.model.vo.Member;

@Service("auService")
public class AuditionServiceImpl implements AuditionService {
	
	@Autowired
	private AuditionDAO auDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Audition> selectList() {
		return auDAO.selectList(sqlSession);
	}

	@Override
	public int insertAudition(Audition a) {
		return auDAO.insertAudition(sqlSession, a);
	}

	@Override
	public Audition selectAudition(int aNum) {
		return auDAO.selectAudition(sqlSession, aNum);
	}

	@Override
	public int updateAudition(Audition a) {
		return auDAO.updateAudition(sqlSession, a);
	}

	@Override
	public int deleteAudition(int aNum) {
		return auDAO.deleteAudition(sqlSession, aNum);
	}

	@Override
	public int insertApply(Reader r, ArrayList<Career> cArr) {
	
		int result = 0;
		int rResult = auDAO.insertApply(sqlSession, r);	
		
		if(rResult > 0) {
			result = auDAO.insertCareer(sqlSession, cArr);
		} 
		
		return result;
	}

	@Override
	public Reader selectReader(String userId) {
		return auDAO.selectApply(sqlSession, userId);
	}

	@Override
	public ArrayList<Career> selectCareer(String userId) {
		return auDAO.selectCareer(sqlSession, userId);
	}

	@Override
	public int readerCheck(String userId) {
		return auDAO.readerCheck(sqlSession, userId);
	}

	@Override
	public int updateApply(Reader r, ArrayList<Career> cArr) {
		return auDAO.updateApply(sqlSession, r, cArr);
	}

	@Override
	public int deleteApply(String userId) {
		return auDAO.deleteApply(sqlSession, userId);
	}

	@Override
	public int selectPwd(Member m) {
		return auDAO.selectPwd(sqlSession, m);
	}
}
