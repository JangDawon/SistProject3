package com.project3.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.project3.vo.IdusProductVO;
import com.project3.vo.IdusWishVO;

public class IdusWishDAO extends DBConn{ 
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.wish";

	public int getWishInsert(String uemail, String pid) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("uemail", uemail);
		param.put("pid", pid);
		return sqlSession.insert(namespace+".wishinsert", param);
	}
	
	public int getWishDelete(String uemail, String pid) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("uemail", uemail);
		param.put("pid", pid);
		return sqlSession.insert(namespace+".wishdelete", param);
	}
	
	public ArrayList<IdusWishVO> getWishList(String uemail){
		List<IdusWishVO> list = sqlSession.selectList(namespace+".wishlist", uemail);
		return (ArrayList<IdusWishVO>)list;
	}
	
	public ArrayList<IdusWishVO> getWishList(){
		List<IdusWishVO> list = sqlSession.selectList(namespace+".wishlist2");
		return (ArrayList<IdusWishVO>)list;
	}
	
} 






