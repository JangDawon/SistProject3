package com.project3.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project3.service.MemberServiceImpl;
import com.project3.service.ReviewServiceImpl;
import com.project3.vo.IdusReviewVO;

@Controller
public class MypageController {
	@Autowired 
	private ReviewServiceImpl reviewService;
	@Autowired 
	private MemberServiceImpl memberService;
	
	@RequestMapping(value = "/mypage_aside.do", method = RequestMethod.GET)
	public String mypage_aside() {
		return "/mypage/mypage_aside";
	}

	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public ModelAndView mypage(String uemail) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("uemail", uemail);
		mv.setViewName("/mypage/mypage");
		return mv;
	}

	@RequestMapping(value = "/my_bookmark_writer.do", method = RequestMethod.GET)
	public String my_bookmark_writer() {
		return "/mypage/my_bookmark_writer";
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
	public ModelAndView my_info(String uemail) {
		return memberService.getContent(uemail);
	}

	@RequestMapping(value = "/my_order.do", method = RequestMethod.GET)
	public String my_order() {
		return "/mypage/my_order";
	}
	@RequestMapping(value = "/NewFile.do", method = RequestMethod.GET)
	public String new_file() {
		return "/mypage/NewFile";
	}

	@RequestMapping(value = "/my_review.do", method = RequestMethod.GET)
	public String my_review_write() {
		return "/mypage/my_review";
	}
	@RequestMapping(value = "/review_write.do", method = RequestMethod.GET)
	public String review_write() {
		return "/mypage/review_write";
	}

	@RequestMapping(value = "/review_write_proc.do", method = RequestMethod.GET)
	public ModelAndView my_review(IdusReviewVO vo, HttpServletRequest request) {
		String path1 = request.getSession().getServletContext().getRealPath("/");
		String path2 = "\\resources\\upload\\";
		vo.setSavepath(path1+path2);
		
		return (ModelAndView)reviewService.getResultWrite(vo);
	}

}