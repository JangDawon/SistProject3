package com.project3.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.project3.dao.IdusMemberDAO;
import com.project3.vo.IdusMemberVO;
import com.project3.vo.IdusSessionVO;

@Service("memberService")
public class MemberServiceImpl {
	@Autowired
	private IdusMemberDAO memberDAO;
	
	/**
	 * �쉶�썝媛��엯
	 */
	public String getResultJoin(IdusMemberVO vo) {
		boolean join_result = memberDAO.getInsert(vo);
		String result = "";
		
		if(join_result) {
			result = "join/join_success"; 
		}

		return result;
	}
	
	/**
	 * 濡쒓렇�씤
	 */
	public ModelAndView getResultLogin(IdusMemberVO vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		IdusSessionVO svo = memberDAO.getLogin(vo);
			
		if(svo.getResult() != 0) {
			session.setAttribute("svo", svo);
			mv.addObject("vo", vo);
			mv.setViewName("index"); 
		}else {
			mv.addObject("result", "fail");
			mv.setViewName("redirect:/login/login.do");
		}
		
		return mv;
	}
	public ModelAndView getContent(String uemail) {
		ModelAndView mv = new ModelAndView();
		IdusMemberVO vo = memberDAO.getContent(uemail);
		mv.addObject("vo", vo);
		mv.setViewName("/mypage/my_info");
		
		return mv;
	}
}