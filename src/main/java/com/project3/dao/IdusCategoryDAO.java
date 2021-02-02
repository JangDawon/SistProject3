package com.project3.dao;

import java.util.ArrayList;
import java.util.List;

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
	
}
