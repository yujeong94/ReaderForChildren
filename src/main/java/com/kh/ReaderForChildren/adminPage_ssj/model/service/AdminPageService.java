package com.kh.ReaderForChildren.adminPage_ssj.model.service;

import java.util.ArrayList;

import com.kh.ReaderForChildren.adminPage_ssj.model.vo.Admin;
import com.kh.ReaderForChildren.event_ssj.model.vo.Event;
import com.kh.ReaderForChildren.member_ej.model.vo.Member;

public interface AdminPageService {

	ArrayList<Member> selectUserList();

	ArrayList<Member> selectUserSearch(String userId);

	Member selectUserInfo(String userId);

	Admin adminLogin(Admin a);

	ArrayList<Event> eventWinnerList();

	ArrayList<Event> eventIngList();

	ArrayList<Event> eventEndList();

}
