package com.project3.service;


import java.util.ArrayList;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.project3.dao.IdusCartDAO2;
import com.project3.dao.IdusProductDAO;
import com.project3.vo.IdusCartVO;
import com.project3.vo.IdusMemberVO;
import com.project3.vo.IdusOrderVO;


@Service("cartService2")
public class CartServiceImpl2 implements CartService {
	@Autowired
	private IdusCartDAO2 cartDAO2;
	
	@Autowired
	private IdusProductDAO productDAO;
	
	/**
	 * �ֹ��ϱ�(����)
	 */
	public ModelAndView getOrderSuccessList(String uemail, String del_price, String total_price, String[] cid_list, String rname, String cp, int addr_num, String addr) {
		ModelAndView mv = new ModelAndView();
		Random random = new Random();
		String onum = String.valueOf(random.nextInt(10000000));
		for(int i=0; i<cid_list.length; i++) {
			IdusOrderVO vo = cartDAO2.getQty(cid_list[i]);
			vo.setCid(cid_list[i]);
			vo.setOnum(onum);
			vo.setUemail(uemail);
			vo.setRname(rname);
			vo.setRaddr_num(addr_num);
			vo.setRaddr(addr);
			vo.setRcp(cp);
			vo.setCancel("");
			vo.setCdate("");
			vo.setDel_price(Integer.parseInt(del_price));
			vo.setTotal_price(Integer.parseInt(total_price));
			cartDAO2.getInsertOrder(vo);
			System.out.println("impl pid : " + vo.getPid());
			productDAO.updateQty(vo.getPid());
		}
		cartDAO2.getResultDelete(cid_list);
		
		mv.setViewName("cart/order_success");
		
		return mv;
	}
	
	/**
	 * �ֹ��� ���� ��������(����)
	 */
	public ModelAndView getOrderList(String uemail, String del_price, String total_price, String[] cid_list) {
		ModelAndView mv = new ModelAndView();
		
		IdusMemberVO vo = cartDAO2.getUserInfo(uemail);
		ArrayList<IdusCartVO> cart_list = cartDAO2.getCartList(cid_list);
		
		mv.addObject("vo", vo);
		mv.addObject("del_price", del_price);
		mv.addObject("total_price", total_price);
		mv.addObject("cart_list", cart_list);
		mv.addObject("cid_list", cid_list);
		mv.setViewName("cart/cart_order2");
		
		return mv;
	}
	
	
	/**
	 * ��ٱ��� ����Ʈ ��������(����)
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
	 * ��ٱ��� �Է�(����)
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
	 * ��ٱ��� ����Ʈ Ajax�� ��������(����)
	 */
	public String getAjaxList(String uemail) {
		ArrayList<IdusCartVO> list = cartDAO2.getAjaxList(uemail);
		
		//list��ü�� �����͸� JSON ��ü�� ��ȯ --> JSON ���̺귯�� ��ġ(gson)
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
	 * ��ٱ��� ���� ����(����)
	 */
	public int getResultDelete(String[] dellist) {
		return cartDAO2.getResultDelete(dellist);
	}
	
	/**
	 * ��ٱ��� Ajax �ɼ� ���� ����(����)
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
