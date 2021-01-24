package com.project3.controller;

import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JoinController {
	/**
	 * 회원가입 성공
	 * @return
	 */
	@RequestMapping(value="/join_success.do", method=RequestMethod.GET)
	public ModelAndView join_success() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("join/join_success");
		
		return mv;
	}
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
	/**
	 * 회원가입 성공
	 * @return
	 */
	@RequestMapping(value="/certify.do", method=RequestMethod.POST)
	public String certify(String hp) {
		Random rd  = new Random();
        String numStr = "";
        for(int i=0; i<4; i++) {
            String random = Integer.toString(rd.nextInt(10));
            numStr+=random;
        }

        System.out.println("수신자 번호 : " + hp);
        System.out.println("인증번호 : " + numStr);
//        certificationService.certifiedPhoneNumber(hp,numStr);
        return numStr;

	}
}
