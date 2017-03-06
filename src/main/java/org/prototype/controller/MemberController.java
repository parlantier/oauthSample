package org.prototype.controller;

import javax.inject.Inject;

import org.prototype.domain.MemberVO;
import org.prototype.service.MemberService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {

	@Inject
	private MemberService service;

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinMember(MemberVO vo) throws Exception {

		service.joinMember(vo);

		return "redirect:/";
	}

	@ResponseBody
	@RequestMapping(value = "/checkEmail", method = RequestMethod.POST)
	public ResponseEntity<String> checkEmail(@RequestBody MemberVO vo) {

		ResponseEntity<String> entity = null;
		String result = "0";
		try {

			if(service.checkEmail(vo.getEmail()))result = "1";
			System.out.println("결과값: "+result);
			entity = new ResponseEntity<>(result, HttpStatus.OK);
			
		} catch (Exception e) {

			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@ResponseBody
	@RequestMapping(value = "/checkNickname", method = RequestMethod.POST)
	public ResponseEntity<String> checkNickname(@RequestBody MemberVO vo) {

		ResponseEntity<String> entity = null;
		String result = "0";
		try {

			if(service.checkNickName(vo.getNickname()))result = "1";
			
			entity = new ResponseEntity<>(result, HttpStatus.OK);
			
		} catch (Exception e) {

			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value="/modifyPassword/{email}", method = RequestMethod.GET)
	public ModelAndView passwordPage(@PathVariable("email") String email, ModelAndView mv){
		System.out.println("요청받음");
		mv.addObject("email", email);
		mv.setViewName("/member/password");
		return mv;
	}
	
	@RequestMapping(value="/modifyPassword", method = RequestMethod.POST)
	public String modifyPasswordPOST(MemberVO vo)throws Exception{
		
		service.modifyPassword(vo);
		
		return "redirect:/";
	}
	
}
