package org.prototype.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.prototype.domain.MemberVO;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Inject
	private SqlSession sqlSession;

	private final String namespace = "org.prototype.mapper.MemberMapper";
	
	@Override
	public void insertMember(MemberVO vo)throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".insertMember", vo);
	}

	@Override
	public MemberVO getMember(MemberVO vo)throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getMember", vo);
	}

	@Override
	public MemberVO getEmail(String email) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getEmail", email);
	}

	@Override
	public MemberVO getNickName(String nickname) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getNickName", nickname);
	}

	
	
	
	
	
	
}
