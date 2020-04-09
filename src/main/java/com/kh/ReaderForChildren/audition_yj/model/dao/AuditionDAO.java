package com.kh.ReaderForChildren.audition_yj.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ReaderForChildren.audition_yj.model.vo.Audition;

@Repository("auDAO")
public class AuditionDAO {

	public ArrayList<Audition> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("auditionMapper.selectList");
	}

}
