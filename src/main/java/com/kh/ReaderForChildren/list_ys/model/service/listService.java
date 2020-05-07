package com.kh.ReaderForChildren.list_ys.model.service;

import java.util.ArrayList;

import com.kh.ReaderForChildren.audioBook_sh.model.vo.OrderDetail;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.Shipping;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.cartList;
import com.kh.ReaderForChildren.list_ys.model.vo.Rec;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.PageInfo;

public interface listService {

	int getListCount();

	ArrayList<Rec> selectList(PageInfo pi, String userId);

	int getshListCount();

	ArrayList<Shipping> selectshList(PageInfo pi, String userId);

	int insertBoard(Shipping s);

	int deleteShipping(int sNo);

	int updateShipping(Shipping s);

	Shipping selectShipping(int sNo);

	int getorListCount();

	ArrayList<OrderDetail> selectorList(PageInfo pi, String userId);

	int deleteBuy(int orNo);

	int getcartListCount();

	ArrayList<cartList> selectcartList(PageInfo pi, String userId);

	int deletecart(int cNo);

	int updaterL(int sNo);

	ArrayList<OrderDetail> selectOrderDetail(PageInfo pi, String userId);


}
