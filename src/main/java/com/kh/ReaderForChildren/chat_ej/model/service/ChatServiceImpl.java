package com.kh.ReaderForChildren.chat_ej.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ReaderForChildren.chat_ej.model.dao.ChatDAO;
import com.kh.ReaderForChildren.chat_ej.model.vo.Chat;

@Service("cService")
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	private ChatDAO cDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertChat(Chat chatVo) {
		return cDAO.addVolSchedule(sqlSession, chatVo);
	}

}
