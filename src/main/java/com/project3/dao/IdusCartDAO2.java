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
	
	/** ��ٱ��� ����Ʈ **/
	public ArrayList<IdusCartVO> getCartList(String uemail){
		List<IdusCartVO> list = sqlSession.selectList(namespace+".cartlist", uemail);
		return (ArrayList<IdusCartVO>)list;
	}
	
	/** ��ٱ��� ����Ʈ **/
	public ArrayList<IdusCartVO> getAjaxList(String uemail){
		List<IdusCartVO> list = sqlSession.selectList(namespace+".cartlist", uemail);
		return (ArrayList<IdusCartVO>)list;
	}
	
	/** ��ٱ��� �ߺ� üũ **/
	public int getDupl(String uemail, String pid){
		Map<String, String> param = new HashMap<String, String>();
		param.put("uemail", uemail);
		param.put("pid", pid);
		return sqlSession.selectOne(namespace+".cart_dupl", param);
	}
	
	/** ��ٱ��� �� �������� **/
	public IdusCartVO getDuplValue(String uemail, String pid){
		Map<String, String> param = new HashMap<String, String>();
		param.put("uemail", uemail);
		param.put("pid", pid);
		return sqlSession.selectOne(namespace+".cart_dupl_value", param);
	}
	
	/** ��ٱ��� ������Ʈ **/
	public int getCartUpdate(String uemail, String pid, int opt1, int opt2, int opt3){
		Map<String, String> param = new HashMap<String, String>();
		param.put("uemail", uemail);
		param.put("pid", pid);
		param.put("opt1", String.valueOf(opt1));
		param.put("opt2", String.valueOf(opt2));
		param.put("opt3", String.valueOf(opt3));
		return sqlSession.update(namespace+".cart_update", param);
	}
	
	/** ��ٱ��� �Է� **/
	public int getCartWrite(String uemail, String pid, String opt1_qty, String opt2_qty, String opt3_qty) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("uemail", uemail);
		param.put("pid", pid);
		param.put("opt1_qty", opt1_qty);
		param.put("opt2_qty", opt2_qty);
		param.put("opt3_qty", opt3_qty);
		return sqlSession.insert(namespace+".cartwrite", param);
	}
} 






