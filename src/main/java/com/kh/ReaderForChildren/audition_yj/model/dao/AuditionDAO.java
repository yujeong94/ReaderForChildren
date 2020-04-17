package com.kh.ReaderForChildren.audition_yj.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ReaderForChildren.audition_yj.model.vo.Audition;
import com.kh.ReaderForChildren.audition_yj.model.vo.Career;
import com.kh.ReaderForChildren.audition_yj.model.vo.Reader;

@Repository("auDAO")
public class AuditionDAO {

	public ArrayList<Audition> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("auditionMapper.selectList");
	}

	public int insertAudition(SqlSessionTemplate sqlSession, Audition a) {
		return sqlSession.insert("auditionMapper.insertAudition", a);
	}

	public Audition selectAudition(SqlSessionTemplate sqlSession, int aNum) {
		return sqlSession.selectOne("auditionMapper.selectAudition", aNum);
	}

	public int updateAudition(SqlSessionTemplate sqlSession, Audition a) {
		return sqlSession.update("auditionMapper.updateAudition", a);
	}

	public int deleteAudition(SqlSessionTemplate sqlSession, int aNum) {
		return sqlSession.update("auditionMapper.deleteAudition", aNum);
	}

	public int insertCareer(SqlSessionTemplate sqlSession, ArrayList<Career> cArr) {
		return sqlSession.insert("auditionMapper.insertCareer", cArr);
	}
	
	public int insertApply(SqlSessionTemplate sqlSession, Reader r) {
		return sqlSession.insert("auditionMapper.insertApply", r);
	}


}
