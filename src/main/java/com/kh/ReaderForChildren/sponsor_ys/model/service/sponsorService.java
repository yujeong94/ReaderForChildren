package com.kh.ReaderForChildren.sponsor_ys.model.service;

import java.util.ArrayList;

import com.kh.ReaderForChildren.member_ej.model.vo.Member;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.PageInfo;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.Sponsor;


public interface sponsorService {

	int getListCount();

	ArrayList<Sponsor> selectspList(PageInfo pi);

	int spupdateMember(Member m);
	

}