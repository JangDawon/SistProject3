package com.project3.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	 *	장바구니(지혜)
	 */
	@RequestMapping(value = "/cart_insert.do", method = RequestMethod.GET)
	public ModelAndView cart_insert(String uemail, String pid, String opt1_qty, String opt2_qty, String opt3_qty) {
		return cartService2.getCartWrite(uemail, pid, opt1_qty, opt2_qty, opt3_qty);
	}
	
	
	/**
	 * 구매하기(지혜)
	 */
	@RequestMapping(value = "/purchase2.do", method = RequestMethod.GET)
	public String purchase2() {
		return "/cart/purchase2";
	}
	
	/**
	 * 장바구니 리스트
	 */
	@ResponseBody
	@RequestMapping(value = "/cart_ajax_list.do", method = RequestMethod.GET)
	public String cart_ajax_list(String uemail) {
		System.out.println("uemail" + uemail);
		return cartService2.getAjaxList(uemail);
	}
	
}
