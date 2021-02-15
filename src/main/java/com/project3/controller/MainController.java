package com.project3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project3.service.CategoryServiceImpl;
import com.project3.service.ProductServiceImpl;
import com.project3.service.ReviewServiceImpl;

@Controller
public class MainController {
	@Autowired
	private CategoryServiceImpl categoryService;
	
	@Autowired
	private ReviewServiceImpl reviewService;
	
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public ModelAndView index() {
		return categoryService.getIndexProd();
	}
	
	@RequestMapping(value = "/product.do", method = RequestMethod.GET)
	public ModelAndView product_detail(String pid) {
		return categoryService.getContent(pid);
	}
	
	@ResponseBody
	@RequestMapping(value = "/index_best_ajax.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String index_best_ajax(String uemail) {
		return categoryService.getBestProdList_AJAX(uemail);
	}
	
	@ResponseBody
	@RequestMapping(value = "/index_new_ajax.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String index_new_ajax(String uemail) {
		return categoryService.getNewList_AJAX(uemail);
	}
	
}
