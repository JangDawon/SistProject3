package com.project3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CartController {
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
	 * �ٷα���
	 */
	@RequestMapping(value = "/purchase.do", method = RequestMethod.GET)
	public String purchase() {
		return "/cart/purchase";
	}
}
