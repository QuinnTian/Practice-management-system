package com.sict.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.SummaryQAnswer;

@Repository
public class SummaryQAnswerDao extends BasicDao<SummaryQAnswer> {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Map<String, String>> selectAnswerbyQuestionId(String id) {
		return sqlSession.selectList("com.sict.dao.SummaryQAnswerDao.selectAnswerbyQuestionId",id);
	}
}
