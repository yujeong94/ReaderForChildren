package com.kh.ReaderForChildren.audition_yj.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ReaderForChildren.audition_yj.model.dao.AuditionDAO;
import com.kh.ReaderForChildren.audition_yj.model.vo.Audition;

@Service("aService")
public class AuditionServiceImpl implements AuditionService {
	
	@Autowired
	private AuditionDAO aDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Audition> selectList() {
		return aDAO.selectList(sqlSession);
	}

}
