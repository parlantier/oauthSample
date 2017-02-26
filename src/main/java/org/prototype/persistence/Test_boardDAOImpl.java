package org.prototype.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.prototype.domain.Test_boardVO;
import org.springframework.stereotype.Repository;

@Repository
public class Test_boardDAOImpl implements Test_boardDAO {

	@Inject
	private SqlSession sqlSession;
	
	private final String namespace = "org.prototype.mapper.Test_boardMapper";
	
	public void insertTest_board(Test_boardVO vo){
		sqlSession.selectList(namespace+".insertTest_board", vo);
	}
	
	
	
	
	
	
}
