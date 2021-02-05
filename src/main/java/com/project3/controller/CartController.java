package com.project3.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

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
	
	@RequestMapping(value="/cart_order.do", method=RequestMethod.GET)
	public String cart_order() {
		return "cart/cart_order";
	}
	
	/**
	 * 厘官备聪 昏力 贸府
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

	@RequestMapping(value = "/cart.do", method = RequestMethod.GET)
	public String cart() {
		return "/cart/cart";
	}
}
