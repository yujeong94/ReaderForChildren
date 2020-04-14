package com.kh.ReaderForChildren.audition_yj.model.service;

import java.util.ArrayList;

import com.kh.ReaderForChildren.audition_yj.model.vo.Audition;

public interface AuditionService {

	ArrayList<Audition> selectList();

	int insertAudition(Audition a);

	Audition selectAudition(int aNum); 

}
