package com.kh.ReaderForChildren.record_yj.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ReaderForChildren.record_yj.model.vo.RecBooth;

@Repository("reDAO")
public class RecordDAO {

	public int insertRecord(SqlSessionTemplate sqlSession, RecBooth rb) {
		return sqlSession.insert("recordMapper.insertRecord", rb);
	}

	public ArrayList<RecBooth> selectRecBooth(SqlSessionTemplate sqlSession, RecBooth r) {
		return (ArrayList)sqlSession.selectList("recordMapper.selectRecord", r);
	}

	public int selectDivision(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("recordMapper.selectDivision", userId);
	}

}
