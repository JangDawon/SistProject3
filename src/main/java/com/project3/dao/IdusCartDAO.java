package com.project3.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.project3.vo.IdusCartVO;
import com.project3.vo.IdusOrderVO;

public class IdusCartDAO extends DBConn{
	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	private static String namespace = "mapper.cart";
	
	/** 선택 삭제 **/
	public int getSelectDelete(String[] dellist) {
		return sqlSession.delete(namespace+".deletelist", dellist);
	}
	
	
	/** 장바구니 리스트 **/
	public ArrayList<IdusCartVO> getCartList(String uemail){
		List<IdusCartVO> list = sqlSession.selectList(namespace+".cartlist", uemail);
		return (ArrayList<IdusCartVO>)list;
	}
	
	public IdusCartVO getPurchaseList(String uemail, String pid){
		Map<String, String> param = new HashMap<String, String>();
		param.put("uemail", uemail);
		param.put("pid", pid);
		
		return sqlSession.selectOne(namespace+".purchaselist", param);
	}
	
	public int getCartInsert(String uemail, String pid, String opt1_qty, String opt2_qty, String opt3_qty) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("uemail", uemail);
		param.put("pid", pid);
		param.put("opt1_qty", opt1_qty);
		param.put("opt2_qty", opt2_qty);
		param.put("opt3_qty", opt3_qty);
		return sqlSession.insert(namespace+".cartinsert", param);
	}
	
//	public String getCartCp(String uemail) {
//		return sqlSession.selectOne(namespace+".cartcpselect", uemail);		
//	}
//	//sname
//	public String getOrderSname(String pid){
//		return sqlSession.selectOne(namespace+".ordersname", pid);
//	}
//	//ptitle
//	public String getOrderPtitle(String pid) {
//		return sqlSession.selectOne(namespace+".orderptitle", pid);
//	}
//	//opt1
//	public String getOrderOpt1(String pid) {
//		return sqlSession.selectOne(namespace+".orderopt1", pid);
//	}
//	//opt2
//	public String getOrderOpt2(String pid) {
//		return sqlSession.selectOne(namespace+".orderopt2", pid);
//	}
//	//opt3
//	public String getOrderOpt3(String pid) {
//		return sqlSession.selectOne(namespace+".orderopt3", pid);
//	}
//	//psfile1
//	public String getOrderPsfile1(String pid) {
//		return sqlSession.selectOne(namespace+".orderpsfile1", pid);
//	}
//	public int getInsert(IdusOrderVO vo) {
//		System.out.println(vo.getIdusOrderVOList().size());
//		int[] results= new int[vo.getIdusOrderVOList().size()];
//		int result=1;
//		for(int i=0; i<vo.getIdusOrderVOList().size(); i++) {
//			System.out.println(vo.getIdusOrderVOList().get(i));
//			results[i] = sqlSession.insert(namespace+".orderinsert", vo.getIdusOrderVOList().get(i));
//			result *= results[i];
//		}
//		return result;
//	}
} 






