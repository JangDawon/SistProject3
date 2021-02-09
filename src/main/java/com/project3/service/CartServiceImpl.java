package com.project3.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.project3.dao.IdusCartDAO;
import com.project3.vo.IdusCartVO;

@Service("cartService")
public class CartServiceImpl implements CartService {
	@Autowired
	private IdusCartDAO cartDAO;
	
	/** 선택 삭제 **/
	public int getSelectDelete(String[] dellist) {
		return cartDAO.getSelectDelete(dellist);
	}
	
	@Override
	public ModelAndView getCartList(String uemail) {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<IdusCartVO> list = cartDAO.getCartList(uemail);
		
		mv.addObject("list", list);
		mv.setViewName("/cart/cart");
		
		return mv;
	}

	public ModelAndView getPurchaseList(String uemail, String pid) {
		ModelAndView mv = new ModelAndView();
		
		IdusCartVO vo = cartDAO.getPurchaseList(uemail, pid);
		
		mv.addObject("vo", vo);
		mv.setViewName("/cart/purchase");
		
		return mv;
	}
	
	public ModelAndView getCartInsert(String uemail, String pid, String opt1_qty, String opt2_qty, String opt3_qty) {
		ModelAndView mv = new ModelAndView();
		
		int result = cartDAO.getCartInsert(uemail, pid, opt1_qty, opt2_qty, opt3_qty);
		
		if(result > 0) {
			mv.setViewName("redirect:/product.do?pid="+pid);
		}else {
			mv.setViewName("errorPage");
		}
		
		return mv;
	}
}
