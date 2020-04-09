package com.kh.ReaderForChildren.member_ej.model.service;

import com.kh.ReaderForChildren.member_ej.model.vo.Member;

public interface MemberService {

	Member memberLogin(Member m);

	int checkId(String userId);

	int updateMember(Member m);

}
