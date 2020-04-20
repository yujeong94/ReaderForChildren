package com.kh.ReaderForChildren.event_ssj.model.service;

import java.util.ArrayList;

import com.kh.ReaderForChildren.event_ssj.model.vo.Event;
import com.kh.ReaderForChildren.event_ssj.model.vo.Reply;

public interface EventService {

	int insertEvent(Event e);

	int getListCount();

	ArrayList<Event> selectList();

	ArrayList<Event> selectEndList();

	Event selectEvent(int eNum);

	int insertReply(Reply r);

	ArrayList<Reply> selectReplyList(int eNum);

	int deleteReply(Reply r);

	int replyCheck(Reply r);


}
