package com.project3.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.project3.dao.IdusCategoryDAO;
import com.project3.vo.IdusProductVO;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService{
	@Autowired
	private IdusCategoryDAO categoryDAO;
	
	public ModelAndView getList(String pcat) {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<IdusProductVO> list = categoryDAO.getList(pcat);
		
		mv.addObject("list", list);
		mv.setViewName("/category/category_list");
		
		return mv;
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
	
	/* public ModelAndView getBestList() {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<IdusProductVO> list = categoryDAO.getBestList();
		
		mv.addObject("list", list);
		mv.setViewName("/category/product_best");
		
		return mv;
	} */
	
	public ModelAndView getBestProdList(String pcat) {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<IdusProductVO> list = categoryDAO.getBestProdList(pcat);
		
		mv.addObject("list", list);
		mv.setViewName("/category/product_best");
		
		return mv;
	}
	
	
}
