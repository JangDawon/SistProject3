package com.project3.service;

import com.project3.vo.IdusWishVO;

public interface WishService {
	Object getWishInsert(String uemail, String pid);
	Object getWishDelete(String uemail, String pid);
	Object getWishList(String uemail);
	//Object getIndexProd();
}
