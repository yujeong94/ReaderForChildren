package com.kh.ReaderForChildren.chat_ej.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ReaderForChildren.chat_ej.model.vo.Chat;

@Repository("cDAO")
public class ChatDAO {

	public int addVolSchedule(SqlSessionTemplate sqlSession, Chat chatVo) {
		return sqlSession.insert("chatMapper.insertFirstChat", chatVo);
	}

}
