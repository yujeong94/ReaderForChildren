package com.kh.ReaderForChildren.list_ys.model.service;

import java.util.ArrayList;

import com.kh.ReaderForChildren.audioBook_sh.model.vo.Shipping;
import com.kh.ReaderForChildren.list_ys.model.vo.Rec;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.PageInfo;

public interface listService {

	int getListCount();

	ArrayList<Rec> selectList(PageInfo pi);

	int getshListCount();

	ArrayList<Shipping> selectshList(PageInfo pi);

	int insertBoard(Shipping s);

	int deleteShipping(int sNo);

	int updateShipping(Shipping s);

	Shipping selectShipping(int sNo);

}
