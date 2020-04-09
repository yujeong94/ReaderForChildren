package com.kh.ReaderForChildren.audition_yj.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ReaderForChildren.audition_yj.model.dao.AuditionDAO;
import com.kh.ReaderForChildren.audition_yj.model.vo.Audition;

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

}
