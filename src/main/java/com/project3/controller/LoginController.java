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
	 * 로그인 화면
	 * @author 여은
	 *
	 */
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login() {
		return "/login/login";
	}

	/**
	 * 아이디/비밀번호 찾기 화면
	 * @author 여은
	 *
	 */
	@RequestMapping(value="/login_check.do", method=RequestMethod.GET)
	public String login_check() {
		return "/login/login_check";
	}
	
	/**
	 * 아이디/비밀번호 찾기 결과
	 * @return
	 */
	@RequestMapping(value="/login_check_result.do", method=RequestMethod.POST)
	public String login_check_result(String hp) {
		
		return "login/login_check_result";
	}
	
	/**
	 * 로그인 처리
	 */
	@RequestMapping(value="/login_proc.do", method=RequestMethod.POST)
	public ModelAndView login_proc(IdusMemberVO vo, HttpSession session) {
		return memberService.getResultLogin(vo, session);
	}
	
	/**
	 * 로그아웃 처리
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
