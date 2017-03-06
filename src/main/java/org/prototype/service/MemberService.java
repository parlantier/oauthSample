package org.prototype.service;

import org.prototype.domain.MemberVO;

public interface MemberService {

	public void joinMember(MemberVO vo)throws Exception;
	
	public boolean checkEmail(String email)throws Exception;
	
	public boolean checkNickName(String nickname)throws Exception;
	
	public void modifyPassword(MemberVO vo)throws Exception;
	
}
