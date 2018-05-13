package com.sict.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.OnlineTestQuestion;

@Repository
public class OnlineTestQuestionDao extends BasicDao<OnlineTestQuestion>{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
