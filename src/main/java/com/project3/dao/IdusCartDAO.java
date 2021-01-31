package com.project3.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.project3.vo.IdusCartVO;

public class IdusCartDAO extends DBConn{
	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	private static String namespace = "mapper.cart";
	
	/**
	 * 선택 삭제
	 */
	public int getSelectDelete(String[] dellist) {
		return sqlSession.delete(namespace+".deletelist", dellist);
	}
	
	
	/**
	 * Insert : 장바구니 넣기
	 */
	public boolean getInsert(IdusCartVO vo) {
		boolean result = false;
		int value = sqlSession.insert(namespace+".cart", vo);
		if(value != 0) result = true;
		return result; 
		
		/* try {
			String sql = "insert into idus_cart values('c_'||sequ_cart.nextval,?,?,?,?,?,?)";
			
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getUemail());
			pstmt.setString(2, vo.getPid());
			pstmt.setString(3, vo.getProd_name());
			pstmt.setInt(4, vo.getProd_qty());
			pstmt.setString(5, vo.getProd_opt());
			pstmt.setInt(6, vo.getProd_price());
			
			int val = pstmt.executeUpdate();
			if(val != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result; */
	}
	
	/**
	 * Select : 전체 리스트
	 */
	public ArrayList<IdusCartVO> getList() {
		ArrayList<IdusCartVO> list = new ArrayList<IdusCartVO>();
		
		try {
			String sql = "select cart_id, uemail, pid, prod_name, prod_qty, prod_opt, prod_price"
							+ " from idus_cart order by cart_id desc;";
			
			getPreparedStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				IdusCartVO vo = new IdusCartVO();
				vo.setCard_id(rs.getString(1));
				vo.setUemail(rs.getString(2));
				vo.setPid(rs.getString(3));
				vo.setProd_name(rs.getString(4));
				vo.setProd_qty(rs.getInt(5));
				vo.setProd_opt(rs.getString(6));
				vo.setProd_price(rs.getInt(7));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/**
	 * Update : 수량 업데이트
	 */
	public boolean getUpdate(IdusCartVO vo) {
		boolean result = false;
		
		try {
			String sql = " update idus_cart set prod_qty=? where cart_id=?";
			
			getPreparedStatement(sql);
			pstmt.setInt(1, vo.getProd_qty());
			pstmt.setString(2, vo.getCard_id());
			
			int val = pstmt.executeUpdate();
			if(val != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * Delete : 삭제
	 */
	public boolean getDelete(String cart_id) {
		boolean result = false;
		
		try {
			String sql = "delete from idus_cart where cart_id=?";
			
			getPreparedStatement(sql);
			pstmt.setString(1, cart_id);
			
			int val = pstmt.executeUpdate();
			if(val != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
} 






