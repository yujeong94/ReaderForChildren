package com.kh.ReaderForChildren.member_ej.model.service;

import java.util.HashMap;

import com.kh.ReaderForChildren.member_ej.model.vo.Member;

public interface MemberService {

	Member memberLogin(Member m);

	int checkId(String userId);

	int updateMember(Member m);

	int memberPwdUpdate(HashMap<String, String> map);
  
	int insertMember(Member m);

	String findMemberId(Member m);

	int finMemberPwd(Member m);

	int updateTemPwd(HashMap<String, String> map);

	int shippingInsert(Member m);
}
