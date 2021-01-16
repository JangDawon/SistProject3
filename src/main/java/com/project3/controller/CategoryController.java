package com.project3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CategoryController {
	/**
	 * ���� ī�װ�
	 */
	@RequestMapping(value = "/food.do", method = RequestMethod.GET)
	public String food() {
		return "/category/food";
	}
	
	
	/**
	 * �Ǽ��縮 ī�װ�
	 */
	@RequestMapping(value = "/accessory.do", method = RequestMethod.GET)
	public String accessory() {
		return "/category/accessory";
	}
	
	
	/**
	 * �м���ȭ ī�װ�
	 */
	@RequestMapping(value = "/living.do", method = RequestMethod.GET)
	public String living() {
		return "/category/living";
	}
	
	
	/**
	 * ���׸��� ��ǰ ī�װ�
	 */
	@RequestMapping(value = "/interior.do", method = RequestMethod.GET)
	public String interior() {
		return "/category/interior";
	}
	
	
	/**
	 * ��Ÿ ī�װ�
	 */
	@RequestMapping(value = "/etc.do", method = RequestMethod.GET)
	public String etc() {
		return "/category/etc";
	}
	
	
	/**
	 * �α���ǰ ī�װ�
	 */
	@RequestMapping(value = "/product_best.do", method = RequestMethod.GET)
	public String product_best() {
		return "/category/product_best";
	}
	
	
	/**
	 * �α���ǰ ī�װ�
	 */
	@RequestMapping(value = "/product_new.do", method = RequestMethod.GET)
	public String product_new() {
		return "/category/product_new";
	}
	
	
	/**
	 * �α��۰� ī�װ�
	 */
	@RequestMapping(value = "/artist_best.do", method = RequestMethod.GET)
	public String artist_best() {
		return "/category/artist_best";
	}
	
	
	
	
}













