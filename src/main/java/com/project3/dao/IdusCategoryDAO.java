package com.project3.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.project3.vo.IdusProductVO;

public class IdusCategoryDAO  extends DBConn{
	@Autowired 
	private SqlSessionTemplate sqlSession;
	 
	private static String namespace = "mapper.product";
	
	public ArrayList<IdusProductVO> getAjaxList(String pcat, String sname){
		Map<String, String> param = new HashMap<String, String>();
		param.put("pcat", pcat);
		param.put("sname", sname);
		
		List<IdusProductVO> list = sqlSession.selectList(namespace + ".ajaxlist", param);
		return (ArrayList<IdusProductVO>)list;
	}
	
	public IdusProductVO getContent(String pid) {
		return sqlSession.selectOne(namespace + ".content", pid);
	}
	
	
	/*public int getCount(String keyword) {
		int result =0;
		try {
			String sql ="select count(*) from product where pkind like '%"+keyword +"%' or pname like '%" +keyword+ "%'";
			getStatement();			
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				result = rs.getInt(1);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return result;
	}*/
	
	
	/**
	 * �ֽ� ��Ʈ
	 */
	public ArrayList<IdusProductVO> getNewList(){
		List<IdusProductVO> list = sqlSession.selectList(namespace + ".newlist");
		return (ArrayList<IdusProductVO>)list;
	}
	
	/**
	 * �α� ��Ʈ
	 */
	public ArrayList<IdusProductVO> getBestProdList(){
		List<IdusProductVO> list = sqlSession.selectList(namespace+".bestprodlist");
		return (ArrayList<IdusProductVO>)list;
	}
	
	/**
	 * �ε��� �α��ǰ
	 */
	public ArrayList<IdusProductVO> getIndexNew(){
		List<IdusProductVO> list = sqlSession.selectList(namespace+".indexnew");
		return (ArrayList<IdusProductVO>)list;
	}
	
	/**
	 * �ε��� �ֽŻ�ǰ
	 */
	public ArrayList<IdusProductVO> getIndexBest(){
		List<IdusProductVO> list = sqlSession.selectList(namespace+".indexbest");
		return (ArrayList<IdusProductVO>)list;
	}
	
	/**
	 * �˻� ����Ʈ
	 */
	public ArrayList<IdusProductVO> getSearchList(String search, String sname){
		Map<String, String> param = new HashMap<String, String>();
		param.put("search", search);
		param.put("sname", sname);
		
		List<IdusProductVO> list = sqlSession.selectList(namespace + ".searchlist", param);
		return (ArrayList<IdusProductVO>)list;
	}
	
}
