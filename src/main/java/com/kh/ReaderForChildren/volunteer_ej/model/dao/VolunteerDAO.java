package com.kh.ReaderForChildren.volunteer_ej.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ReaderForChildren.volunteer_ej.model.vo.MyVolunteerActivity;
import com.kh.ReaderForChildren.volunteer_ej.model.vo.Volunteer;
import com.kh.ReaderForChildren.volunteer_ej.model.vo.VolunteerSchedule;

@Repository("vDAO")
public class VolunteerDAO {

	public int addVolSchedule(SqlSessionTemplate sqlSession, VolunteerSchedule vs) {
		return sqlSession.insert("volunteerMapper.insertSchedule", vs);
	}

	public ArrayList<VolunteerSchedule> getSchedule(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("volunteerMapper.getSchedule");
	}

	public int serviceAsk(SqlSessionTemplate sqlSession, Volunteer v) {
		return sqlSession.insert("volunteerMapper.insertEntry", v);
	}

	public int checkMax(SqlSessionTemplate sqlSession, Volunteer v) {
		return sqlSession.update("volunteerMapper.checkMax", v);
	}

	public ArrayList<MyVolunteerActivity> selMyVol(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("volunteerMapper.selMyVol", userId);
	}

	public int cancelVol(SqlSessionTemplate sqlSession, int vlNum2) {
		return sqlSession.update("volunteerMapper.cancelVol", vlNum2);
	}

	public int updateCur(SqlSessionTemplate sqlSession, int vlNum2) {
		return sqlSession.update("volunteerMapper.updateCur", vlNum2);
	}

	public int checkDemander(SqlSessionTemplate sqlSession, Volunteer v) {
		return sqlSession.selectOne("volunteerMapper.checkDe", v);
	}

	public int checkDate(SqlSessionTemplate sqlSession, VolunteerSchedule vs) {
		return sqlSession.selectOne("volunteerMapper.checkDate", vs);
	}

	public int updateStatus(SqlSessionTemplate sqlSession) {
		return sqlSession.update("volunteerMapper.updateStatus");
	}

//	public ArrayList<VolunteerSchedule> selectMax(SqlSessionTemplate sqlSession, int vlNum2) {
//		return (ArrayList)sqlSession.selectList("volunteerMapper.selectMax", vlNum2);
//	}
	
	

}
