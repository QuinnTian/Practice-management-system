package com.sict.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.OnlineTestQnAnswer;
import com.sict.entity.OnlineTestQuestionnaire;

@Repository
public class OnlineTestQnAnswerDao extends BasicDao<OnlineTestQnAnswer> {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
