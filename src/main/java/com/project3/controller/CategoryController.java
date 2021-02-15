package com.project3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project3.service.CategoryServiceImpl;

@Controller
public class CategoryController {
	@Autowired
	private CategoryServiceImpl categoryService;
		
	/**
	 * �α� ��ǰ
	 */
	@RequestMapping(value = "/product_best.do", method = RequestMethod.GET)
	public ModelAndView product_best() {
		return categoryService.getBestProdList();
	}
	
	/**
	 * �ֽ� ��ǰ
	 */
	@RequestMapping(value = "/product_new.do", method = RequestMethod.GET)
	public ModelAndView product_new() {
		return categoryService.getNewList();
	}
	
	/**
	 * ī�װ� ����Ʈ
	 */
	@RequestMapping(value = "/category_list.do", method = RequestMethod.GET)
	public ModelAndView category_list(String pcat) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("pcat", pcat);
		mv.setViewName("/category/category_list");
		
		return mv; 
	}
	
	/**
	 * ī�װ� ����Ʈ
	 */
	@ResponseBody
	@RequestMapping(value = "/category_ajax_list.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String category_ajax_list(String pcat, String sname, String uemail) {
		return categoryService.getAjaxList(pcat, sname, uemail);   
	}
	
	/**
	 * �˻� ����Ʈ
	 */
	@RequestMapping(value = "/search.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public ModelAndView search(String search) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("search", search);
		mv.setViewName("/category/search");
		
		return mv; 
	}
	
	@ResponseBody
	@RequestMapping(value = "/search_ajax_list.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String search_ajax_list(String search, String sname) {
		return categoryService.getSearchList(search, sname); 
	}
	
	
}
