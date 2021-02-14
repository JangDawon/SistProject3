package com.project3.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project3.vo.IdusSessionVO;



public class Interceptor_cs extends HandlerInterceptorAdapter{
	/**
	 * 컨트롤러가 실행되기 전에 호출됨 - 세션객체를 체크
	 */
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		    					throws Exception {
		
		//1. 세션정보 가져오기
		HttpSession session = request.getSession();
		IdusSessionVO svo = (IdusSessionVO)session.getAttribute("svo");
		
		//2. svo 객체 체크 - null 체크
		if(svo == null) {
			request.setAttribute("result","고객센터 게시판 이용은 로그인을 먼저 진행 해주세요~!");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/login.do");
			
			dispatcher.forward(request, response);

			return false;
		}
		
		return true;
	}//preHandle

}
