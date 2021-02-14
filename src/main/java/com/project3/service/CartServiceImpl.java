package com.project3.service;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.project3.dao.IdusCartDAO;
import com.project3.vo.IdusCartVO;
import com.project3.vo.IdusOrderVO;

@Service("cartService")
public class CartServiceImpl implements CartService {
	@Autowired
	private IdusCartDAO cartDAO;
	
	/** 선택 삭제 **/
	public int getSelectDelete(String[] dellist) {
		return cartDAO.getSelectDelete(dellist);
	}
	
	@Override
	public ModelAndView getCartList(String uemail) {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<IdusCartVO> list = cartDAO.getCartList(uemail);
		
		mv.addObject("list", list);
		mv.setViewName("/cart/cart");
		
		return mv;
	}

	public ModelAndView getPurchaseList(String uemail, String pid) {
		ModelAndView mv = new ModelAndView();
		
		IdusCartVO vo = cartDAO.getPurchaseList(uemail, pid);
		
		mv.addObject("vo", vo);
		mv.setViewName("/cart/purchase");
		
		return mv;
	}
	
	public ModelAndView getCartInsert(String uemail, String pid, int opt1_qty, int opt2_qty, int opt3_qty) {
		ModelAndView mv = new ModelAndView();
		
		int result = cartDAO.getCartInsert(uemail, pid, opt1_qty, opt2_qty, opt3_qty);
		
		if(result > 0) {
			mv.setViewName("redirect:/product.do?pid="+pid);
		}else {
			mv.setViewName("errorPage");
		}
		
		return mv;
	}
	
	public String getListUpdate(String cid, String opt, String opt_qty) {
		int result = cartDAO.getListUpdate(cid, opt, opt_qty);
		
		return String.valueOf(result);
	}
	
//	public ModelAndView getCartCp(String uemail, String[] stkarray, int stkcount) {
//		ModelAndView mv = new ModelAndView();
//		ArrayList<IdusOrderVO> list = new ArrayList<IdusOrderVO>();
//		String ptitle = "";
//		int total_price = 0;
//		int total_del_price = 0;
//		for(int i=0; i<stkarray.length; i++) {	
//			StringTokenizer stk = new StringTokenizer(stkarray[i], "!");
//			String[] stkarray2 = new String[stk.countTokens()];
//			
//				for(int j=0; j<stkarray2.length; j++) {
//					stkarray2[j] = stk.nextToken();
//					if(stkarray2[j].equals("undefined")) {
//						stkarray2[j] = "0";
//					}else if(stkarray2[j].equals(",")) {
//						stkarray2[j] = "0";
//					}
//					stkarray2[j] = stkarray2[j].replace("," , "");
//					System.out.println(stkarray2[j]);
//				}
//			IdusOrderVO vo = new IdusOrderVO();
//			vo.setPid(stkarray2[0].replace("," , ""));
//			vo.setP1_amt(stkarray2[1].replace("," , ""));
//			vo.setP1_price(stkarray2[2].replace("," , ""));
//			vo.setP2_amt(stkarray2[3].replace("," , ""));
//			vo.setP2_price(stkarray2[4].replace("," , ""));
//			vo.setP3_amt(stkarray2[5].replace("," , ""));
//			vo.setP3_price(stkarray2[6].replace("," , ""));			
//			vo.setSname(cartDAO.getOrderSname(vo.getPid()));
//			vo.setPtitle(cartDAO.getOrderPtitle(vo.getPid()));
//			vo.setOpt1(cartDAO.getOrderOpt1(vo.getPid()));
//			vo.setOpt2(cartDAO.getOrderOpt2(vo.getPid()));
//			vo.setOpt3(cartDAO.getOrderOpt3(vo.getPid()));
//			vo.setT_price(Integer.parseInt(vo.getP1_price())+Integer.parseInt(vo.getP2_price())+Integer.parseInt(vo.getP3_price()));
//			if(vo.getT_price() < 50000){
//				vo.setDel_price("2600");
//			}else {
//				vo.setDel_price("무료");
//			}
//			vo.setPsfile1(cartDAO.getOrderPsfile1(vo.getPid()));
//			total_price += vo.getT_price();
//			if(vo.getDel_price() != "무료") {
//				total_del_price += Integer.parseInt(vo.getDel_price()); 
//			}
//			list.add(vo);
//			ptitle = vo.getPtitle();
//		}
//		String result = cartDAO.getCartCp(uemail);
//		
//		mv.addObject("total_del_price", total_del_price);
//		mv.addObject("total_price", total_price);
//		mv.addObject("ptitle", ptitle);
//		mv.addObject("count1", stkarray.length);
//		mv.addObject("count", stkarray.length-1);
//		mv.addObject("list", list);
//		mv.addObject("result", result);
//		mv.setViewName("/cart/cart_order");
//		return mv;
//		
//	}
	
//	public ModelAndView getResultOrder(IdusOrderVO vo) {
//		ModelAndView mv = new ModelAndView();
//		
//		int result = cartDAO.getInsert(vo);
//		
//		
//		if(result != 0) {
//			mv.setViewName("index");
//		}else {
//			mv.setViewName("errorPage");
//		}
//		return mv;
//	}
}
