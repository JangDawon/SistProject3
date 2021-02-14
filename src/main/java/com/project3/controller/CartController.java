package com.project3.controller;

import java.util.ArrayList;
import java.util.StringTokenizer;

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
	public String cart_order(String purchase_list, String del_price, String total_price) {
		return "cart/cart_order";
	}
	
	
	@RequestMapping(value = "/cart.do", method = RequestMethod.GET)
	public ModelAndView cart(HttpSession session) {
		IdusSessionVO svo = (IdusSessionVO)session.getAttribute("svo");
		return cartService.getCartList(svo.getUemail());
	}
	
	
	@RequestMapping(value = "/cart_ins.do", method = RequestMethod.GET)
	public ModelAndView cart_insert(String uemail, String pid, String opt1_qty, String opt2_qty, String opt3_qty) {
		return cartService.getCartInsert(uemail, pid, opt1_qty, opt2_qty, opt3_qty);
	}
	
	
	@RequestMapping(value = "/purchase.do", method = RequestMethod.GET)
	public ModelAndView purchase(HttpSession session, String pid) {
		IdusSessionVO svo = (IdusSessionVO)session.getAttribute("svo");
		return cartService.getPurchaseList(svo.getUemail(), pid);
	}

	
	@RequestMapping(value="/cart_list_del.do", method=RequestMethod.GET)
	public ModelAndView cart_list_del(String chklist) {	
		ModelAndView mv = new ModelAndView();
		
		//String chklist --> Array
		StringTokenizer st = new StringTokenizer(chklist, ",");
		String[] dellist = new String[st.countTokens()];
		for(int i=0;i<dellist.length;i++) {
			dellist[i] = st.nextToken();
		}
		
		int result = cartService.getSelectDelete(dellist);
		
		mv.setViewName("redirect:/cart.do");
		
		return mv;
	}
	
	
}