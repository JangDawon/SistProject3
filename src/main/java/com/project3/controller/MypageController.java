package com.project3.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public ModelAndView mypage_aside(HttpSession session) {
		IdusSessionVO svo = (IdusSessionVO) session.getAttribute("svo");
		return memberService.getProfile(svo.getUemail());
	}

	@RequestMapping(value = "/my_bookmark_item.do", method = RequestMethod.GET)
	public ModelAndView my_bookmark_item(HttpSession session) {
		IdusSessionVO svo = (IdusSessionVO) session.getAttribute("svo");
		return memberService.getbookmarkList(svo.getUemail());
	}


	@RequestMapping(value="/my_cancel.do", method=RequestMethod.GET) 
	public ModelAndView my_cancel(HttpSession session,String rpage) { 
		IdusSessionVO svo = (IdusSessionVO) session.getAttribute("svo");
		return (ModelAndView)memberService.getcancelList(rpage, null, svo.getUemail());
	}

	@RequestMapping(value = "/my_info.do", method = RequestMethod.GET)
	public ModelAndView my_info(HttpSession session) {
		IdusSessionVO svo = (IdusSessionVO) session.getAttribute("svo");
		return memberService.getContent(svo.getUemail());
	}

	@RequestMapping(value="/my_order.do", method=RequestMethod.GET) 
	public ModelAndView my_order(HttpSession session,String rpage) { 
		IdusSessionVO svo = (IdusSessionVO) session.getAttribute("svo");
		return (ModelAndView)memberService.getorderList(rpage, null, svo.getUemail());
	}
	
	@RequestMapping(value="/my_review.do", method=RequestMethod.GET) 
	public ModelAndView my_review(HttpSession session,String rpage) { 
		IdusSessionVO svo = (IdusSessionVO) session.getAttribute("svo");
		return (ModelAndView)reviewService.reviewList(rpage, null,svo.getUemail());
	}
	
	 @RequestMapping(value = "/review_write.do", method = RequestMethod.GET)
	  public ModelAndView review_write(String pid,String oid) { 
		 return memberService.getProductContent(pid,oid); 
	 }
	 
	

	@ResponseBody
	@RequestMapping(value = "/review_write_proc.do", method = RequestMethod.POST)
	public String my_review(IdusReviewVO vo, HttpServletRequest request) {
		String path1 = request.getSession().getServletContext().getRealPath("/");
		String path2 = "\\resources\\upload\\";
		vo.setSavepath(path1 + path2);

		return reviewService.getResultWrite(vo);
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
	
	@RequestMapping(value = "/orderCancelProc.do", method = RequestMethod.GET)
	public ModelAndView orderCancel(String oid) {
		return memberService.getorderCancel(oid);
	}
	@RequestMapping(value = "/orderDelete.do", method = RequestMethod.GET)
	public ModelAndView orderDelete(String oid) {
		return memberService.getorderDelete(oid);
	}
	@RequestMapping(value = "/reviewDeleteProc.do", method = RequestMethod.GET)
	public ModelAndView reviewDelete(String rid) {
		return reviewService.getreviewDelete(rid);
	}
	@RequestMapping(value="/review_update.do", method=RequestMethod.GET)
	  public ModelAndView review_update(String pid,String oid,String rid) { 
		 return memberService.getProductContent2(pid,oid,rid); 
	 }
	@ResponseBody
	@RequestMapping(value="/review_update_proc.do", method=RequestMethod.POST)
	public ModelAndView reviewUpdateProc(IdusReviewVO vo, HttpServletRequest request) {
		//서버의 저장경로
		String path1 = request.getSession().getServletContext().getRealPath("/");
		String path2 = "\\resources\\upload\\";
		vo.setSavepath(path1+path2);
		
		return reviewService.getResultUpdate(vo);
	}
}