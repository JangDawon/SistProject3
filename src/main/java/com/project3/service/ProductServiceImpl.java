package com.project3.service;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.project3.dao.IdusProductDAO;
import com.project3.vo.IdusProductVO;

@Service("productService")
public class ProductServiceImpl implements BoardService{
	@Autowired
	private IdusProductDAO productDAO;
	
	public ModelAndView getList() {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<IdusProductVO> list = productDAO.getList();
		
		mv.addObject("list", list);
		mv.setViewName("/admin/product/product_mng_list");
		
		return mv;
	}
	
	public ModelAndView getResultWrite(Object vo) {
		ModelAndView mv = new ModelAndView();
		
		IdusProductVO pvo = (IdusProductVO)vo;
		
		UUID uuid = UUID.randomUUID();
		
		if(pvo.getFile1().getSize() != 0) {
			pvo.setPfile1(pvo.getFile1().getOriginalFilename());
			pvo.setPsfile1(uuid + "_" + pvo.getFile1().getOriginalFilename());
			boolean result = productDAO.getInsert(pvo);
			
			if(result) {
				try {
					File file = new File(pvo.getSavePath()+pvo.getPsfile1());
					pvo.getFile1().transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				mv.setViewName("redirect:/product_mng_list.do");
			}else {
				mv.setViewName("errorPage");
			}
		}
		
		return mv;
	}
	
	public ModelAndView getContent(String id) {
		ModelAndView mv = new ModelAndView();
		
		IdusProductVO vo = productDAO.getContent(id);
		
		mv.addObject("vo", vo);
		mv.setViewName("/admin/product/product_mng_content");
		
		return mv;
	}
	
	public ModelAndView getUpdate(String id) {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	public ModelAndView getResultUpdate(Object vo) {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	public ModelAndView getResultDelete(String id) {
		ModelAndView mv = new ModelAndView();
		boolean result = false;
		
		if(id.equals("all")) {
			result = productDAO.getDeleteAll();
			mv.setViewName("redirect:/product_mng_list.do");
		}else {
			
		}
		
		
		return mv;
	}
}
