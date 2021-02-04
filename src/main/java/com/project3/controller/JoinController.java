package com.project3.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project3.service.MemberServiceImpl;
import com.project3.service.certifyServiceImpl;
import com.project3.vo.IdusMemberVO;

@Controller
public class JoinController {
	@Autowired
	private certifyServiceImpl certifyService;
	
	@Autowired
	private MemberServiceImpl memberService;
	/**
	 * �α��� ����
	 * @return
	 */
	@RequestMapping(value="/join_success.do", method=RequestMethod.GET)
	public ModelAndView join_success() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("join/join_success");
		
		return mv;
	}
	/**
	 * ȸ������ 
	 * @return
	 */
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public ModelAndView join() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("join/join");
		
		return mv;
	}
	/**
	 * ȸ������ ó��
	 * @return
	 */
	@RequestMapping(value="/join_proc.do", method=RequestMethod.POST)
	public ModelAndView join_proc(IdusMemberVO vo) {
		return memberService.getResultJoin(vo);
	}
	/**
	 * ȸ������ ���� ����
	 * @return
	 */
	@RequestMapping(value="/join_choice.do", method=RequestMethod.GET)
	public ModelAndView join_choice() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("join/join_choice");
		
		return mv;
	}
	
	/**
	 * ȸ������ ������ȣ ó��
	 * @return
	 */
	@RequestMapping(value="/join_certify.do", method=RequestMethod.GET)
	@ResponseBody
	public String join_certify(String hp) {
		Random rd  = new Random();
        String numStr = "";
        for(int i=0; i<4; i++) {
            String random = Integer.toString(rd.nextInt(10));
            numStr+=random;
        }
      
        System.out.println("�޴��� ��ȣ : " + hp);
        System.out.println("������ȣ : " + numStr);
        certifyService.certifiedPhoneNumber(hp, numStr);
        return numStr; 

	}
	
	/**
	 * �̸��� �ߺ� üũ
	 */
	@RequestMapping(value="/emailCheck.do", method=RequestMethod.GET)
	@ResponseBody
	public String emailCheck(String email) {
		return (String.valueOf(memberService.getResultEmailCheck(email)));
		
	}
}
