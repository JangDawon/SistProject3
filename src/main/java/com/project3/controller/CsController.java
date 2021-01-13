package com.project3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CsController {
	
	@RequestMapping(value = "/cs.do", method = RequestMethod.GET)
	public String cs() {
		return "/cs/cs";
	}
	
	@RequestMapping(value = "/cs_write.do", method = RequestMethod.GET)
	public String cs_write() {
		return "/cs/cs_write";
	}
	
	@RequestMapping(value = "/cs_write_proc.do", method = RequestMethod.POST)
	public String cs_write_proc() {
		return "/cs/cs";
	}
	
	@RequestMapping(value = "/cs_update.do", method = RequestMethod.GET)
	public String cs_update() {
		return "/cs/cs_update";
	}
	
	@RequestMapping(value = "/cs_update_proc.do", method = RequestMethod.POST)
	public String cs_update_proc() {
		return "/cs/cs";
	}
	
	@RequestMapping(value = "/cs_content.do", method = RequestMethod.GET)
	public String cs_content() {
		return "/cs/cs_content";
	}
	
	@RequestMapping(value = "/cs_delete.do", method = RequestMethod.GET)
	public String cs_delete() {
		return "/cs/cs_delete";
	}
}
