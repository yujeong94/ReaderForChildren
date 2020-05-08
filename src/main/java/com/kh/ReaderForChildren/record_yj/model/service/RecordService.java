package com.kh.ReaderForChildren.record_yj.model.service;

import java.util.ArrayList;

import com.kh.ReaderForChildren.record_yj.model.vo.RecBooth;

public interface RecordService {

	int insertRecord(RecBooth rb);

	ArrayList<RecBooth> selectRecBooth(RecBooth r);

	int selectDivision(String userId);

}
