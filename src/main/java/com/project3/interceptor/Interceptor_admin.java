package com.project3.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project3.vo.IdusSessionVO;

public class Interceptor_admin extends HandlerInterceptorAdapter{
	/**
	 * ��Ʈ�ѷ��� ����Ǳ� ���� ȣ��� - ���ǰ�ü�� üũ
	 */
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		    					throws Exception {
		
		//1. �������� ��������
		HttpSession session = request.getSession();
		IdusSessionVO svo = (IdusSessionVO)session.getAttribute("svo");
		
		//2. svo ��ü üũ - null üũ
		if(svo == null) {
			request.setAttribute("result","������ �������� ������ �������� �α����� ���� �������ּ���~!");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/login.do");
			dispatcher.forward(request, response);

			return false;
		}else if(!svo.getUemail().equals("admin")){
			request.setAttribute("result","������ �������� ������ �������� �α����� ���� �������ּ���~!");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/login.do");
			dispatcher.forward(request, response);

			return false;
			}
		
		return true;
	}//preHandle
}
