package com.project3.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project3.service.CartServiceImpl;
import com.project3.vo.IdusSessionVO;

@Controller
public class CartController {
	@Autowired
	private CartServiceImpl cartService;
	
	@RequestMapping(value="/cart_order.do", method=RequestMethod.GET)
	public String cart_order() {
		return "cart/cart_order";
	}
	
	
	@RequestMapping(value = "/cart.do", method = RequestMethod.GET)
	public ModelAndView cart(HttpSession session) {
		IdusSessionVO svo = (IdusSessionVO)session.getAttribute("svo");
		return cartService.getCartList(svo.getUemail());
	}
	
	/* @RequestMapping(value = "/cart_insert.do", method = RequestMethod.GET)
	public ModelAndView cart(String uemail, String pid, String opt1_qty, String opt2_qty, String op3_qty) {
		return cartService.getCartInsert(uemail, pid, opt1_qty, opt2_qty, op3_qty);
	} */

	
	@RequestMapping(value = "/purchase.do", method = RequestMethod.GET)
	public ModelAndView purchase(HttpSession session) {
		IdusSessionVO svo = (IdusSessionVO)session.getAttribute("svo");
		return cartService.getPurchaseList(svo.getUemail());
	}

	
	
	
	
}
