package com.kh.ReaderForChildren.volunteer_ej.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ReaderForChildren.volunteer_ej.model.vo.VolunteerSchedule;

@Repository("vDAO")
public class VolunteerDAO {

	public int addVolSchedule(SqlSessionTemplate sqlSession, VolunteerSchedule vs) {
		return sqlSession.insert("volunteerMapper.insertSchedule", vs);
	}

	public ArrayList<VolunteerSchedule> getSchedule(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("volunteerMapper.getSchedule");
	}

}
