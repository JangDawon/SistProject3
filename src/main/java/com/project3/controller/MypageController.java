package com.project3.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project3.service.MemberServiceImpl;
import com.project3.service.ReviewServiceImpl;
import com.project3.vo.IdusReviewVO;
import com.project3.vo.IdusSessionVO;

@Controller
public class MypageController {
	@Autowired
	private ReviewServiceImpl reviewService;
	@Autowired
	private MemberServiceImpl memberService;

	@RequestMapping(value = "/mypage_aside.do", method = RequestMethod.GET)
	public String mypage_aside(HttpSession session) {

		return "/mypage/mypage_aside";
	}

	@RequestMapping(value = "/my_bookmark_item.do", method = RequestMethod.GET)
	public String my_bookmark_item() {
		return "/mypage/my_bookmark_item";
	}

	@RequestMapping(value = "/my_cancel.do", method = RequestMethod.GET)
	public String my_canel() {
		return "/mypage/my_cancel";
	}

	@RequestMapping(value = "/my_info.do", method = RequestMethod.GET)
	public ModelAndView my_info(HttpSession session) {
		IdusSessionVO svo = (IdusSessionVO) session.getAttribute("svo");
		return memberService.getContent(svo.getUemail());
	}

	@RequestMapping(value="/my_order.do", method=RequestMethod.GET) 
	public ModelAndView my_order(String rpage) { 
		return (ModelAndView)memberService.getorderList(rpage, null);
	}
	
	@RequestMapping(value="/my_review.do", method=RequestMethod.GET) 
	public ModelAndView my_review(String rpage) { 
		return (ModelAndView)reviewService.getreviewList(rpage, null);
	}
	

	@RequestMapping(value = "/review_write.do", method = RequestMethod.GET)
	public ModelAndView review_write(String pid) {
		return memberService.getProductContent(pid);
	}

	@RequestMapping(value = "/review_write_proc.do", method = RequestMethod.POST)
	public ModelAndView my_review(IdusReviewVO vo, HttpServletRequest request) {
		String path1 = request.getSession().getServletContext().getRealPath("/");
		String path2 = "\\resources\\upload\\";
		vo.setSavepath(path1 + path2);

		return (ModelAndView) reviewService.getResultWrite(vo);
	}

	@RequestMapping(value = "/myinfo_update_proc.do", method = RequestMethod.POST)
	public ModelAndView board_update_proc(IdusSessionVO vo, HttpServletRequest request) {
		String path1 = request.getSession().getServletContext().getRealPath("/");
		String path2 = "\\resources\\upload\\";
		vo.setSavepath(path1 + path2);

		return memberService.getResultUpdate(vo);
	}

	@RequestMapping(value = "/my_info_delete.do", method = RequestMethod.GET)
	public ModelAndView my_info_delete(String uemail) {
		ModelAndView mv = new ModelAndView();

		mv.addObject("uemail", uemail);
		mv.setViewName("/mypage/my_info_delete");

		return mv;
	}
	@RequestMapping(value = "/my_info_delete_proc.do", method = RequestMethod.GET)
	public ModelAndView my_info_delete_proc(String uemail) {
		return memberService.getResultDelete(uemail);
	}
}