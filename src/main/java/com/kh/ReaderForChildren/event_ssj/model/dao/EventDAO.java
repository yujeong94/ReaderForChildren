package com.kh.ReaderForChildren.event_ssj.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ReaderForChildren.event_ssj.model.vo.Event;
import com.kh.ReaderForChildren.event_ssj.model.vo.Reply;

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

	public Event selectEvent(SqlSessionTemplate sqlSession, int eNum) {
		return sqlSession.selectOne("eventMapper.selectEvent", eNum);
	}

	public int eventAddCount(SqlSessionTemplate sqlSession, int eNum) {
		return sqlSession.update("eventMapper.eventAddCount", eNum);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("eventMapper.insertReply", r);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int eNum) {
		return (ArrayList)sqlSession.selectList("eventMapper.selectReplyList", eNum);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("eventMapper.deleteReply", r);
	}

	public int replyCheck(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.selectOne("eventMapper.replyCheck", r);
	}

}
