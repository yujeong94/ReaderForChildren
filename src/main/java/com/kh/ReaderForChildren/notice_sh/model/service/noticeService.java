package com.kh.ReaderForChildren.notice_sh.model.service;

import java.util.ArrayList;

import com.kh.ReaderForChildren.notice_sh.model.vo.Notice;
import com.kh.ReaderForChildren.notice_sh.model.vo.PageInfo;
import com.kh.ReaderForChildren.notice_sh.model.vo.SearchCondition;

public interface noticeService {

	int getListCount();

	ArrayList<Notice> selectList(PageInfo pi);

	int getSearchListCount(SearchCondition sc);

	ArrayList<Notice> selectSearchList(PageInfo pi, SearchCondition sc);

}
