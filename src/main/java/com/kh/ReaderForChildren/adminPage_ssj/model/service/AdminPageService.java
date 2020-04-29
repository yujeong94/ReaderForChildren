package com.kh.ReaderForChildren.adminPage_ssj.model.service;

import java.util.ArrayList;

import com.kh.ReaderForChildren.adminPage_ssj.model.vo.Admin;
import com.kh.ReaderForChildren.adminPage_ssj.model.vo.AdminOrderList;
import com.kh.ReaderForChildren.audition_yj.model.vo.Audition;
import com.kh.ReaderForChildren.audition_yj.model.vo.Career;
import com.kh.ReaderForChildren.audition_yj.model.vo.Reader;
import com.kh.ReaderForChildren.event_ssj.model.vo.Event;
import com.kh.ReaderForChildren.member_ej.model.vo.Member;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.Support;

public interface AdminPageService {

	ArrayList<Member> selectUserList();

	ArrayList<Member> selectUserSearch(String userId);

	Member selectUserInfo(String userId);

	Admin adminLogin(Admin a);

	ArrayList<Event> eventWinnerList();

	ArrayList<Event> eventIngList();

	ArrayList<Event> eventEndList();

	ArrayList<Support> selectSponsorList();

	ArrayList<Support> sponsorSearch(String spName);

	ArrayList<Reader> selectAuditionList();

	ArrayList<Reader> selectCategoryAuditionList(String selectbox);

	Reader selectReader(String userId);

	ArrayList<Career> selectCareer(String userId);

	Audition selectAudition(int getaNum);

	Member selectUser(String userId);

	int resultPassReaderTable(String userId);

	int resultPassMemberTable(String userId);

	int resultFailReaderTable(String userId);

	int resultBanReaderTable(String userId);

	int resultBanMemberTable(String userId);

	ArrayList<Support> selectUserSupport(String userId);

	ArrayList<AdminOrderList> buyerListView();

}
