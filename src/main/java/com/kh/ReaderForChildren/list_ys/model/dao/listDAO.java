package com.kh.ReaderForChildren.list_ys.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ReaderForChildren.audioBook_sh.model.vo.OrderDetail;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.Shipping;
import com.kh.ReaderForChildren.list_ys.model.vo.Rec;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.PageInfo;

@Repository("liDAO")
public class listDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mypageMapper.getListCount");
	}

	public ArrayList<Rec> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectList",null,rowBounds);
	}

	public int getshListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mypageMapper.getshListCount");
	}

	public ArrayList<Shipping> selectshList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mypageMapper.selectshList", null, rowBounds);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Shipping s) {
		return sqlSession.insert("mypageMapper.insertBoard", s);
	}

	public int deleteShipping(SqlSessionTemplate sqlSession, int sNo) {
		return sqlSession.update("mypageMapper.deleteShipping",sNo);
	}

	public int updateShipping(SqlSessionTemplate sqlSession, Shipping s) {
		return sqlSession.update("mypageMapper.updateShipping", s);
	}

	public Shipping selectShipping(SqlSessionTemplate sqlSession, int sNo) {
		return sqlSession.selectOne("mypageMapper.selectShipping", sNo);
	}

	public int getorListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mypageMapper.getorListCount");
	}

	public ArrayList<OrderDetail> selectorList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
//		return (ArrayList)sqlSession.selectList("mypageMapper.selectorList", null, rowBounds);
		ArrayList<OrderDetail> list =  (ArrayList)sqlSession.selectList("mypageMapper.selectorList", null, rowBounds);
		System.out.println("dao단 : " + list);
		return list;
	}

}
