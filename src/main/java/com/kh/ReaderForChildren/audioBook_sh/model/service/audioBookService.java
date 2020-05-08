package com.kh.ReaderForChildren.audioBook_sh.model.service;

import java.util.ArrayList;

import com.kh.ReaderForChildren.audioBook_sh.model.vo.AudioBook;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.AudioFile;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.Book;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.BookImage;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.Cart;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.OrderDetail;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.PageInfo;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.SearchCondition;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.Shipping;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.cartList;

public interface audioBookService {

	int getListCount();

	ArrayList<Book> selectbList(PageInfo pi);

	ArrayList<BookImage> selectbiList();

	ArrayList<AudioBook> selectabList();
	
	int getSearchListCount(SearchCondition sc);

	ArrayList<Book> selectSearchbList(PageInfo pi, SearchCondition sc);
	
	Book selectBook(int bkCode);

	ArrayList<AudioBook> selectAudioBook(int bkCode);

	BookImage selectBookImage(int bkCode);

	ArrayList<AudioFile> selectAudioFile(int bkCode);
	
	int insertAudioBook(Book b, BookImage bi, AudioBook abF, AudioBook abM, AudioFile afF, AudioFile afM);

	ArrayList<Shipping> shipAddList(String userId);

	int addShipAddress(Shipping s);

	int selectDefaultSA(String userId);

	int orderInsert(OrderDetail order);

	int deleteProduct(int bkCode);

	int cartInsert(Cart c);

	int updateProduct(Book b, BookImage bi, AudioBook abF, AudioBook abM, AudioFile afF, AudioFile afM);

	ArrayList<BookImage> selectBestList();

	ArrayList<cartList> selectcartList(String[] arr);

}
