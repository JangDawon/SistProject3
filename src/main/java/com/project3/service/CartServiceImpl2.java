package com.project3.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.project3.dao.IdusCartDAO2;
import com.project3.vo.IdusBoardVO;
import com.project3.vo.IdusCartVO;


@Service("cartService2")
public class CartServiceImpl2 implements CartService {
	@Autowired
	private IdusCartDAO2 cartDAO2;
	
	/**
	 * 장바구니 리스트 가져오기(지혜)
	 */
	@Override
	public ModelAndView getCartList(String uemail) {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<IdusCartVO> list = cartDAO2.getCartList(uemail);
		
		mv.addObject("list", list);
		mv.setViewName("/cart/cart2");
		
		return mv;
	}
	
	/**
	 * 장바구니 입력(지혜)
	 */
	public ModelAndView getCartWrite(String uemail, String pid, int opt1_qty, int opt2_qty, int opt3_qty) {
		ModelAndView mv = new ModelAndView();
		int count = cartDAO2.getDupl(uemail, pid);
		int result = 0;
		if(count > 0) {
			IdusCartVO vo = cartDAO2.getDuplValue(uemail, pid); 
			int opt1=0, opt2=0, opt3=0;
			opt1 = vo.getOpt1_qty() + opt1_qty;
			opt2 = vo.getOpt2_qty() + opt2_qty;
			opt3 = vo.getOpt3_qty() + opt3_qty;
			
			result = cartDAO2.getCartUpdate(uemail, pid, opt1, opt2, opt3);
		}else {
			result = cartDAO2.getCartWrite(uemail, pid, opt1_qty, opt2_qty, opt3_qty);
		}
		
		if(result > 0) {
			mv.setViewName("redirect:/product.do?pid="+pid);
		}else {
			mv.setViewName("errorPage");
		}
		
		
		return mv;
	}
	
	/**
	 * 장바구니 리스트 Ajax로 가져오기(지혜)
	 */
	public String getAjaxList(String uemail) {
		ArrayList<IdusCartVO> list = cartDAO2.getAjaxList(uemail);
		
		//list객체의 데이터를 JSON 객체로 변환 --> JSON 라이브러리 설치(gson)
		JsonArray jarray = new JsonArray();
		JsonObject jdata = new JsonObject();
		Gson gson = new Gson();
		
		for(IdusCartVO vo : list){
			JsonObject jobj = new JsonObject();
			
			jobj.addProperty("cid", vo.getCid());
			jobj.addProperty("uemail", vo.getUemail());
			jobj.addProperty("pid", vo.getPid());
			jobj.addProperty("ptitle", vo.getPtitle());
			jobj.addProperty("pprice", vo.getPprice());
			jobj.addProperty("opt1", vo.getOpt1());
			jobj.addProperty("opt1_price", vo.getOpt1_price());
			jobj.addProperty("opt1_qty", vo.getOpt1_qty());
			jobj.addProperty("opt2", vo.getOpt2());
			jobj.addProperty("opt2_price", vo.getOpt2_price());
			jobj.addProperty("opt2_qty", vo.getOpt2_qty());
			jobj.addProperty("opt3", vo.getOpt3());
			jobj.addProperty("opt3_price", vo.getOpt3_price());
			jobj.addProperty("opt3_qty", vo.getOpt3_qty());
			jobj.addProperty("cdate", vo.getCdate());
			jobj.addProperty("psfile1", vo.getPsfile1());
			
			jarray.add(jobj);
		}
		
		jdata.add("jlist", jarray);
		
		return gson.toJson(jdata);
	}
	
	/**
	 * 장바구니 선택 삭제(지혜)
	 */
	public int getResultDelete(String[] dellist) {
		return cartDAO2.getResultDelete(dellist);
	}
	
	/**
	 * 장바구니 Ajax 옵션 수량 수정(지혜)
	 */
	public String getAjaxUpdate(String cid, String opt, String opt_qty) {
		int result = cartDAO2.getAjaxUpdate(cid, opt, opt_qty);
		
		if(result>0) {
			
		}
		IdusCartVO vo = cartDAO2.getDuplValue(cid);
		if((vo.getOpt1_qty() == 0) && (vo.getOpt2_qty() == 0) && (vo.getOpt3_qty() == 0)) {
			String[] dellist = new String[1]; dellist[0] = cid;
			result = cartDAO2.getResultDelete(dellist);
		}
		return String.valueOf(result);
	}
	
}
