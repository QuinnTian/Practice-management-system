package com.sict.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sict.entity.Question;
import com.sict.entity.Questionnaire;

@Repository
public class QuestionDao extends BasicDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List selectAllIdByQn_id(String id){
		return sqlSession.selectList("com.sict.dao.QuestionDao.selectAllIdByQn_id",id);
	}
}
