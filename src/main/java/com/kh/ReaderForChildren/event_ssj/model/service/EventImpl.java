package com.kh.ReaderForChildren.event_ssj.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ReaderForChildren.event_ssj.model.dao.EventDAO;
import com.kh.ReaderForChildren.event_ssj.model.vo.Event;

@Service("evService")
public class EventImpl implements EventService {
	
	@Autowired
	private EventDAO evDAO;

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertEvent(Event e) {
		return evDAO.insertEvent(sqlSession, e);
	}

	@Override
	public int getListCount() {
		return evDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Event> selectList() {
		return evDAO.selectList(sqlSession);
	}

	@Override
	public ArrayList<Event> selectEndList() {
		return evDAO.selectEndList(sqlSession);
	}
	
}
