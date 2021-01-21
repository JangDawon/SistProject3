package com.project3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ArtistController {
	/**
	 * 인기작가 카테고리
	 */
	@RequestMapping(value = "/artist_best.do", method = RequestMethod.GET)
	public String artist_best() {
		return "/artist/artist_best";
	}
	
	
	/**
	 * 작가 홈 메뉴
	 */
	@RequestMapping(value = "/artist_menu.do", method = RequestMethod.GET)
	public String artist_menu() {
		return "/artist/artist_menu";
	}
	
	
	/**
	 * 작가 홈
	 */
	@RequestMapping(value = "/artist_home.do", method = RequestMethod.GET)
	public String artist_home() {
		return "/artist/artist_home";
	}
	
	
	/**
	 * 작가 판매 상품
	 */
	@RequestMapping(value = "/artist_product.do", method = RequestMethod.GET)
	public String artist_product() {
		return "/artist/artist_product";
	}
}
