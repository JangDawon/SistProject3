package com.project3.service;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.project3.dao.IdusBoardDAO;
import com.project3.vo.IdusBoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private IdusBoardDAO boardDAO;
	
	public String getSearchList(String sname, String svalue, String rpage) {
		int start = 0;
		int end = 0;
		int pageSize = 10; //한 페이지당 출력되는 row
		int pageCount = 1; //전체 페이지 수 : 전체 row / 한 페이지당 출력되는 row
		int dbCount = boardDAO.getCount(sname, svalue); //DB연동 후 전체로우수 출력
		int reqPage = 1; //요청 페이지
		
		//2-2. 전체 페이지 수 구하기
		if((dbCount%pageSize) == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = (dbCount/pageSize)+1;
		}
		
		//2-3. start, end 값 구하기
		if(rpage != ""){
			reqPage = Integer.parseInt(rpage);
			start = (reqPage - 1) * pageSize + 1;
			end = reqPage*pageSize;
		}else{
			start = reqPage;
			end = pageSize;
		}
		
		//3. DAO 객체 연동
		ArrayList<IdusBoardVO> list = boardDAO.getList(sname, svalue, start, end);
		
		//list객체의 데이터를 JSON 객체로 변환 --> JSON 라이브러리 설치(gson)
		JsonArray jarray = new JsonArray();
		JsonObject jdata = new JsonObject();
		Gson gson = new Gson();
		
		for(IdusBoardVO vo : list){
			JsonObject jobj = new JsonObject();
			
			jobj.addProperty("rno", vo.getRno());
			jobj.addProperty("bid", vo.getBid());
			jobj.addProperty("btitle", vo.getBtitle());
			jobj.addProperty("bdate", vo.getBdate());
			jobj.addProperty("uemail", vo.getUemail());
			jobj.addProperty("uname", vo.getUname());
			jobj.addProperty("bhits", vo.getBhits());
			jobj.addProperty("bpass", vo.getBpass());
			jobj.addProperty("bsecret", vo.getBsecret());
			
			jarray.add(jobj);
		}
		
		jdata.add("jlist", jarray);
		jdata.addProperty("dbCount", dbCount);
		jdata.addProperty("reqPage", reqPage);
		jdata.addProperty("pageSize", pageSize);
		
		return gson.toJson(jdata);
		
	}
	
	public ModelAndView getList(String rpage, String param) {
		ModelAndView mv = new ModelAndView();
		
		int start = 0;
		int end = 0;
		int pageSize = 10; //한 페이지당 출력되는 row
		int pageCount = 1; //전체 페이지 수 : 전체 row / 한 페이지당 출력되는 row
		int dbCount = boardDAO.getCount(); //DB연동 후 전체로우수 출력
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
		ArrayList<IdusBoardVO> list = boardDAO.getList(start, end);
		
		//board_list.jsp 파일로 데이터 전송
		mv.addObject("list", list);
		mv.addObject("dbCount", dbCount);
		mv.addObject("pageSize", pageSize);
		mv.addObject("reqPage", reqPage);
		
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
		}	
		
		boolean result = boardDAO.getInsert(bvo);
		
		if(result) {
			try {
				File file = new File(bvo.getSavePath()+bvo.getBsfile());
				bvo.getFile1().transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			mv.setViewName("redirect:/cs.do");
		}else {
			mv.setViewName("erroePage");
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
		
		IdusBoardVO bvo = (IdusBoardVO)vo;
		
		if(bvo.getFile1().getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			bvo.setBfile(bvo.getFile1().getOriginalFilename());
			bvo.setBsfile(uuid + "_" + bvo.getFile1().getOriginalFilename());
		}	
		
		boolean result = boardDAO.getUpdate(bvo);
			
		if(result) {
			try {
				File file = new File(bvo.getSavePath()+bvo.getBsfile());
				bvo.getFile1().transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			mv.setViewName("redirect:/cs.do");
		}else {
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	public int getResultDelete(String id) {
		ModelAndView mv = new ModelAndView();
		return boardDAO.getDelete(id);
	}
}
