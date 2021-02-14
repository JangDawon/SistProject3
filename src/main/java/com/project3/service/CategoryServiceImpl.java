package com.project3.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.project3.dao.IdusCategoryDAO;
import com.project3.dao.IdusWishDAO;
import com.project3.vo.IdusProductVO;
import com.project3.vo.IdusWishVO;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService{
	@Autowired
	private IdusCategoryDAO categoryDAO;
	
	@Autowired
	private IdusWishDAO wishDAO;
	
	public ModelAndView getIndexProd() {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<IdusProductVO> list1 = categoryDAO.getIndexNew();
		ArrayList<IdusProductVO> list2 = categoryDAO.getIndexBest();
		ArrayList<IdusWishVO> wishlist = wishDAO.getWishList();
		
		mv.addObject("list1", list1);
		mv.addObject("list2", list2);
		mv.addObject("wishlist", wishlist);
		mv.setViewName("/index");
		
		return mv;
	}
	
	public ModelAndView getList(String pcat) {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	public String getAjaxList(String pcat, String sname, String uemail) {
		ArrayList<IdusProductVO> list = categoryDAO.getAjaxList(pcat, sname);
		ArrayList<IdusWishVO> wishlist = wishDAO.getWishList(uemail);
		
		//list객체의 데이터를 JSON 객체로 변환 --> JSON 라이브러리 설치(gson)
		JsonArray jarray = new JsonArray();
		JsonObject jdata = new JsonObject();
		JsonArray jarray2 = new JsonArray();
		Gson gson = new Gson();
		
		for(IdusProductVO vo : list){
			JsonObject jobj = new JsonObject();

			jobj.addProperty("pid", vo.getPid());
			jobj.addProperty("pcat", vo.getPcat());
			jobj.addProperty("psfile1", vo.getPsfile1());
			jobj.addProperty("sname", vo.getSname());
			jobj.addProperty("ptitle", vo.getPtitle());
			jobj.addProperty("pprice_char", vo.getPprice_char());
			jobj.addProperty("pdate", vo.getPdate());
			
			jarray.add(jobj);
		}
		
		for(IdusWishVO vo : wishlist){
			JsonObject jobj2 = new JsonObject();

			jobj2.addProperty("wid", vo.getWid());
			jobj2.addProperty("uemail", vo.getUemail());
			jobj2.addProperty("pid", vo.getPid());
			jobj2.addProperty("wdate", vo.getWdate());
			
			jarray2.add(jobj2);
		}
		jdata.add("jlist", jarray);
		jdata.add("jlist2", jarray2);
		
		return gson.toJson(jdata);
	}
	
	public ModelAndView getContent(String pid) {
		ModelAndView mv = new ModelAndView();
		
		IdusProductVO vo = categoryDAO.getContent(pid);
		
		vo.setPcontent(vo.getPcontent().replace("\r\n", "<br>"));
		
		mv.addObject("vo", vo);
		mv.setViewName("/product_detail/product_detail");
		
		return mv;
	}
	
	public ModelAndView getNewList() {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<IdusProductVO> list = categoryDAO.getNewList();
		
		mv.addObject("list", list);
		mv.setViewName("/category/product_new");
		
		return mv;
	}
	
	
	public ModelAndView getBestProdList(String pcat) {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<IdusProductVO> list = categoryDAO.getBestProdList(pcat);
		
		mv.addObject("list", list);
		mv.setViewName("/category/product_best");
		
		return mv;
	}
	
}
