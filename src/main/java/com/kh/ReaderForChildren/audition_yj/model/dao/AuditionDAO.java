package com.kh.ReaderForChildren.audition_yj.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ReaderForChildren.audition_yj.model.vo.Audition;
import com.kh.ReaderForChildren.audition_yj.model.vo.Career;
import com.kh.ReaderForChildren.audition_yj.model.vo.Reader;
import com.kh.ReaderForChildren.member_ej.model.vo.Member;

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

	
	public int insertApply(SqlSessionTemplate sqlSession, Reader r) {
		return sqlSession.insert("auditionMapper.insertApply", r);
	}

	public int insertCareer(SqlSessionTemplate sqlSession, ArrayList<Career> cArr) {
		int result = 0;
		
		for(int i = 0; i < cArr.size(); i++) {
			result = sqlSession.insert("auditionMapper.insertCareer", cArr.get(i));
		}
		
		return result;
	}

	public Reader selectApply(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("auditionMapper.selectApply", userId);
	}

	public ArrayList<Career> selectCareer(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("auditionMapper.selectCareer", userId);
	}

	public int readerCheck(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("auditionMapper.readerCheck", userId);
	}

	public int updateApply(SqlSessionTemplate sqlSession, Reader r, ArrayList<Career> cArr) {
		int result = 0;
		
		result = sqlSession.update("auditionMapper.updateApply", r);
		
		if(result > 0) {
			result = sqlSession.delete("auditionMapper.deleteCareer", r.getUserId());
			
			if(result > 0) {
				for(int i = 0; i < cArr.size(); i++) {
					result = sqlSession.insert("auditionMapper.insertCareer", cArr.get(i));
				}
			}
			
		}
		
		return result;
	}

	public int deleteApply(SqlSessionTemplate sqlSession, String userId) {
		int result = 0;
		
		result = sqlSession.delete("auditionMapper.deleteCareer", userId);
		
		if(result > 0) {
			result = sqlSession.delete("auditionMapper.deleteApply", userId);
		}
		return result;
	}

	public int selectPwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("auditionMapper.selectPwd", m);
	}

}
