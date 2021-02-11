package com.project3.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

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
} 






