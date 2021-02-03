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
	 * 회원가입
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
	 * 로그인
	 */
	public ModelAndView getResultLogin(IdusMemberVO vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		IdusSessionVO svo = memberDAO.getLogin(vo);
		
		if(svo != null) {
			session.setAttribute("svo", svo);
			mv.addObject("vo", vo);
			mv.setViewName("index"); 			
		}else {
			mv.addObject("result", "아이디 혹은 비밀번호가 틀립니다.");
			mv.setViewName("/login/login");
		}
		
		return mv;
	}
	
	/**
	 * 관리자 : 회원 전체 리스트
	 */
	public ModelAndView getList(String rpage) {
		ModelAndView mv = new ModelAndView();
		
		int start = 0;
		int end = 0;
		int pageSize = 10; //한 페이지당 출력되는 row
		int pageCount = 1; //전체 페이지 수 : 전체 row / 한 페이지당 출력되는 row
		int dbCount = memberDAO.getCount(); //DB연동 후 전체로우수 출력
		int reqPage = 1; //요청 페이지
		
		//2-2. 전체 페이지 수 구하기
		if((dbCount%pageSize) == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = (dbCount/pageSize)+1;
		}
		
		//2-3. start, end 값 구하기
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			start = (reqPage - 1) * pageSize + 1;
			end = reqPage*pageSize;
		}else{
			start = reqPage;
			end = pageSize;
		}
		
		//3. DAO 객체 연동
		ArrayList<IdusMemberVO> list = memberDAO.getList(start, end);
		
		//board_list.jsp 파일로 데이터 전송
		mv.addObject("list", list);
		mv.addObject("dbCount", dbCount);
		mv.addObject("pageSize", pageSize);
		mv.addObject("reqPage", reqPage);
		
		mv.setViewName("/admin/user/user_mng_list");
		
		return mv;
	}
}
