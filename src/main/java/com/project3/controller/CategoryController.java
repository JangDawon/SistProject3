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
	 * 음식
	 */
	@RequestMapping(value = "/food.do", method = RequestMethod.GET)
	public String food() {
		return "/category/food";
	}
	
	/**
	 * 악세사리
	 */
	@RequestMapping(value = "/accessory.do", method = RequestMethod.GET)
	public String accessory() {
		return "/category/accessory";
	}
	
	/**
	 * 패션&잡화
	 */
	@RequestMapping(value = "/living.do", method = RequestMethod.GET)
	public String living() {
		return "/category/living";
	}
	
	/**
	 * 인테리어
	 */
	@RequestMapping(value = "/interior.do", method = RequestMethod.GET)
	public String interior() {
		return "/category/interior";
	}
	
	/**
	 * 기타
	 */
	@RequestMapping(value = "/etc.do", method = RequestMethod.GET)
	public String etc() {
		return "/category/etc";
	}
	
	/**
	 * 인기 작품
	 */
	@RequestMapping(value = "/product_best.do", method = RequestMethod.GET)
	public ModelAndView product_best(String pcat) {
		//return categoryService.getBestList();
		return categoryService.getBestProdList(pcat);
	}
	
	/**
	 * 최신 작품
	 */
	@RequestMapping(value = "/product_new.do", method = RequestMethod.GET)
	public ModelAndView product_new() {
		return categoryService.getNewList();
	}
	
	/**
	 * 카테고리 리스트
	 */
	@RequestMapping(value = "/category_list.do", method = RequestMethod.GET)
	public ModelAndView category_list(String pcat) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("pcat", pcat);
		mv.setViewName("/category/category_list");
		
		return mv; 
	}
	
	/**
	 * 카테고리 리스트
	 */
	@ResponseBody
	@RequestMapping(value = "/category_ajax_list.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String category_ajax_list(String pcat, String sname) {
		return categoryService.getAjaxList(pcat, sname); 
	}
	
	
	
	
}
