package com.project3.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.project3.dao.IdusWishDAO;
import com.project3.vo.IdusWishVO;


@Service("wishService")
public class WishServiceImpl implements WishService {
	@Autowired
	private IdusWishDAO wishDAO;
	
	@Override    
	public ModelAndView getWishInsert(String uemail, String pid) {
		ModelAndView mv = new ModelAndView();
		
		int result = wishDAO.getWishInsert(uemail, pid);
		
		mv.setViewName("/category/category_list");
		return mv;
	}
	
	public ModelAndView getWishDelete(String uemail, String pid) {
		ModelAndView mv = new ModelAndView();
		
		int result = wishDAO.getWishDelete(uemail, pid);
		
		if(result > 0) {
			mv.setViewName("redirect:/product.do?pid="+pid);
		}else {
			mv.setViewName("errorPage");
		}
		
		
		return mv;
	}
	
	
	public ModelAndView getWishList(String uemail) { 
		ModelAndView mv = new ModelAndView();

		ArrayList<IdusWishVO> wishlist = wishDAO.getWishList(uemail);
		
		mv.addObject("wishlist",wishlist);
		mv.setViewName("/category/category_list");

		return mv;
	}
	
	/*public String getAjaxListWish(String uemail) {
		ArrayList<IdusWishVO> wishlist = wishDAO.getAjaxListWish(uemail);
		
		//list객체의 데이터를 JSON 객체로 변환 --> JSON 라이브러리 설치(gson)
		JsonArray jarray = new JsonArray();
		JsonObject jdata = new JsonObject();
		Gson gson = new Gson();
		
		for(IdusWishVO vo : wishlist){
			JsonObject jobj = new JsonObject();

			jobj.addProperty("wid", vo.getWid());
			jobj.addProperty("uemail", vo.getUemail());
			jobj.addProperty("pid", vo.getPid());
			jobj.addProperty("wdate", vo.getWdate());
			
			jarray.add(jobj);
		}
		
		jdata.add("jlist", jarray);
		
		return gson.toJson(jdata);
	}*/



	
}
