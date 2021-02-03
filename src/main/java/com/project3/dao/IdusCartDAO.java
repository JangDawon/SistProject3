package com.project3.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.project3.vo.IdusCartVO;

public class IdusCartDAO extends DBConn{
	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	private static String namespace = "mapper.cart";
	
	/** 선택 삭제 **/
	public int getSelectDelete(String[] dellist) {
		return sqlSession.delete(namespace+".deletelist", dellist);
	}
	
	
	/** 장바구니 넣기 **/
	public boolean getCartInsert(IdusCartVO vo) {
		boolean result = false;
		int value = sqlSession.insert(namespace+".cartinsert", vo);
		if(value != 0) result = true;
		return result; 
	}
	
	/** 장바구니 리스트 **/
	public List<IdusCartVO> getCartList(String uemail){
			return sqlSession.selectList(namespace+".cartlist", uemail);
	}
	
	/** 장바구니 금액 합계 **/
    public int sumMoney(String uemail) {
        return sqlSession.selectOne(namespace+".sumMoney", uemail);
    }
    
    /** 장바구니 동일한 상품 레코드 확인 **/
    public int countCart(String pid, String uemail) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("pid", pid);
        map.put("userId", uemail);
        return sqlSession.selectOne(namespace+".countCart", map);
    }
    
    /** 장바구니 상품수량 변경 **/
    public void updateCart(IdusCartVO vo) {
        sqlSession.update(namespace+".sumCart", vo);
    }
	
	
	/**
	 * InsertCart : 확인 후 장바구니에 넣기
	 */
	/* public boolean getInsertCart(IdusCartVO vo) {
		boolean result = false;
		
		try {
			String sql = "merge into idus_cart using dual on (pid = ? and cart_id = ?)"
					+ " when matched then update set prod_qty = prod_qty + ?"
					+ " when not matched then insert (cart_id, uemail, pid, prod_name, prod_qty, prod_opt, prod_price) "
					+ " values ('c_'||sequ_cart.nextval, ?, ?, ?, ?, ?, ?)";
			
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
		
		return result;
		//return sqlSession.insert(namespace+".insertcart", vo);
	} */
	

	/**
	 * Select : 전체 리스트
	 */
	public ArrayList<IdusCartVO> getList() {
		ArrayList<IdusCartVO> list = new ArrayList<IdusCartVO>();
		
		try {
			String sql = "select cart_id, uemail, pid, prod_name, prod_qty, prod_opt, prod_price"
							+ " from idus_cart order by cart_id desc";
			
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






