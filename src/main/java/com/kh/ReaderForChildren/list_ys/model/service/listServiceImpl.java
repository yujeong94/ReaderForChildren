package com.kh.ReaderForChildren.list_ys.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ReaderForChildren.audioBook_sh.model.vo.Shipping;
import com.kh.ReaderForChildren.list_ys.model.dao.listDAO;
import com.kh.ReaderForChildren.list_ys.model.vo.Rec;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.PageInfo;

@Service("liService")
public class listServiceImpl implements listService {

	@Autowired
	private listDAO liDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		return liDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Rec> selectList(PageInfo pi) {
		return liDAO.selectList(sqlSession, pi);
	}

	@Override
	public int getshListCount() {
		return liDAO.getshListCount(sqlSession);
	}

	@Override
	public ArrayList<Shipping> selectshList(PageInfo pi) {
		return liDAO.selectshList(sqlSession, pi);
	}

	@Override
	public int insertBoard(Shipping s) {
		return liDAO.insertBoard(sqlSession, s);
	}

	@Override
	public int deleteShipping(int sNo) {
		return liDAO.deleteShipping(sqlSession, sNo);
	}

	@Override
	public int updateShipping(Shipping s) {
		return liDAO.updateShipping(sqlSession, s);
	}

	@Override
	public Shipping selectShipping(int sNo) {
		
		
		return liDAO.selectShipping(sqlSession, sNo);
	}

}
