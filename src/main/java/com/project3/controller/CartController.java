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
	
	/* @RequestMapping(value = "/cart.do", method = RequestMethod.GET)
	public String insertcart(IdusCartVO vo) { //return "/cart/cart"; return
		int count = cartService.countCart(vo.getPid());
		count == 0 ? cartService.updateCart(vo) : cartService.insertCart(vo);
		if(count == 0) {
			cartService.insertCart(vo);
		}else {
			cartService.updateCart(vo);
		}
		return "redirect:/cart/cart.do";
	}*/
	 
	
	/**
	 * 장바구니 단순 담기
	 */
	@RequestMapping(value = "/cart/cart_insert.do", method=RequestMethod.GET)
	public String cartinsert(IdusCartVO vo, HttpSession session) {		
        String uemail = (String)session.getAttribute("uemail");
        vo.setUemail(uemail);
        // 장바구니에 기존 상품이 있는지 검사
        int count = cartService.countCart(vo.getPid(), uemail);
        if(count == 0){
            // 없으면 insert
            cartService.getCartInsert(vo);
        } else {
            // 있으면 update
            cartService.updateCart(vo);
        }
        return "redirect:/cart/cart.do";
    }
	
	
	/**
	 * 장바구니 목록
	 */
	@RequestMapping(value = "/cart/cart.do", method=RequestMethod.GET)
	public ModelAndView cart_list(HttpSession session, ModelAndView mv) {
		String uemail = (String)session.getAttribute("uemail");
		Map<String, Object> map = new HashMap<String, Object>();
		List<IdusCartVO> list = cartService.getCartList(uemail);
		int sumMoney = cartService.sumMoney(uemail);
		map.put("list", list);
		map.put("count", list.size());
		map.put("sumMoney", sumMoney);
		
		mv.addObject("map", map);
		mv.setViewName("cart/cart_list");
		
		return mv;
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
