
package com.project3.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.project3.vo.IdusOrderVO;
import com.project3.vo.IdusProductVO;
import com.project3.vo.IdusMemberVO;
import com.project3.vo.IdusReviewVO;
import com.project3.vo.IdusSessionVO;

public class IdusMemberDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	private static String namespace = "mapper.member";

	public boolean getInsert(IdusMemberVO vo) {
		boolean result = false;
		int value = sqlSession.insert(namespace + ".join", vo);
		if (value != 0)
			result = true;
		return result;
	}

	public IdusSessionVO getLogin(IdusMemberVO vo) {
		return sqlSession.selectOne(namespace + ".login", vo);
	}

	public boolean getUpdate(IdusSessionVO vo) {
		boolean result = false;
		int value = sqlSession.update(namespace + ".update", vo);
		if (value != 0) {
			result = true;
		} else {
		}
		return result;
	}

	public int getCount() {
		return sqlSession.selectOne(namespace + ".count");
	}

	public ArrayList<IdusMemberVO> getList(int start, int end) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));

		List<IdusMemberVO> list = sqlSession.selectList(namespace + ".list", param);

		return (ArrayList<IdusMemberVO>) list;
	}

	public int getResultDelete() {
		return sqlSession.delete(namespace + ".deleteAll");
	}

	public int getResultDelete(String[] userlist) {
		return sqlSession.delete(namespace + ".deleteSelect", userlist);
	}

	public int getEmailCheck(String email) {
		return sqlSession.selectOne(namespace + ".emailCheck", email);
	}

	public ArrayList<IdusMemberVO> getLoginCheck(String hp) {

		List<IdusMemberVO> list = sqlSession.selectList(namespace + ".checklist", hp);
		return (ArrayList<IdusMemberVO>) list;
	}

	public IdusMemberVO getContent(String email) {
		return sqlSession.selectOne(namespace + ".content", email);
	}

	public IdusMemberVO getUserContent(String uid) {
		return sqlSession.selectOne(namespace + ".userContent", uid);
	}

	/** 프로필 사진 변경 후 다시 가져오기 **/
	public String getPsfile(String uemail) {
		return sqlSession.selectOne(namespace + ".psfile", uemail);
	}

	public boolean getDelete(String uemail) {
		boolean result = false;
		int val = sqlSession.delete(namespace + ".delete", uemail);
		if (val != 0)
			result = true;
		return result;
	}
	public ArrayList<IdusOrderVO> getorderList(int start, int end,String uemail){
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		param.put("uemail", uemail);
		
		List<IdusOrderVO> list = sqlSession.selectList(namespace + ".orderList", param);
		return (ArrayList<IdusOrderVO>)list;
	}
	public ArrayList<IdusOrderVO> getcancelList(int start, int end,String uemail){
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		param.put("uemail", uemail);
		
		List<IdusOrderVO> list = sqlSession.selectList(namespace + ".cancelList", param);
		return (ArrayList<IdusOrderVO>)list;
	}
	
	public int getorderCount() {
		return sqlSession.selectOne(namespace+".orderCount");
	}
	public int getorderCancel(String oid) {
		return sqlSession.update(namespace+".orderCancel", oid);
	}
	public int getorderDelete(String oid) {
		return sqlSession.delete(namespace+".orderDelete", oid);
	}

}
