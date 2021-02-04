package com.project3.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project3.service.MemberServiceImpl;
import com.project3.vo.IdusMemberVO;
import com.project3.vo.IdusSessionVO;

@Controller

public class LoginController {
	@Autowired
	private MemberServiceImpl memberService;
	/**
	 * �α���
	 *
	 */
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login() {
		return "/login/login";
	}

	/**
	 * ���̵�/��й�ȣ ã��
	 *
	 */
	@RequestMapping(value="/login_check.do", method=RequestMethod.GET)
	public String login_check() {
		return "/login/login_check";
	}
	
	/**
	 * ���̵�/��й�ȣ ã�� ó��
	 */
	@RequestMapping(value="/login_check_result.do", method=RequestMethod.POST)
	public ModelAndView login_check_result(String hp) {
		return memberService.getResultLoginCheck(hp);
	}
	
	/**
	 * �α��� ó��
	 */
	@RequestMapping(value="/login_proc.do", method=RequestMethod.POST)
	public ModelAndView login_proc(IdusMemberVO vo, HttpSession session) {
		return memberService.getResultLogin(vo, session);
	}
	
	/**
	 * �α׾ƿ�
	 */
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		IdusSessionVO svo = (IdusSessionVO)session.getAttribute("svo");
		String result = "";
		
		if(svo != null) {
			session.invalidate();
			result = "index";
		}
		
		return result;
		
	}
}
