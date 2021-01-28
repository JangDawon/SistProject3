package com.project3.service;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.project3.dao.IdusReviewDAO;
import com.project3.vo.IdusReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements BoardService{
	@Autowired
	private IdusReviewDAO reviewDAO;
	@Override
	public Object getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object getResultWrite(Object vo) {
		ModelAndView mv = new ModelAndView();
		IdusReviewVO rvo = (IdusReviewVO)vo;
		if(rvo.getFile1().getSize()!=0) {
			UUID uuid = UUID.randomUUID();
			rvo.setRfile(rvo.getFile1().getOriginalFilename());
			rvo.setRsfile(uuid+"_"+rvo.getFile1().getOriginalFilename());
			
			boolean result = reviewDAO.getInsert(rvo);
			if(result) {
				try {
					File file = new File(rvo.getSavepath()+rvo.getRsfile());
					rvo.getFile1().transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
				mv.setViewName("/mypage/my_reivew");
			}
		}
		return mv;
	}

	@Override
	public Object getContent(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object getUpdate(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object getResultUpdate(Object vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object getResultDelete(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
