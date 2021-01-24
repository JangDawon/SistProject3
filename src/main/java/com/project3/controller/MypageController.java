package com.project3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {
	@RequestMapping(value = "/mypage_aside.do", method = RequestMethod.GET)
	public String mypage_aside() {
		return "/mypage/mypage_aside";
	}
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public String mypage() {
		return "/mypage/mypage";
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
	public String my_info() {
		return "/mypage/my_info";
	}
	@RequestMapping(value = "/my_order.do", method = RequestMethod.GET)
	public String my_order() {
		return "/mypage/my_order";
	}
	@RequestMapping(value = "/review_write.do", method = RequestMethod.GET)
	public String my_review_write() {
		return "/mypage/review_write";
	}
	@RequestMapping(value = "/my_review.do", method = RequestMethod.GET)
	public String my_review() {
		return "/mypage/my_review";
	}

}
