package com.project3.service;

import java.io.File;
import java.util.UUID;
import java.util.ArrayList;

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
	public ModelAndView getResultJoin(IdusMemberVO vo) {
		ModelAndView mv = new ModelAndView();
		boolean join_result = memberDAO.getInsert(vo);
		
		if(join_result) {
			mv.addObject("vo", vo);
			mv.setViewName("/join/join_success"); 
		}

		return mv;
	}
	
	/**
<<<<<<< HEAD
	 * �α��� ���
=======
	 * �α��� ���!
>>>>>>> branch 'master' of https://github.com/jihye0526/SistProject3
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
		}else {
			
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
	
	/**
	 * ȸ�� ����
	 */
	public int getResultDelete(String[] userlist) {
		int count = 0;
		
		if(userlist[0].equals("all")) {
			count = memberDAO.getResultDelete();
		}else {
			count = memberDAO.getResultDelete(userlist);
		}
		
		return count;
	}
	
	/**
	 * �̸��� �ߺ� üũ
	 */
	public int getResultEmailCheck(String email) {
		return memberDAO.getEmailCheck(email);
	}
	
	/**
	 * ���̵�/��й�ȣ ã��
	 */
	public ModelAndView getResultLoginCheck(String hp) {
		ModelAndView mv = new ModelAndView();
		ArrayList<IdusMemberVO> list = memberDAO.getLoginCheck(hp);
		mv.addObject("list", list);
		mv.setViewName("/login/login_check_result");
		return mv;
	}
}

