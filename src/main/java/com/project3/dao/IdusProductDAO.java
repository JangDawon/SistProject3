package com.project3.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.project3.vo.IdusProductVO;

public class IdusProductDAO extends DBConn{
	@Autowired 
	private SqlSessionTemplate sqlSession;
	 
	private static String namespace = "mapper.product";
	 
	/**
	 * 상품 전체 수
	 */
	public int getCount() {
		return sqlSession.selectOne(namespace+".count");
	}
	
	/**
	 * 상품 전체 리스트
	 */
	public ArrayList<IdusProductVO> getList(){
		List<IdusProductVO> list = sqlSession.selectList(namespace + ".list");
		return (ArrayList<IdusProductVO>)list;
	}
	
	/**
	 * 상품 전체 리스트
	 */
	public ArrayList<IdusProductVO> getList(int start, int end){
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		
		List<IdusProductVO> list = sqlSession.selectList(namespace + ".plist", param);
		return (ArrayList<IdusProductVO>)list;
	}
	
	/**
	 * 상품 등록
	 */
	public int getInsert(IdusProductVO vo) {
		System.out.println("파일이름" + vo.getPfile1());
		System.out.println(vo.getPsfile1());
		return sqlSession.insert(namespace+".insert", vo);
	}
	
	/**
	 * 상품 상세 정보
	 */
	public IdusProductVO getContent(String id) {
		return sqlSession.selectOne(namespace + ".content", id);
	}
	
	/**
	 * 상품 업데이트
	 */
	/*
	 * public int getUpdate(IdusProductVO vo) { }
	 */
	
	/**
	 * 상품 전체 삭제
	 */
	public boolean getDeleteAll() {
		boolean result = false;
		int count = sqlSession.delete(namespace +".deleteAll");
		if(count != 0) result = true;
		return result;
	}
}
