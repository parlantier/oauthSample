package org.prototype.service;

import javax.inject.Inject;

import org.prototype.domain.MemberVO;
import org.prototype.persistence.MemberDAO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO memberDAO;

	@Override
	public void joinMember(MemberVO vo)throws Exception {
		// TODO Auto-generated method stub
		memberDAO.insertMember(vo);
	}

	@Override
	public boolean checkEmail(String email)throws Exception {
		// TODO Auto-generated method stub
		MemberVO member = memberDAO.getEmail(email);
		if(member != null){
			return true;
		}
		
		return false;
	}

	@Override
	public boolean checkNickName(String nickname)throws Exception {
		// TODO Auto-generated method stub
		MemberVO member = memberDAO.getNickName(nickname);
		if(member != null){
			return true;
		}
		
		return false;
	}

}
