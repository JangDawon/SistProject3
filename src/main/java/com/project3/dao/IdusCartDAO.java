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
	
	/** 구매하기 리스트 **/
	public IdusCartVO getPurchaseList(String uemail, String pid){
		Map<String, String> param = new HashMap<String, String>();
		param.put("uemail", uemail);
		param.put("pid", pid);
		
		return sqlSession.selectOne(namespace+".purchaselist", param);
	}
	
	/** 장바구니 담기 **/
	public int getCartInsert(String uemail, String pid, int opt1_qty, int opt2_qty, int opt3_qty) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("uemail", uemail);
		param.put("pid", pid);
		param.put("opt1_qty", String.valueOf(opt1_qty));
		param.put("opt2_qty", String.valueOf(opt2_qty));
		param.put("opt3_qty", String.valueOf(opt3_qty));
		return sqlSession.insert(namespace+".cartinsert", param);
	}
	
	public int getListUpdate(String cid, String opt, String opt_qty) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("cid", cid);
		param.put("opt", opt);
		param.put("opt_qty", opt_qty);
		return sqlSession.update(namespace+".listupdate", param);
	}
	
} 






