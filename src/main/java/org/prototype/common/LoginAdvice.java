package org.prototype.common;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.request.ServletWebRequest;

@Aspect
@Service
public class LoginAdvice {

	private static final Logger logger = 
			LoggerFactory.getLogger(LoginAdvice.class);
	
	/*@Before("LoginPointcut.loginPoint()")
	public void loginAdvice(JoinPoint jp){*/
		
		// 리다이렉트 코드 RequestContextHolder.curre
		/*HttpServletRequest request = ((ServletRequestAttributes)ntRequestAttributes()).getRequest();
		System.out.println("어드바이스 체크1: " + request);
		ServletWebRequest servletWebRequest=new ServletWebRequest(request);
		System.out.println("체크2:" + servletWebRequest);
		HttpServletResponse response=servletWebRequest.getResponse();
		System.out.println("체크 3: " + response);
		System.out.println("어드바이스 실행");*/
		/*ServletWebRequest servletContainer = (ServletWebRequest)RequestContextHolder.getRequestAttributes();

    	HttpServletRequest request = servletContainer.getRequest();

    	HttpServletResponse response = servletContainer.getResponse();*/

		/*HttpServletResponse resp = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getResponse();
		System.out.println("주소확인: " + resp);
		
		try {
			resp.sendRedirect("/views/home");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
	
	/*@Around("LoginPointcut.loginPoint()")
	public Object around(ProceedingJoinPoint joinPoint)throws Throwable{
		
		System.out.println("어라운드 시작");
		Object obj = joinPoint.proceed();
		System.out.println("끝");
		
		HttpServletResponse resp = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getResponse();
		System.out.println("주소확인: " + resp);
		resp.sendRedirect("/");
		
		
		return obj;
	}*/
	
	
	
	
	
	
	
	
	
}
