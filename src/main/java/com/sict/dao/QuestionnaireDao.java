package com.sict.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.Questionnaire;

@Repository
public class QuestionnaireDao extends BasicDao<Questionnaire> {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
