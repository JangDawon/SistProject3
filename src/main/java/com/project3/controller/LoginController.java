package com.project3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
/**
 * 로그인 화면
 * @author 여은
 *
 */
public class LoginController {
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
		System.out.println(hp);
		return "login/login_check_result";
	}
	

}
