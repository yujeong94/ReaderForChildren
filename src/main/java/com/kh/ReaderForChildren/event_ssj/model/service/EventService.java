package com.kh.ReaderForChildren.event_ssj.model.service;

import java.util.ArrayList;

import com.kh.ReaderForChildren.event_ssj.model.vo.Event;

public interface EventService {

	int insertEvent(Event e);

	int getListCount();

	ArrayList<Event> selectList();

	ArrayList<Event> selectEndList();


}
