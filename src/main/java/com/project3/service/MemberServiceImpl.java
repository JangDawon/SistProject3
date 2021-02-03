package com.project3.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.project3.dao.IdusMemberDAO;
import com.project3.vo.IdusBoardVO;
import com.project3.vo.IdusMemberVO;
import com.project3.vo.IdusSessionVO;

@Service("memberService")
public class MemberServiceImpl {
	@Autowired
	private IdusMemberDAO memberDAO;
	
	/**
	 * ȸ������
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
	 * �α���
	 */
	public ModelAndView getResultLogin(IdusMemberVO vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		IdusSessionVO svo = memberDAO.getLogin(vo);
		
		if(svo != null) {
			session.setAttribute("svo", svo);
			mv.addObject("vo", vo);
			mv.setViewName("index"); 			
		}else {
			mv.addObject("result", "���̵� Ȥ�� ��й�ȣ�� Ʋ���ϴ�.");
			mv.setViewName("/login/login");
		}
		
		return mv;
	}
	
	/**
	 * ������ : ȸ�� ��ü ����Ʈ
	 */
	public ModelAndView getList(String rpage) {
		ModelAndView mv = new ModelAndView();
		
		int start = 0;
		int end = 0;
		int pageSize = 10; //�� �������� ��µǴ� row
		int pageCount = 1; //��ü ������ �� : ��ü row / �� �������� ��µǴ� row
		int dbCount = memberDAO.getCount(); //DB���� �� ��ü�ο�� ���
		int reqPage = 1; //��û ������
		
		//2-2. ��ü ������ �� ���ϱ�
		if((dbCount%pageSize) == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = (dbCount/pageSize)+1;
		}
		
		//2-3. start, end �� ���ϱ�
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			start = (reqPage - 1) * pageSize + 1;
			end = reqPage*pageSize;
		}else{
			start = reqPage;
			end = pageSize;
		}
		
		//3. DAO ��ü ����
		ArrayList<IdusMemberVO> list = memberDAO.getList(start, end);
		
		//board_list.jsp ���Ϸ� ������ ����
		mv.addObject("list", list);
		mv.addObject("dbCount", dbCount);
		mv.addObject("pageSize", pageSize);
		mv.addObject("reqPage", reqPage);
		
		mv.setViewName("/admin/user/user_mng_list");
		
		return mv;
	}
}
