package org.prototype.service;

import javax.inject.Inject;

import org.prototype.domain.Test_boardVO;
import org.prototype.persistence.Test_boardDAO;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.CookieValue;

@Service
public class Test_boardServiceImpl implements BoardService {

	@Inject
	public Test_boardDAO dao;
	
	
	public void insert(Test_boardVO vo){
		
		dao.insertTest_board(vo);
	}
	
	
	
	
	
	
}
