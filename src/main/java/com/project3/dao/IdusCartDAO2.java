package com.project3.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.project3.vo.IdusCartVO;
import com.project3.vo.IdusMemberVO;
import com.project3.vo.IdusOrderVO;

public class IdusCartDAO2 extends DBConn{
	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	private static String namespace = "mapper.cart2";
	
	/** 주문 테이블에 값 입력 **/
	public int getInsertOrder(IdusOrderVO vo){
		return sqlSession.insert(namespace+".order", vo);
	}
	
	/** 주문 수량 **/
	public IdusOrderVO getQty(String cid){
		return sqlSession.selectOne(namespace+".qty", cid);
	}
	
	/** 주문 장바구니 리스트 **/
	public ArrayList<IdusCartVO> getCartList(String[] cid_list){
		List<IdusCartVO> list = sqlSession.selectList(namespace+".order_cart_list", cid_list);
		return (ArrayList<IdusCartVO>)list;
	}
	
	/** 주문자 정보(지혜) **/
	public IdusMemberVO getUserInfo(String uemail){
		return sqlSession.selectOne(namespace+".user_info", uemail);
	}
	
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
		param.put("method", "one");
		return sqlSession.selectOne(namespace+".cart_dupl_value", param);
	}
	
	/** 장바구니 값 가져오기(지혜) **/
	public IdusCartVO getDuplValue(String cid){
		Map<String, String> param = new HashMap<String, String>();
		param.put("cid", cid);
		param.put("method", "two");
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
	
	/** 장바구니 선택 삭제(지혜) **/
	public int getAjaxUpdate(String cid, String opt, String opt_qty) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("cid", cid);
		param.put("opt", opt);
		param.put("opt_qty", opt_qty);
		return sqlSession.update(namespace+".ajax_update", param);
	}
	
} 






