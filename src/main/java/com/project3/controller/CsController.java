package com.project3.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project3.service.BoardService;
import com.project3.vo.IdusBoardVO;

@Controller
public class CsController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/cs.do", method = RequestMethod.GET)
	public ModelAndView cs() {
		return (ModelAndView)boardService.getList();
	}
	
	@RequestMapping(value = "/cs_write.do", method = RequestMethod.GET)
	public String cs_write() {
		return "/cs/cs_write";
	}
	
	@RequestMapping(value = "/cs_write_proc.do", method = RequestMethod.POST)
	public ModelAndView cs_write_proc(IdusBoardVO vo, HttpServletRequest request) {
		
		String path1 = request.getSession().getServletContext().getRealPath("/");
		String path2 = "\\resources\\upload\\";
		
		vo.setSavePath(path1+path2);
		
		return boardService.getResultWrite(vo);
	}
	
	
	@RequestMapping(value = "/cs_update.do", method = RequestMethod.GET)
	public ModelAndView cs_update(String id) {
		return (ModelAndView)boardService.getUpdate(id);
	}
	
	@RequestMapping(value = "/cs_update_proc.do", method = RequestMethod.POST)
	public ModelAndView cs_update_proc(IdusBoardVO vo, HttpServletRequest request) {
		
		String path1 = request.getSession().getServletContext().getRealPath("/");
		String path2 = "\\resources\\upload\\";
		
		vo.setSavePath(path1+path2);
		
		return (ModelAndView)boardService.getResultUpdate(vo);
	}
	
	@RequestMapping(value = "/cs_content.do", method = RequestMethod.GET)
	public ModelAndView cs_content(String id) {
		return (ModelAndView)boardService.getContent(id);
	}
	
	@RequestMapping(value = "/cs_delete.do", method = RequestMethod.GET)
	public ModelAndView cs_delete(String id) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("id", id);
		mv.setViewName("/cs/cs_delete");
		
		return mv;
	}
	
	@RequestMapping(value = "/cs_delete_proc.do", method = RequestMethod.GET)
	public ModelAndView cs_delete_proc(String id) {
		return (ModelAndView)boardService.getResultDelete(id);
	}
}
