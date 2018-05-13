package com.sict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.SummaryQuestion;
import com.sict.entity.Teacher;

@Repository
public class SummaryQuestionDao extends BasicDao<SummaryQuestion> {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * wjg 2015-7-26
	 * */
	public List<SummaryQuestion> selectByQuestionnaireId(String questionnaire_id,String type_student) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("questionnaire_id", questionnaire_id);
		map.put("type_student", type_student);
		return sqlSession.selectList("com.sict.dao.SummaryQuestionDao.selectByQuestionnaireId", map);
	}
}
