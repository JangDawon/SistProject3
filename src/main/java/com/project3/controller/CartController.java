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
import org.springframework.web.bind.annotation.ResponseBody;
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

	@RequestMapping(value = "/cart.do", method = RequestMethod.GET)
	public String cart() {
		return "/cart/cart";
	}
	
	
	/**
	 * 장바구니 담기
	 */
	@RequestMapping(value = "/cart_insert.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	/* public String cart_insert(String cid, String uemail, String pid, String p_name, int p_qty, String p_opt, int p_price) {
		IdusCartVO vo = new IdusCartVO();
		vo.setCid(cid);
		vo.setUemail(uemail);
		vo.setPid(pid);
		vo.setP_name(p_name);
		vo.setP_qty(p_qty);
		vo.setP_opt(p_opt);
		vo.setP_price(p_price);
		
		return String.valueOf(cartService.getCartInsert(vo));
	} */
	
	public String cart_insert(IdusCartVO vo, HttpSession session) {
		String uemail = (String)session.getAttribute("uemail");
		if(uemail == null) {
			return "redirect:/login/login.do";
		}
		vo.setUemail(uemail);
		cartService.getCartInsert(vo);
		return "redirect:/cart/cart_list.do";
	}
	
	@ResponseBody
	@RequestMapping(value = "/cart_list.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String cart_list(String uemail) {
		return cartService.getCartList(uemail);
	}
	
	/* @RequestMapping(value = "/cart_list.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public ModelAndView cart_list(HttpSession session, ModelAndView mv) {
		Map<String, Object> map = new HashMap<String, Object>();
		String uemail = (String)session.getAttribute("uemail");
		
		if(uemail != null) {
			List<IdusCartVO> list = cartService.getCartList(uemail);
			int sumMoney = cartService.sumMoney(uemail);
			int fee = sumMoney >= 50000 ? 0 : 2600;
			
			map.put("sumMoney", sumMoney);
			map.put("fee", fee);
			map.put("sum", sumMoney+fee);
			map.put("list", list);
			map.put("count", list.size());
			
			mv.addObject("map", map);
			mv.setViewName("/cart/cart.do");
			
			return mv;
		}else {
			return new ModelAndView("login/login", "", null);
		}
	} */
	
	
	@RequestMapping(value = "/cart_update.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String cart_update(String cid, String p_qty, String p_price) {
		return String.valueOf(cartService.getCartUpdate(cid, p_qty, p_price));
	}
	
	@RequestMapping(value = "/cart_delete.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String cart_delete(String cid) {
		return String.valueOf(cartService.getCartDelete(cid));
	}
	
	
	/**
	 * 구매하기
	 */
	@RequestMapping(value = "/purchase.do", method = RequestMethod.GET)
	public String purchase() {
		return "/cart/purchase";
	}

}
