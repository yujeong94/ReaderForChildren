package com.kh.ReaderForChildren.event_ssj.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ReaderForChildren.audition_yj.model.vo.Reader;
import com.kh.ReaderForChildren.event_ssj.model.dao.EventDAO;
import com.kh.ReaderForChildren.event_ssj.model.vo.Event;
import com.kh.ReaderForChildren.event_ssj.model.vo.Reply;

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

	@Override
	public Event selectEvent(int eNum) {
		Event e = null;
				
		int result = evDAO.eventAddCount(sqlSession, eNum);
		
		if(result > 0) {
			e = evDAO.selectEvent(sqlSession, eNum);
		}
		
		return e;
	}

	@Override
	public int insertReply(Reply r) {
		return evDAO.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int eNum) {
		return evDAO.selectReplyList(sqlSession, eNum);
	}

	@Override
	public int deleteReply(Reply r) {
		return evDAO.deleteReply(sqlSession, r);
	}

	@Override
	public int replyCheck(Reply r) {
		return evDAO.replyCheck(sqlSession, r);
	}

	@Override
	public Reader selectReader(String userId) {
		return evDAO.selectReader(sqlSession, userId);
	}
	
}
