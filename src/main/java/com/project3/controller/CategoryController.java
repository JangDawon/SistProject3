package com.project3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CategoryController {
	/**
	 * 음식 카테고리
	 */
	@RequestMapping(value = "/food.do", method = RequestMethod.GET)
	public String food() {
		return "/category/food";
	}
	
	
	/**
	 * 악세사리 카테고리
	 */
	@RequestMapping(value = "/accessory.do", method = RequestMethod.GET)
	public String accessory() {
		return "/category/accessory";
	}
	
	
	/**
	 * 패션잡화 카테고리
	 */
	@RequestMapping(value = "/living.do", method = RequestMethod.GET)
	public String living() {
		return "/category/living";
	}
	
	
	/**
	 * 인테리어 소품 카테고리
	 */
	@RequestMapping(value = "/interior.do", method = RequestMethod.GET)
	public String interior() {
		return "/category/interior";
	}
	
	
	/**
	 * 기타 카테고리
	 */
	@RequestMapping(value = "/etc.do", method = RequestMethod.GET)
	public String etc() {
		return "/category/etc";
	}
	
	
	/**
	 * 인기작품 카테고리
	 */
	@RequestMapping(value = "/product_best.do", method = RequestMethod.GET)
	public String product_best() {
		return "/category/product_best";
	}
	
	
	/**
	 * 인기작품 카테고리
	 */
	@RequestMapping(value = "/product_new.do", method = RequestMethod.GET)
	public String product_new() {
		return "/category/product_new";
	}
	
	
	/**
	 * 인기작가 카테고리
	 */
	@RequestMapping(value = "/artist_best.do", method = RequestMethod.GET)
	public String artist_best() {
		return "/category/artist_best";
	}
	
	
	
	
}













