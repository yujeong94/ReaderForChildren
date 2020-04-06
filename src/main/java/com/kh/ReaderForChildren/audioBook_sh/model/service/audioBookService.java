package com.kh.ReaderForChildren.audioBook_sh.model.service;

import java.util.ArrayList;

import com.kh.ReaderForChildren.audioBook_sh.model.vo.Book;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.BookImage;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.PageInfo;

public interface audioBookService {

	int getListCount();

	ArrayList<Book> selectbList(PageInfo pi);

	ArrayList<BookImage> selectbiList();

}
