package com.project3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ArtistController {
	/**
	 * �α��۰� ī�װ�
	 */
	@RequestMapping(value = "/artist_best.do", method = RequestMethod.GET)
	public String artist_best() {
		return "/artist/artist_best";
	}
	
	
	/**
	 * �۰� Ȩ �޴�
	 */
	@RequestMapping(value = "/artist_menu.do", method = RequestMethod.GET)
	public String artist_menu() {
		return "/artist/artist_menu";
	}
	
	
	/**
	 * �۰� Ȩ
	 */
	@RequestMapping(value = "/artist_home.do", method = RequestMethod.GET)
	public String artist_home() {
		return "/artist/artist_home";
	}
	
	
	/**
	 * �۰� �Ǹ� ��ǰ
	 */
	@RequestMapping(value = "/artist_product.do", method = RequestMethod.GET)
	public String artist_product() {
		return "/artist/artist_product";
	}
}
