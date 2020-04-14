package com.kh.ReaderForChildren.event_ssj.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ReaderForChildren.event_ssj.model.vo.Event;

@Repository("evDAO")
public class EventDAO {
	
	public int insertEvent(SqlSessionTemplate sqlSession, Event e) {
		return sqlSession.insert("eventMapper.insertEvent", e);
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("eventMapper.getListCount");
	}

	public ArrayList<Event> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("eventMapper.selectList");
	}

	public ArrayList<Event> selectEndList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("eventMapper.selectEndList");
	}

}
