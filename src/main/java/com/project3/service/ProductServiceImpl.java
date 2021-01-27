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
		int pageSize = 10; //한 페이지당 출력되는 row
		int pageCount = 1; //전체 페이지 수 : 전체 row / 한 페이지당 출력되는 row
		int dbCount = productDAO.getCount(); //DB연동 후 전체로우수 출력
		int reqPage = 1; //요청 페이지
		
		//2-2. 전체 페이지 수 구하기
		if((dbCount%pageSize) == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = (dbCount/pageSize)+1;
		}
		
		//2-3. start, end 값 구하기
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			start = (reqPage - 1) * pageSize + 1;
			end = reqPage*pageSize;
		}else{
			start = reqPage;
			end = pageSize;
		}
		
		//3. DAO 객체 연동
		ArrayList<IdusProductVO> list = productDAO.getList(start, end);

		//board_list.jsp 파일로 데이터 전송
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
