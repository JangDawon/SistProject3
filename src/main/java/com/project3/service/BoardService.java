package com.project3.service;

public interface BoardService {
	/* Object getList(); */
	Object getList(String rpage, String param);
	Object getResultWrite(Object vo);
	Object getContent(String id);
	Object getUpdate(String id);
	Object getResultUpdate(Object vo);
	Object getResultDelete(String id);
}
