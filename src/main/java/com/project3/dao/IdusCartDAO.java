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
	
	public ArrayList<IdusCartVO> getPurchaseList(String uemail){
		List<IdusCartVO> list = sqlSession.selectList(namespace+".purchaselist", uemail);
		return (ArrayList<IdusCartVO>)list;
	}
	
	public int getCartInsert(String uemail, String pid, String opt1_qty, String opt2_qty, String opt3_qty) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("uemail", uemail);
		param.put("pid", pid);
		param.put("opt1_qty", opt1_qty);
		param.put("opt2_qty", opt2_qty);
		param.put("opt3_qty", opt3_qty);
		return sqlSession.insert(namespace+".cartinsert", param);
	}
	
	
} 






