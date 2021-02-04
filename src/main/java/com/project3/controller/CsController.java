package com.project3.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project3.service.BoardServiceImpl;
import com.project3.vo.IdusBoardVO;
import com.project3.vo.IdusReplyVO;

@Controller
public class CsController {
	@Autowired
	private BoardServiceImpl boardService;
	
	@RequestMapping(value = "/cs.do", method = RequestMethod.GET)
	public ModelAndView cs(String rpage) {
		return (ModelAndView)boardService.getList(rpage, null);
	}
	
	/** ajax °Ë»ö **/
	@ResponseBody
	@RequestMapping(value = "/cs_search.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String cs_search(String sname, String svalue, String rpage) {
		return boardService.getSearchList(sname, svalue, rpage);
	}
	
	@RequestMapping(value = "/cs_write.do", method = RequestMethod.GET)
	public ModelAndView cs_write(String uemail, String uname) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("uemail", uemail);
		mv.addObject("uname", uname);
		mv.setViewName("/cs/cs_write");
		
		return mv;
	}
	
	@RequestMapping(value = "/cs_write_proc.do", method = RequestMethod.POST)
	public ModelAndView cs_write_proc(IdusBoardVO vo, HttpServletRequest request) {
		
		String path1 = request.getSession().getServletContext().getRealPath("/");
		String path2 = "\\resources\\upload\\";
		
		vo.setSavePath(path1+path2);

		return (ModelAndView)boardService.getResultWrite(vo);
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
	public ModelAndView cs_content(String id, String uemail) {
		return (ModelAndView)boardService.getContent(id, uemail);
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
		ModelAndView mv = new ModelAndView();
		
		int result = boardService.getResultDelete(id);
		if(result > 0) {
			mv.setViewName("redirect:/cs.do");
		}else {
			mv.setViewName("errorPage");
		}
		
		return mv;
	}
	
	/**
	 * ´ñ±Û
	 */
	@ResponseBody
	@RequestMapping(value = "/cs_reply_write.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String cs_reply_write(String uemail, String uname, String bid, String rcontent, String rfile, String rsfile) {
		IdusReplyVO rvo = new IdusReplyVO();
		rvo.setUemail(uemail);
		rvo.setUname(uname);
		rvo.setBid(bid);
		rvo.setRcontent(rcontent);
		rvo.setRfile(rfile);
		rvo.setRsfile(rsfile); 
		return String.valueOf(boardService.getReplyWrite(rvo));
	}
	
	@ResponseBody
	@RequestMapping(value = "/cs_reply_list.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String cs_reply_list(String bid) {
		return boardService.getReplyList(bid);
	}
	
	@ResponseBody
	@RequestMapping(value = "/cs_reply_update.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String cs_reply_update(String rid, String rcontent) {
		return String.valueOf(boardService.getReplyUpdate(rid, rcontent));
	}
	
	@ResponseBody
	@RequestMapping(value = "/cs_reply_delete.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String cs_reply_delete(String rid) {
		return String.valueOf(boardService.getReplyDelete(rid));
	}
	
}
