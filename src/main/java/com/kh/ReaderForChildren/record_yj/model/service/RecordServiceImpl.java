package com.kh.ReaderForChildren.record_yj.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ReaderForChildren.record_yj.model.dao.RecordDAO;

@Service("reService")
public class RecordServiceImpl implements RecordService {
	
	@Autowired
	private RecordDAO reDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}
