package org.prototype.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/sample/*")
public class SampleController {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(SampleController.class);

	@RequestMapping(value="/forGuest")
	public void forGuest(){
		
		logger.info("forGuest");
	}
	
	@RequestMapping(value="/forMember")
	public void forMember(){
		logger.info("forMember");
	}
	
	@RequestMapping(value="/forManager")
	public void forManager(){
		logger.info("forManager");
	}
	
	@RequestMapping(value="/forAdmin")
	public void forAdmin(){
		logger.info("forAdmin");
	}
	
	
}
