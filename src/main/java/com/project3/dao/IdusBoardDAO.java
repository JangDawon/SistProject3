package com.project3.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.project3.vo.IdusBoardVO;
import com.project3.vo.IdusReplyVO;

public class IdusBoardDAO extends DBConn{
	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	private static String namespace = "mapper.cs";
	
	/**
	 * CS 전체 리스트(페이지)
	 */
	public ArrayList<IdusBoardVO> getList(int start, int end){
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		
		List<IdusBoardVO> list = sqlSession.selectList(namespace + ".plist", param);
		return (ArrayList<IdusBoardVO>)list;
		
	}
	
	/**
	 * CS 전체 리스트 : ajax
	 */
	public ArrayList<IdusBoardVO> getList(String sname, String svalue, int start, int end){
		Map<String, String> param = new HashMap<String, String>();
		param.put("sname", sname);
		param.put("svalue", svalue);
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		
		List<IdusBoardVO> list = sqlSession.selectList(namespace + ".plistajax", param);
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
	 * CS 삭제
	 */
	public int getDelete(String id) {
		return sqlSession.delete(namespace+".delete", id);
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
	
	/**
	 * 총 게시물 갯수 : ajax
	 */
	public int getCount(String sname, String svalue) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("sname", sname);
		param.put("svalue", svalue);
		
		return sqlSession.selectOne(namespace+".countajax", param);
	}
	
	/**
	 * 댓글 쓰기
	 */
	public int getReplyWrite(IdusReplyVO rvo) {
		return sqlSession.insert(namespace+".reply_write", rvo);
	}
	
	/**
	 * 댓글 전체 리스트
	 */
	public ArrayList<IdusReplyVO> getReplyList(String bid){
		List<IdusReplyVO> list = sqlSession.selectList(namespace+".reply_list", bid);
		return (ArrayList<IdusReplyVO>)list;
	}
	
	/**
	 * 댓글 수정
	 */
	public int getReplyUpdate(String rid, String rcontent) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("rid", rid);
		param.put("rcontent", rcontent);
		
		return sqlSession.update(namespace+".reply_update", param);
	}
	
	/**
	 * 댓글 삭제
	 */
	public int getReplyDelete(String rid) {
		return sqlSession.update(namespace+".reply_delete", rid);
	}
}
