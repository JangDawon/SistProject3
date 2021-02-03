package com.project3.controller;

import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project3.service.CartServiceImpl;
import com.project3.vo.IdusCartVO;

@Controller
public class CartController {
	@Autowired
	private CartServiceImpl cartService;
	
	/**
	 * 장바구니 삭제 처리
	 */
	@RequestMapping(value = "/cart/cart_list_del.do", method = RequestMethod.GET)
	public ModelAndView cart_list_del(String chklist) {
		ModelAndView mv = new ModelAndView();
		
		//String chklist --> array
		StringTokenizer st = new StringTokenizer(chklist, ",");
		String[] dellist = new String[st.countTokens()];
		for(int i=0;i<dellist.length;i++) {
			dellist[i] = st.nextToken();
		}
		
		int result = cartService.getSelectDelete(dellist);
		
		mv.setViewName("redirect:/cart/cart.do");
		return mv;
	}
	
	/**
	 * 장바구니 담기
	 */
	/* @RequestMapping(value = "/cart_proc.do", method = RequestMethod.POST)
	public String cart_proc(IdusCartVO vo) {
		return cartService.getResultCart(vo);
	} */
	
	/**
	 * 장바구니 담기
	 */
	@RequestMapping(value = "/cart.do", method = RequestMethod.GET)
	public String cart(IdusCartVO vo) {
		//return "/cart/cart";
		return cartService.getInsertCart(vo);
	}
	
	
	/**
	 * 바로구매
	 */
	@RequestMapping(value = "/purchase.do", method = RequestMethod.GET)
	public String purchase() {
		return "/cart/purchase";
	}
	
	/**
	 * 주문하기
	 */
	@RequestMapping(value = "/cart_order.do", method = RequestMethod.GET)
	public String cart_order() {
		return "/cart/cart_order";
	}
}
