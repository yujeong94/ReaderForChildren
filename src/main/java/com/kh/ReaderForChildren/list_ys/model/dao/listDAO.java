package com.kh.ReaderForChildren.list_ys.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ReaderForChildren.audioBook_sh.model.vo.OrderDetail;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.Shipping;
import com.kh.ReaderForChildren.audioBook_sh.model.vo.cartList;
import com.kh.ReaderForChildren.list_ys.model.vo.Rec;
import com.kh.ReaderForChildren.sponsor_ys.model.vo.PageInfo;

@Repository("liDAO")
public class listDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mypageMapper.getListCount");
	}

	public ArrayList<Rec> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectList",userId,rowBounds);
	}

	public int getshListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mypageMapper.getshListCount");
	}

	public ArrayList<Shipping> selectshList(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectshList", userId, rowBounds);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Shipping s) {
		return sqlSession.insert("mypageMapper.insertBoard", s);
	}

	public int deleteShipping(SqlSessionTemplate sqlSession, int sNo) {
		return sqlSession.update("mypageMapper.deleteShipping",sNo);
	}

	public int updateShipping(SqlSessionTemplate sqlSession, Shipping s) {
		return sqlSession.update("mypageMapper.updateShipping", s);
	}

	public Shipping selectShipping(SqlSessionTemplate sqlSession, int sNo) {
		return sqlSession.selectOne("mypageMapper.selectShipping", sNo);
	}

	public int getorListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mypageMapper.getorListCount");
	}

	public ArrayList<OrderDetail> selectorList(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mypageMapper.selectorList", userId, rowBounds);
		/*ArrayList<OrderDetail> list =  (ArrayList)sqlSession.selectList("mypageMapper.selectorList", null, rowBounds);
		return list;*/
	}

	public int deleteBuy(SqlSessionTemplate sqlSession, int orNo) {
		return sqlSession.update("mypageMapper.deleteBuy", orNo);
	}

	public int getcartListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mypageMapper.getcartListCount");
	}

	public ArrayList<cartList> selectcartList(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mypageMapper.selectcartList", userId, rowBounds);
	}

	public int deletecart(SqlSessionTemplate sqlSession, int cNo) {
		return sqlSession.update("mypageMapper.deletecart", cNo);
	}

	public int updaterL(SqlSessionTemplate sqlSession, int sNo) {
		return sqlSession.update("mypageMapper.updaterL", sNo);
	}

	public int updateLL(SqlSessionTemplate sqlSession, int sNo) {
		return sqlSession.update("mypageMapper.updateLL", sNo);
	}

	/*public ArrayList<OrderDetail> selectOrderDetail(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mypageMapper.selectOrderDetail", userId, rowBounds);
	}
*/

}
