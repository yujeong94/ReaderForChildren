package com.kh.ReaderForChildren.audition_yj.model.service;

import java.util.ArrayList;

import com.kh.ReaderForChildren.audition_yj.model.vo.Audition;
import com.kh.ReaderForChildren.audition_yj.model.vo.Career;
import com.kh.ReaderForChildren.audition_yj.model.vo.Reader;
import com.kh.ReaderForChildren.member_ej.model.vo.Member;

public interface AuditionService {

	ArrayList<Audition> selectList();

	int insertAudition(Audition a);

	Audition selectAudition(int aNum);

	int updateAudition(Audition a);

	int deleteAudition(int aNum);

	int insertApply(Reader r, ArrayList<Career> cArr);

	Reader selectReader(String userId);

	ArrayList<Career> selectCareer(String userId);

	int readerCheck(String userId);

	int updateApply(Reader r, ArrayList<Career> cArr);

	int deleteApply(String userId);

	int selectPwd(Member m); 

}
