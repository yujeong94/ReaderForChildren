package com.kh.ReaderForChildren.audition_yj.model.service;

import java.util.ArrayList;

import com.kh.ReaderForChildren.audition_yj.model.vo.Audition;
import com.kh.ReaderForChildren.audition_yj.model.vo.Career;
import com.kh.ReaderForChildren.audition_yj.model.vo.Reader;

public interface AuditionService {

	ArrayList<Audition> selectList();

	int insertAudition(Audition a);

	Audition selectAudition(int aNum);

	int updateAudition(Audition a);

	int deleteAudition(int aNum);

	int insertApply(Reader r, ArrayList<Career> cArr); 

}
