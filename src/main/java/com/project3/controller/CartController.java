package com.project3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project3.service.CartServiceImpl;
import com.project3.vo.IdusCartVO;

@Controller
public class CartController {
	@Autowired
	private CartServiceImpl cartService;
	
	/**
	 * ��ٱ���
	 */
	@RequestMapping(value = "/cart.do", method = RequestMethod.GET)
	public String cart() {
		return "/cart/cart";
	}
	
	/**
	 * 주문하기
	 */
	@RequestMapping(value = "/cart_order.do", method = RequestMethod.GET)
	public String cart_order() {
		return "/cart/cart_order";
	}
	
	/**
<<<<<<< HEAD
	 * ��ٱ��� ���
	 */
	/* @RequestMapping(value = "/cart_proc.do", method = RequestMethod.POST)
	public String cart_proc(IdusCartVO vo) {
		return cartService.getResultCart(vo);
	} */
	
	
	/**
	 * �ٷα���
=======
	 * �ٷα���
>>>>>>> refs/heads/master
	 */
	@RequestMapping(value = "/purchase.do", method = RequestMethod.GET)
	public String purchase() {
		return "/cart/purchase";
	}
}
