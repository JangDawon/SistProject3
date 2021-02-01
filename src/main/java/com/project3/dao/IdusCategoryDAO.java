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
	
	public ArrayList<IdusProductVO> getList(String pcat){
		List<IdusProductVO> list = sqlSession.selectList(namespace + ".categorylist", pcat);
		return (ArrayList<IdusProductVO>)list;
		
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
	 * 최신 차트
	 */
	public ArrayList<IdusProductVO> getNewList(){
		List<IdusProductVO> list = sqlSession.selectList(namespace + ".newlist");
		return (ArrayList<IdusProductVO>)list;
	}
	
	/**
	 * 인기 차트
	 */
	public ArrayList<IdusProductVO> getBestList(String pcat){
		List<IdusProductVO> list = sqlSession.selectList(namespace + ".bestlist", pcat);
		return (ArrayList<IdusProductVO>)list;
	}
	
	
	/**
	 * 상품 최신차트
	 */
	/* public ArrayList<IdusProductVO> getNewList(int start, int end){
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		
		List<IdusProductVO> list = sqlSession.selectList(namespace + ".newlist", param);
		return (ArrayList<IdusProductVO>)list;
	} */
	
	/**
	 * 상품 인기차트
	 */
	/* public ArrayList<IdusProductVO> getBestList(int start, int end){
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		
		List<IdusProductVO> list = sqlSession.selectList(namespace + ".bestlist", param);
		return (ArrayList<IdusProductVO>)list;
	} */
	
}
