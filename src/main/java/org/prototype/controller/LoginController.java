package org.prototype.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/login/*")
public class LoginController {

	@RequestMapping(value="/APIExamNaverLogin")
	public void examLogin(){
		
	}
	
	@RequestMapping(value="/callback")
	public void callback(){
		
	}
	
}
