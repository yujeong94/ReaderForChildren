package com.kh.ReaderForChildren.adminPage_ssj.model.service;

import java.util.ArrayList;

import com.kh.ReaderForChildren.member_ej.model.vo.Member;

public interface AdminPageService {

	ArrayList<Member> selectUserList();

	ArrayList<Member> selectUserSearch(String userId);

	Member selectUserInfo(String userId);

}
