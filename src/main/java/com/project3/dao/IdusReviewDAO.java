package com.project3.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.project3.vo.IdusReviewVO;

public class IdusReviewDAO extends DBConn {
	@Autowired
	private SqlSessionTemplate sqlSession;

	private static String namespace = "mapper.review";

	/**
	 * ¸®ºä µî·Ï
	 */
public boolean getInsert(IdusReviewVO vo) {
		boolean result = false;
		int val = sqlSession.insert(namespace + ".register", vo);
		if (val != 0) {
			result = true;
		}
		return result;
	}
}
