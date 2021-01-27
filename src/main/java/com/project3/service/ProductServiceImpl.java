package com.project3.service;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.project3.dao.IdusProductDAO;
import com.project3.vo.IdusBoardVO;
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
	
	public ModelAndView getList(String rpage, String param) {
		ModelAndView mv = new ModelAndView();
		
		int start = 0;
		int end = 0;
		int pageSize = 10; //�� �������� ��µǴ� row
		int pageCount = 1; //��ü ������ �� : ��ü row / �� �������� ��µǴ� row
		int dbCount = productDAO.getCount(); //DB���� �� ��ü�ο�� ���
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
		ArrayList<IdusProductVO> list = productDAO.getList(start, end);

		//board_list.jsp ���Ϸ� ������ ����
		mv.addObject("list", list);
		mv.addObject("dbCount", dbCount);
		mv.addObject("pageSize", pageSize);
		mv.addObject("reqPage", reqPage);
		
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
		
		vo.setPcontent(vo.getPcontent().replace("\r\n", "<br>"));
		
		mv.addObject("vo", vo);
		mv.setViewName("/admin/product/product_mng_content");
		
		return mv;
	}
	
	public ModelAndView getUpdate(String id) {
		ModelAndView mv = new ModelAndView();
		
		IdusProductVO vo = productDAO.getContent(id);
		
		mv.addObject("vo", vo);
		mv.setViewName("/admin/product/product_mng_update");
		
		return mv;
	}
	
	public ModelAndView getResultUpdate(Object vo) {
		ModelAndView mv = new ModelAndView();
		IdusProductVO pvo = (IdusProductVO)vo;
		
		/*
		 * int count = productDAO.getUpdate(pvo);
		 * 
		 * if(count == 1) { mv.setViewName("redirect:product_mng_list.do"); }else {
		 * mv.setViewName("errorPage"); }
		 */
		
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
