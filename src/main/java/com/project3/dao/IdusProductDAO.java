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
	 * ��ǰ ��ü ��
	 */
	public int getCount() {
		return sqlSession.selectOne(namespace+".count");
	}
	
	/**
	 * ��ǰ ��ü ����Ʈ
	 */
	public ArrayList<IdusProductVO> getList(){
		List<IdusProductVO> list = sqlSession.selectList(namespace + ".list");
		return (ArrayList<IdusProductVO>)list;
	}
	
	/**
	 * ��ǰ ��ü ����Ʈ
	 */
	public ArrayList<IdusProductVO> getList(int start, int end){
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		
		List<IdusProductVO> list = sqlSession.selectList(namespace + ".plist", param);
		return (ArrayList<IdusProductVO>)list;
	}
	
	/**
	 * ��ǰ ���
	 */
	public int getInsert(IdusProductVO vo) {
		return sqlSession.insert(namespace+".insert", vo);
	}
	
	/**
	 * ��ǰ �� ����
	 */
	public IdusProductVO getContent(String id) {
		return sqlSession.selectOne(namespace + ".content", id);
	}
	
	/**
	 * ��ǰ ������Ʈ
	 */
	public int getUpdate(IdusProductVO vo) {
		return sqlSession.update(namespace + ".update", vo);
	}
	
	/**
	 * ��ǰ ��ü ����
	 */
	public int getDeleteAll() {
		return sqlSession.delete(namespace +".deleteAll");
	}
	
	/**
	 * ��ǰ ���� ����
	 */
	public int getDeleteSelect(String[] del_list) {
		return sqlSession.delete(namespace+".deleteSelect", del_list);
	} 
	
	
}
