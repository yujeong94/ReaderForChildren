package com.kh.ReaderForChildren.list_ys.model.service;

import java.util.ArrayList;

import com.kh.ReaderForChildren.audioBook_sh.model.vo.OrderDetail;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.Shipping;
import com.kh.ReaderForChildren.list_ys.model.vo.Rec;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.PageInfo;

public interface listService {

	int getListCount();

	ArrayList<Rec> selectList(PageInfo pi);

	int getshListCount();

	ArrayList<Shipping> selectshList(PageInfo pi, String userId);

	int insertBoard(Shipping s);

	int deleteShipping(int sNo);

	int updateShipping(Shipping s);

	Shipping selectShipping(int sNo);

	int getorListCount();

	ArrayList<OrderDetail> selectorList(PageInfo pi);

	int deleteBuy(int orNo);

	int getcartListCount();

	ArrayList<OrderDetail> selectcartList(PageInfo pi);

	int deletecart(int cNo);

	int updaterL(int sNo);


}
