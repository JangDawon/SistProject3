package com.project3.dao;

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
	
	
	/** 장바구니 리스트 **/
	public ArrayList<IdusCartVO> getCartList(String uemail){
		List<IdusCartVO> list = sqlSession.selectList(namespace+".cartlist", uemail);
		return (ArrayList<IdusCartVO>)list;
	}
	
	
	/** 장바구니 수정 **/
	/* public int getCartUpdate(String cid, String p_qty, String p_price) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("cid", cid);
		param.put("p_qty", p_qty);
		param.put("p_price", p_price);
		
		return sqlSession.update(namespace+".cartupdate", param);
	}
	
	public int getCartDelete(String cid) {
		return sqlSession.delete(namespace+".cartdelete", cid);
	}
	
    public int sumMoney(String uemail) {
        return sqlSession.selectOne(namespace+".sumMoney", uemail); 
    }
 
    public int countCart(String uemail, int pid) {
        return 0;
    } */
	
} 






