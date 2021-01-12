package com.project3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	@RequestMapping(value = "index.do", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value = "cs.do", method = RequestMethod.GET)
	public String cs() {
		return "cs";
	}
}