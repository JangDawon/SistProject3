package com.project3.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.project3.vo.IdusMemberVO;
import com.project3.vo.IdusSessionVO;

public class IdusMemberDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace="mapper.member";
	
	public boolean getInsert(IdusMemberVO vo) {
		boolean result = false;
		int value = sqlSession.insert(namespace+".join", vo);
		if(value != 0) result = true;
		return result; 
	}
	
	public IdusSessionVO getLogin(IdusMemberVO vo) {
		return sqlSession.selectOne(namespace+".login", vo);
	}
}
