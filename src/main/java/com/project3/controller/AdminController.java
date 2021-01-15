package com.project3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	
	@RequestMapping(value="/admin.do", method=RequestMethod.GET)
	public String admin() {
		return "/admin/admin";
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
	public String product_mng_list() { 
		return "/admin/product/product_mng_list";
	}
	
	@RequestMapping(value="/product_mng_regist.do", method=RequestMethod.GET)
	public String product_mng_regist() { 
		return "/admin/product/product_mng_regist";
	}
	
	@RequestMapping(value="/product_mng_update.do", method=RequestMethod.GET)
	public String product_mng_udpate() { 
		return "/admin/product/product_mng_update";
	}
	
	@RequestMapping(value="/product_mng_delete.do", method=RequestMethod.GET)
	public String product_mng_delete() { 
		return "/admin/product/product_mng_delete";
	}
}
