package com.kh.ReaderForChildren.list_ys.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ReaderForChildren.audioBook_sh.model.vo.OrderDetail;
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
	public ArrayList<Rec> selectList(PageInfo pi, String userId) {
		return liDAO.selectList(sqlSession, pi, userId);
	}

	@Override
	public int getshListCount() {
		return liDAO.getshListCount(sqlSession);
	}

	@Override
	public ArrayList<Shipping> selectshList(PageInfo pi, String userId) {
		return liDAO.selectshList(sqlSession, pi, userId);
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

	@Override
	public int getorListCount() {
		return liDAO.getorListCount(sqlSession);
	}

	@Override
	public ArrayList<OrderDetail> selectorList(PageInfo pi, String userId) {
		return liDAO.selectorList(sqlSession, pi, userId);
	}

	@Override
	public int deleteBuy(int orNo) {
		return liDAO.deleteBuy(sqlSession, orNo);
	}

	@Override
	public int getcartListCount() {
		return liDAO.getcartListCount(sqlSession);
	}

	@Override
	public ArrayList<OrderDetail> selectcartList(PageInfo pi, String userId) {
		return liDAO.selectcartList(sqlSession, pi, userId);
	}

	@Override
	public int deletecart(int cNo) {
		return liDAO.deletecart(sqlSession, cNo);
	}

	@Override
	public int updaterL(int sNo) {
		int result2 = liDAO.updateLL(sqlSession, sNo); 
		int result = liDAO.updaterL(sqlSession, sNo);
		int sum =0;
		if(result>0 && result2>0) {
			sum = 1;
		}else {
			sum = -1;
		}
		return sum;
	}

	@Override
	public ArrayList<OrderDetail> selectOrderDetail(PageInfo pi, String userId) {
		return liDAO.selectOrderDetail(sqlSession, pi, userId);
	}

	
	

}
