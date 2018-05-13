package com.sict.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.OnlineTestQuestionnaire;

@Repository
public class OnlineTestQuestionnaireDao extends BasicDao<OnlineTestQuestionnaire> {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
