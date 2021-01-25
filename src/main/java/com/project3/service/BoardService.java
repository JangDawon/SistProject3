package com.project3.service;

import org.springframework.web.servlet.ModelAndView;

public interface BoardService {
	ModelAndView getList();
	ModelAndView getResultWrite(Object vo);
	ModelAndView getContent(String id);
	ModelAndView getUpdate(String id);
	ModelAndView getResultUpdate(Object vo);
	ModelAndView getResultDelete(String id);
}
