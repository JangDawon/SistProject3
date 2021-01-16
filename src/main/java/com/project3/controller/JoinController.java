package com.project3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JoinController {
	/**
	 * 회원가입 
	 * @return
	 */
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public ModelAndView join() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("join/join");
		
		return mv;
	}
	/**
	 * 회원가입 선택
	 * @return
	 */
	@RequestMapping(value="/join_choice.do", method=RequestMethod.GET)
	public ModelAndView join_choice() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("join/join_choice");
		
		return mv;
	}
}
