package com.project3.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.project3.dao.IdusWishDAO;


@Service("wishService")
public class WishServiceImpl implements WishService {
	@Autowired
	private IdusWishDAO wishDAO;
	
	@Override    
	public ModelAndView getWishInsert(String uemail, String pid) {
		ModelAndView mv = new ModelAndView();
		
		int result = wishDAO.getWishInsert(uemail, pid);
		
		if(result > 0) {
			mv.setViewName("redirect:/product.do?pid="+pid);
		}else {
			mv.setViewName("errorPage");
		}
		
		
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
	
	
	
}
