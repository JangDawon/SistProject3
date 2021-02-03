package com.project3.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project3.dao.IdusCartDAO;
import com.project3.vo.IdusCartVO;

@Service("cartService")
public class CartServiceImpl implements CartService {
	@Autowired
	private IdusCartDAO cartDAO;
	
	/* public String getResultCart(IdusCartVO vo) {
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
	
	/** 선택 삭제 **/
	public int getSelectDelete(String[] dellist) {
		return cartDAO.getSelectDelete(dellist);
	}
	
	
	/** 장바구니 담기 **/
	@Override
	public void getCartInsert(IdusCartVO vo) {
		cartDAO.getCartInsert(vo);
	}
	
	/** 장바구니 리스트 **/
	@Override
	public List<IdusCartVO> getCartList(String uemail){
		return cartDAO.getCartList(uemail);
	}
	
	/** 장바구니 금액 합계 **/
    @Override
    public int sumMoney(String uemail) {
        return cartDAO.sumMoney(uemail);
    }
    
    /** 장바구니 상품 확인 **/
    @Override
    public int countCart(String pid, String uemail) {
        return cartDAO.countCart(pid, uemail);
    }
    
	/** 장바구니 상품 수량 변경 **/
    @Override
    public void updateCart(IdusCartVO vo) {
    	cartDAO.updateCart(vo);
    }
	
}
