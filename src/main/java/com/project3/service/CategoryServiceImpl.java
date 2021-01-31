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
	
}
