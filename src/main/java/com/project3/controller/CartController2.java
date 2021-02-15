package com.project3.controller;

import java.util.StringTokenizer;

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
	 * 주문완료(지혜)
	 */
	@RequestMapping(value="/order_success.do", method=RequestMethod.GET)
	public ModelAndView order_success(String clist, String del_price, String total_price, String uemail, String rname, String cp, String addr_num, String addr) {
		StringTokenizer st = new StringTokenizer(clist, ",");
		String[] cid_list = new String[st.countTokens()-1];
		for(int i=0;i<cid_list.length;i++) {
			cid_list[i] = st.nextToken().trim();
		}
		return cartService2.getOrderSuccessList(uemail, del_price, total_price, cid_list, rname, cp, Integer.parseInt(addr_num), addr);
	}
	
	/**
	 * 주문하기(지혜)
	 */ 
	@RequestMapping(value="/cart_order2.do", method=RequestMethod.GET)
	public ModelAndView cart_order2(String purchase_list, String del_price, String total_price, String uemail) {
		StringTokenizer st = new StringTokenizer(purchase_list, ",");
		String[] list = new String[st.countTokens()];
		
		String[] cid_list = new String[list.length-1];
		int q = 0;
		for(int i=0;i<list.length;i++) {
			list[i] = st.nextToken();
			
			StringTokenizer st2 = new StringTokenizer(list[i], "=");
			String[] list2 = new String[st2.countTokens()];
			for(int j=0;j<list2.length;j++) {
				list2[j] = st2.nextToken();
				if((j%2) == 1) {
					if(j == 1) {
						cid_list[q] = list2[j].trim();
						q++;
					}
				}
			}
		}
		return cartService2.getOrderList(uemail, del_price, total_price, cid_list);
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
		return cartService2.getCartWrite(uemail, pid, Integer.parseInt(opt1_qty), Integer.parseInt(opt2_qty), Integer.parseInt(opt3_qty));
	}
	
	
	/**
	 * 구매하기(지혜)
	 */
	@RequestMapping(value = "/purchase2.do", method = RequestMethod.GET)
	public String purchase2() {
		return "/cart/purchase2";
	}
	
	/**
	 * 장바구니 리스트(지혜)
	 */
	@ResponseBody
	@RequestMapping(value = "/cart_ajax_list.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String cart_ajax_list(String uemail) {
		return cartService2.getAjaxList(uemail);
	}
	
	/**
	 * 장바구니 선택 삭제(지혜)
	 */
	@RequestMapping(value = "/cart_list_select_del.do", method = RequestMethod.GET)
	public ModelAndView cart_list_select_del(String del_list) {
		ModelAndView mv = new ModelAndView();
		
		StringTokenizer st = new StringTokenizer(del_list, ", ");
		String[] dellist = new String[st.countTokens()];
		
		for(int i=0; i<dellist.length; i++) {
			dellist[i] = st.nextToken();
		}
		
		int result = cartService2.getResultDelete(dellist);
		
		if(result >0) {
			mv.setViewName("redirect:/cart2.do");
		}else {
			mv.setViewName("errorPage");
		}
		
		return mv;
	}
	
	/**
	 * 장바구니 옵션 수량 수정(지혜)
	 */
	@ResponseBody
	@RequestMapping(value = "/cart_list_opt_update.do", method = RequestMethod.GET)
	public String cart_list_opt_update(String cid, String opt, String opt_qty) {
		return cartService2.getAjaxUpdate(cid, opt, opt_qty);
	}
}
