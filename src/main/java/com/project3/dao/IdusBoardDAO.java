package com.project3.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.project3.vo.IdusBoardVO;

public class IdusBoardDAO extends DBConn{
	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	private static String namespace = "mapper.cs";
	
	/**
	 * CS 전체 리스트
	 */
	public ArrayList<IdusBoardVO> getList() {
		List<IdusBoardVO> list = sqlSession.selectList(namespace+".list");
		return (ArrayList<IdusBoardVO>)list;
	}
	
	/**
	 * CS 글쓰기
	 */
	public boolean getInsert(IdusBoardVO vo) {
		boolean result = false;
		int count = sqlSession.insert(namespace+".insert", vo);
		
		if(count != 0) result = true;

		return result;
	}
	
	/**
	 * CS 내용
	 */
	public IdusBoardVO getContent(String id) {
		return sqlSession.selectOne(namespace+".content", id);
	}
	
	/**
	 * CS 수정(파일 O)
	 */
	public boolean getUpdate(IdusBoardVO vo) {
		boolean result = false;
		
		int count = sqlSession.update(namespace+".update", vo);
		if(count != 0) result = true;
		return result;
	}
	
	/**
	 * CS 수정(파일 X)
	 */
	public boolean getUpdateNoFile(IdusBoardVO vo) {
		boolean result = false;
		int count = sqlSession.update(namespace+".updateNofile", vo);
		if(count != 0) result = true;
		return result;
	}
	
	/**
	 * CS 삭제
	 */
	public boolean getDelete(String id) {
		boolean result = false;
		
		int count = sqlSession.delete(namespace+".delete", id);
		if(count != 0) result = true;
		
		return result;
	}
	
	/**
	 * CS 조회수 업데이트
	 */
	public int getUpdateHits(String id) {
		return sqlSession.update(namespace+".bhits",id);
	}
	
	/**
	 * 총 게시물 갯수
	 */
	public int getCount() {
		return sqlSession.selectOne(namespace+".count");
	}
}
