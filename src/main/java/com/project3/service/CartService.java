package com.project3.service;

import com.project3.vo.IdusCartVO;

public interface CartService {
	int getCartInsert(IdusCartVO vo);
	//Object getCartList(String id);
	Object getCartList(String uemail);
	int getCartUpdate(String id, String p_qty, String p_price);
	int getCartDelete(String id);
	int sumMoney(String uemail);
    int countCart(String uemail, String pid);
}
