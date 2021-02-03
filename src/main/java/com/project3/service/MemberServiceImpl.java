package com.project3.service;

import java.io.File;
import java.util.UUID;

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
	 * �α��� ���
	 */
	public ModelAndView getResultLogin(IdusMemberVO vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		IdusSessionVO svo = memberDAO.getLogin(vo);
		
		if(svo != null) {
			session.setAttribute("svo", svo);
			mv.addObject("vo", vo);
			mv.setViewName("index"); 			
		}else {
			mv.addObject("result", "���̵� �Ǵ� ��й�ȣ�� Ȯ�����ּ���.");
			mv.setViewName("/login/login");
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
	public ModelAndView getResultUpdate(Object vo) {
		ModelAndView mv = new ModelAndView();
		IdusMemberVO mvo = (IdusMemberVO) vo;
		boolean result = false;
		if(mvo.getFile1().getSize()!=0) {
			UUID uuid = UUID.randomUUID();
			mvo.setPfile(mvo.getFile1().getOriginalFilename());
			mvo.setPsfile(uuid+"_"+mvo.getFile1().getOriginalFilename());
		}
		result = memberDAO.getUpdate(mvo);
		if(result) {
			File file = new File(mvo.getSavepath()+mvo.getPsfile());
			try {
				mvo.getFile1().transferTo(file);
			} catch (Exception e) {
					e.printStackTrace();
			}
			mv.setViewName("redirect:/mypage.do");
		}
		return mv;
	}
	
}

