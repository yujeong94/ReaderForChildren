package com.kh.ReaderForChildren.event_ssj.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ReaderForChildren.event_ssj.model.dao.EventDAO;

@Service("eService")
public class EventImpl implements EventService {
	
	@Autowired
	private EventDAO eDAO;
	
}
