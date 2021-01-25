package com.project3.service;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.project3.dao.IdusBoardDAO;
import com.project3.vo.IdusBoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private IdusBoardDAO boardDAO;
	
	public ModelAndView getList() {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<IdusBoardVO> list = boardDAO.getList();
		
		mv.addObject("list", list);
		mv.setViewName("/cs/cs");
		return mv;
	}
	
	public ModelAndView getResultWrite(Object vo) {
		ModelAndView mv = new ModelAndView();
		
		IdusBoardVO bvo = (IdusBoardVO)vo;
		
		if(bvo.getFile1().getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			bvo.setBfile(bvo.getFile1().getOriginalFilename());
			bvo.setBsfile(uuid + "_" + bvo.getFile1().getOriginalFilename());
			
			boolean result = boardDAO.getInsert(bvo);
			
			if(result) {
				try {
					File file = new File(bvo.getSavePath()+bvo.getBsecret());
					bvo.getFile1().transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				mv.setViewName("redirect:/cs.do");
			}else {
				mv.setViewName("erroePage");
			}
		}
		
		
		
		return mv;
	}

	public ModelAndView getContent(String id) {
		ModelAndView mv = new ModelAndView();
		
		IdusBoardVO vo = boardDAO.getContent(id);
		boardDAO.getUpdateHits(id);
		
		mv.addObject("vo", vo);
		mv.setViewName("/cs/cs_content");
		
		return mv;
	}
	
	public ModelAndView getUpdate(String id) {
		ModelAndView mv = new ModelAndView();
		
		IdusBoardVO vo = boardDAO.getContent(id);
		
		mv.addObject("vo", vo);
		mv.setViewName("/cs/cs_update");
		
		return mv;
	}
	
	public ModelAndView getResultUpdate(Object vo) {
		ModelAndView mv = new ModelAndView();
		boolean result = false;
		
		IdusBoardVO bvo = (IdusBoardVO)vo;
		
		if(bvo.getFile1().getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			bvo.setBfile(bvo.getFile1().getOriginalFilename());
			bvo.setBsfile(uuid + "_" + bvo.getFile1().getOriginalFilename());
			
			result = boardDAO.getUpdate(bvo);
			
			if(result) {
				try {
					File file = new File(bvo.getSavePath()+bvo.getBsfile());
					bvo.getFile1().transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
		}else {
			result = boardDAO.getUpdateNoFile(bvo);
		}
		
		if(result) {
			mv.setViewName("redirect:/cs.do");
		}else {
			mv.setViewName("errorPage");
		}
		
		return mv;
	}
	
	public ModelAndView getResultDelete(String id) {
		ModelAndView mv = new ModelAndView();
		
		boolean result = boardDAO.getDelete(id);
		
		if(result) {
			mv.setViewName("redirect:cs.do");
		}else {
			mv.setViewName("errorPage");
		}
		
		return mv;
	}
}
