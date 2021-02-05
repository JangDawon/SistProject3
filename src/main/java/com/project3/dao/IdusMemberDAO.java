
package com.project3.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.project3.vo.IdusMemberVO;
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
		return sqlSession.selectOne(namespace+".content",email);
	}
	
	public IdusMemberVO getUserContent(String uid) {
		return sqlSession.selectOne(namespace+".userContent", uid);
	}
}
