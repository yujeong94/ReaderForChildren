package com.kh.ReaderForChildren.notice_sh.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("nDAO")
public class noticeDAO {

	public int getListCount(SqlSessionTemplate session) {
		return session.selectOne("noticeMapper.getListCount");
	}

}
