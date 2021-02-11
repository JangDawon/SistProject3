package com.project3.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.project3.vo.IdusCartVO;

public class IdusCartDAO2 extends DBConn{
	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	private static String namespace = "mapper.cart2";
	
	/** 장바구니 리스트(지혜) **/
	public ArrayList<IdusCartVO> getCartList(String uemail){
		List<IdusCartVO> list = sqlSession.selectList(namespace+".cartlist", uemail);
		return (ArrayList<IdusCartVO>)list;
	}
	
	/** 장바구니 ajax 리스트(지혜) **/
	public ArrayList<IdusCartVO> getAjaxList(String uemail){
		List<IdusCartVO> list = sqlSession.selectList(namespace+".cartlist", uemail);
		return (ArrayList<IdusCartVO>)list;
	}
	
	/** 장바구니 중복 체크(지혜) **/
	public int getDupl(String uemail, String pid){
		Map<String, String> param = new HashMap<String, String>();
		param.put("uemail", uemail);
		param.put("pid", pid);
		return sqlSession.selectOne(namespace+".cart_dupl", param);
	}
	
	/** 장바구니 값 가져오기(지혜) **/
	public IdusCartVO getDuplValue(String uemail, String pid){
		Map<String, String> param = new HashMap<String, String>();
		param.put("uemail", uemail);
		param.put("pid", pid);
		return sqlSession.selectOne(namespace+".cart_dupl_value", param);
	}
	
	/** 장바구니 업데이트(지혜) **/
	public int getCartUpdate(String uemail, String pid, int opt1, int opt2, int opt3){
		Map<String, String> param = new HashMap<String, String>();
		param.put("uemail", uemail);
		param.put("pid", pid);
		param.put("opt1", String.valueOf(opt1));
		param.put("opt2", String.valueOf(opt2));
		param.put("opt3", String.valueOf(opt3));
		return sqlSession.update(namespace+".cart_update", param);
	}
	
	/** 장바구니 입력(지혜) **/
	public int getCartWrite(String uemail, String pid, int opt1_qty, int opt2_qty, int opt3_qty) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("uemail", uemail);
		param.put("pid", pid);
		param.put("opt1_qty", String.valueOf(opt1_qty));
		param.put("opt2_qty", String.valueOf(opt2_qty));
		param.put("opt3_qty", String.valueOf(opt3_qty));
		return sqlSession.insert(namespace+".cartwrite", param);
	}
	
	/** 장바구니 선택 삭제(지혜) **/
	public int getResultDelete(String[] dellist) {
		return sqlSession.delete(namespace+".delete", dellist);
	}
	
} 






