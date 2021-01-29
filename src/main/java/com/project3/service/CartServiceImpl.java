package com.project3.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.dao.IdusCartDAO;
import com.project3.vo.IdusCartVO;

@Service("cartService")
public class CartServiceImpl implements CartService {
	/* @Autowired
	private IdusCartDAO cartDAO;
	
	@Override
	public String getResultCart(IdusCartVO vo) {
		IdusCartDAO dao = new IdusCartDAO();
		boolean cart_result =  cartDAO.getInsert(vo);
		String result = "";
		
		if(cart_result) {
			result = "/cart/cart";
		}else {
			result = "";
		}
		
		return result;
	} */
}
