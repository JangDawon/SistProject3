package com.project3.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.project3.vo.IdusOrderVO;
import com.project3.vo.IdusProductVO;
import com.project3.vo.IdusReviewVO;

public class IdusReviewDAO extends DBConn {
	@Autowired
	private SqlSessionTemplate sqlSession;

	private static String namespace = "mapper.review";

	/**
	 * ���� ���
	 */
	public boolean getInsert(IdusReviewVO vo) {
		boolean result = false;
		int count = sqlSession.selectOne(namespace + ".rcount", vo);
		int val = 0;
		if (count == 0) {
			val = sqlSession.insert(namespace + ".register", vo);
		} else {
			val = 0;
		}
		if (val != 0) {
			result = true;
		} else {
			result = false;
		}
		return result;
	}

	/**
	 * ���� ��ü ����(����)
	 */
	public int getCount() {
		return sqlSession.selectOne(namespace + ".count");
	}

	/**
	 * ���� ����Ʈ ��������(����)
	 */
	public ArrayList<IdusReviewVO> getList(int start, int end) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));

		List<IdusReviewVO> list = sqlSession.selectList(namespace + ".list", param);
		return (ArrayList<IdusReviewVO>) list;
	}
	
	/**
	 * ���� ����Ʈ ��������(����)
	 */
	public ArrayList<IdusReviewVO> getProdReviewList(String pid) {
		List<IdusReviewVO> list = sqlSession.selectList(namespace + ".prodreviewlist", pid);
		
		return (ArrayList<IdusReviewVO>) list;
	}
	

	/**
	 * ���� ���� ��������(����)
	 */
	public IdusReviewVO getContent(String id) {
		return sqlSession.selectOne(namespace + ".content", id);
	}

	/**
	 * ���� ��ü ����(����)
	 */
	public int getDeleteAll() {
		return sqlSession.delete(namespace + ".deleteAll");
	}

	/**
	 * ���� ���� ����(����)
	 */
	public int getDeleteSelect(String[] dellist) {
		return sqlSession.delete(namespace + ".delete", dellist);
	}

	public ArrayList<IdusReviewVO> reviewList(int start, int end, String uemail) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		param.put("uemail", uemail);

		List<IdusReviewVO> list = sqlSession.selectList(namespace + ".reviewList", param);
		return (ArrayList<IdusReviewVO>) list;
	}

	public int getreviewDelete(String rid) {
		return sqlSession.delete(namespace + ".reviewDelete", rid);
	}

	public boolean getUpdate(IdusReviewVO vo) {
		boolean result = false;
		int value = sqlSession.update(namespace + ".reviewUpdate", vo);
		if (value != 0)
			result = true;
		return result;
	}

}
