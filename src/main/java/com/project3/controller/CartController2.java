package com.project3.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project3.service.CartServiceImpl2;
import com.project3.vo.IdusSessionVO;

@Controller
public class CartController2 {
	@Autowired
	private CartServiceImpl2 cartService2;
	
	/**
	 *	장바구니(지혜)
	 */
	@RequestMapping(value="/cart_order2.do", method=RequestMethod.GET)
	   public String cart_order2() {
	      return "cart/cart_order2";
	}
	
	/**
	 *	장바구니(지혜)
	 */
	@RequestMapping(value = "/cart2.do", method = RequestMethod.GET)
	public ModelAndView cart2(HttpSession session) {
		IdusSessionVO svo = (IdusSessionVO)session.getAttribute("svo");
		return cartService2.getCartList(svo.getUemail());
	}
	
	/**
	 * 구매하기(지혜)
	 */
	@RequestMapping(value = "/purchase2.do", method = RequestMethod.GET)
	public String purchase2() {
		return "/cart/purchase2";
	}

}
