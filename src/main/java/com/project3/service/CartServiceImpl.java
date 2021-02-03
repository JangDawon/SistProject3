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
	
	/** ���� ���� **/
	public int getSelectDelete(String[] dellist) {
		return cartDAO.getSelectDelete(dellist);
	}
	
	
	/** ��ٱ��� ��� **/
	@Override
	public void getCartInsert(IdusCartVO vo) {
		cartDAO.getCartInsert(vo);
	}
	
	/** ��ٱ��� ����Ʈ **/
	@Override
	public List<IdusCartVO> getCartList(String uemail){
		return cartDAO.getCartList(uemail);
	}
	
	/** ��ٱ��� �ݾ� �հ� **/
    @Override
    public int sumMoney(String uemail) {
        return cartDAO.sumMoney(uemail);
    }
    
    /** ��ٱ��� ��ǰ Ȯ�� **/
    @Override
    public int countCart(String pid, String uemail) {
        return cartDAO.countCart(pid, uemail);
    }
    
	/** ��ٱ��� ��ǰ ���� ���� **/
    @Override
    public void updateCart(IdusCartVO vo) {
    	cartDAO.updateCart(vo);
    }
	
}
