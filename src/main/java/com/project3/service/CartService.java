package com.project3.service;

import java.util.List;

import com.project3.vo.IdusCartVO;

public interface CartService {
	void getCartInsert(IdusCartVO vo);
	List<IdusCartVO> getCartList(String uemail);
	int sumMoney(String uemail);
	int countCart(String pid, String uemail);
	void updateCart(IdusCartVO vo);
}
