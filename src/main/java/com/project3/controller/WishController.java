package com.project3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project3.service.WishServiceImpl;

@Controller
public class WishController {
	@Autowired
	private WishServiceImpl wishService;

	@RequestMapping(value = "/wish_insert.do", method = RequestMethod.GET)
	public ModelAndView wish_insert(String uemail, String pid) {
		//System.out.println("uemail: "+uemail+", pid:"+pid);
		return wishService.getWishInsert(uemail, pid);
	}

}
