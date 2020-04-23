package com.kh.ReaderForChildren.volunteer_ej.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ReaderForChildren.volunteer_ej.model.dao.VolunteerDAO;
import com.kh.ReaderForChildren.volunteer_ej.model.vo.MyVolunteerActivity;
import com.kh.ReaderForChildren.volunteer_ej.model.vo.Volunteer;
import com.kh.ReaderForChildren.volunteer_ej.model.vo.VolunteerSchedule;

@Service("vService")
public class VolunteerServiceImpl implements VolunteerService{
	
	@Autowired
	private VolunteerDAO vDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int addVolSchedule(VolunteerSchedule vs) {
		return vDAO.addVolSchedule(sqlSession, vs);
	}

	@Override
	public ArrayList<VolunteerSchedule> getSchedule() {
		return vDAO.getSchedule(sqlSession);
		
	}

	@Override
	public int serviceAsk(Volunteer v) {
		return vDAO.serviceAsk(sqlSession, v);
	}

	@Override
	public int checkMax(Volunteer v) {
		return vDAO.checkMax(sqlSession, v);
	}

	@Override
	public ArrayList<MyVolunteerActivity> selMyVol(String userId) {
		return vDAO.selMyVol(sqlSession, userId);
	}

	@Override
	public int cancelVol(int vlNum2) {
		return vDAO.cancelVol(sqlSession, vlNum2);
	}

	@Override
	public int updateCur(int vlNum2) {
		return vDAO.updateCur(sqlSession, vlNum2);
	}
}
