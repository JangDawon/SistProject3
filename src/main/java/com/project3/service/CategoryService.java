package com.project3.service;

public interface CategoryService {
	/* Object getList(); */
	Object getList(String category);
	Object getContent(String pid);
	Object getNewList();
	//Object getBestList();
	Object getBestProdList(String category);
}
