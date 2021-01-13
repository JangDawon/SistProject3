package com.project3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CategoryController {
	@RequestMapping(value = "/food.do", method = RequestMethod.GET)
	public String food() {
		return "/category/food";
	}
}
