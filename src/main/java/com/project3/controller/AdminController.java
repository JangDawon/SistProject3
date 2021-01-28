package com.project3.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project3.service.ProductServiceImpl;
import com.project3.vo.IdusProductVO;

@Controller
public class AdminController {
	@Autowired
	private ProductServiceImpl productService;
	
	@RequestMapping(value="/admin.do", method=RequestMethod.GET)
	public String admin() {
		return "/admin/user/user_mng_list";
	}
	
	@RequestMapping(value="/user_mng_list.do", method=RequestMethod.GET)
	public String user_mng_list() {
		return "/admin/user/user_mng_list";
	}
	
	@RequestMapping(value="/user_mng_content.do", method=RequestMethod.GET)
	public String user_mng_content() {
		return "/admin/user/user_mng_content";
	}
	
	@RequestMapping(value="/review_mng_list.do", method=RequestMethod.GET) 
	public String review_mng_list() { 
		return "/admin/review/review_mng_list"; 
	}
	
	@RequestMapping(value="/review_mng_content.do", method=RequestMethod.GET) 
	public String review_mng_content() { 
		return "/admin/review/review_mng_content"; 
	}
	
	@RequestMapping(value="/product_mng_list.do", method=RequestMethod.GET)
	public ModelAndView product_mng_list(String rpage) { 
		return (ModelAndView)productService.getList(rpage, null);
	}
	
	@RequestMapping(value="/product_mng_regist.do", method=RequestMethod.GET)
	public String product_mng_regist() { 
		return "/admin/product/product_mng_regist";
	}
	
	@RequestMapping(value="/product_mng_regist_proc.do", method=RequestMethod.POST)
	public ModelAndView product_mng_regist_proc(IdusProductVO vo, HttpServletRequest request) { 
		
		String path1 = request.getSession().getServletContext().getRealPath("/");
		String path2 = "\\resources\\upload\\";
		
		vo.setSavePath(path1+path2);
		
		return (ModelAndView)productService.getResultWrite(vo);
	}
	
	@RequestMapping(value="/product_mng_content.do", method=RequestMethod.GET)
	public ModelAndView product_mng_content(String id) { 
		return productService.getContent(id);
	}
	
	@RequestMapping(value="/product_mng_update.do", method=RequestMethod.GET)
	public ModelAndView product_mng_udpate(String id) { 
		return productService.getUpdate(id);
	}
	
	@RequestMapping(value="/product_mng_update_proc.do", method=RequestMethod.POST)
	public ModelAndView product_mng_udpate_proc(IdusProductVO vo, HttpServletRequest request) {
		String path1 = request.getSession().getServletContext().getRealPath("/");
		String path2 = "\\resources\\upload\\";
		
		vo.setSavePath(path1+path2);
		
		return productService.getResultUpdate(vo);
	}
	
	@RequestMapping(value="/product_mng_delete.do", method=RequestMethod.GET)
	public String product_mng_delete() { 
		return "/admin/product/product_mng_delete";
	}
	
	@RequestMapping(value="/product_mng_delete_proc.do", method=RequestMethod.GET)
	public ModelAndView product_mng_delete_proc(String id) { 
		return productService.getResultDelete(id);
	}
}
