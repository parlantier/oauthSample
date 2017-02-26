package org.prototype.controller;

import static org.junit.Assert.assertTrue;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.prototype.domain.MemberVO;
import org.prototype.service.MemberService;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class TestAuth {

	@Inject
	private MemberService service;
	
	@Inject
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setUp(){
		mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
		
	}
	
	@Test
	@Ignore
	public void test() throws Exception {

		MemberVO vo = new MemberVO();
		vo.setAge(21);
		vo.setEmail("aby113@naver.com");
		vo.setNickname("오후의아침");
		vo.setPassword("비밀번호486");
		vo.setSex("여");
		service.joinMember(vo);
	}

	@Test
	@Ignore
	public void checkEmail()throws Exception{
		
		assertTrue(service.checkEmail("adh113@naver.com"));
	}
	
	@Test
	@Ignore
	public void checkNickname()throws Exception{
		
		assertTrue(service.checkNickName("오후"));
	}
	
	@Test
	@Ignore
	public void controllerTest() throws Exception{
		
		mockMvc.perform(get("/test"))
		.andDo(print());
	}
	
	
	
	
}
