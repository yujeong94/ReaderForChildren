package com.kh.ReaderForChildren.record_yj.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ReaderForChildren.record_yj.model.dao.RecordDAO;
import com.kh.ReaderForChildren.record_yj.model.vo.RecBooth;

@Service("reService")
public class RecordServiceImpl implements RecordService {
	
	@Autowired
	private RecordDAO reDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertRecord(RecBooth rb) {
		return reDAO.insertRecord(sqlSession, rb);
	}

	@Override
	public ArrayList<RecBooth> selectRecBooth() {
		return reDAO.selectRecBooth(sqlSession);
	}
}
