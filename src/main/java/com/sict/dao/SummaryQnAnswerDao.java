package com.sict.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.SummaryQnAnswer;

@Repository
public class SummaryQnAnswerDao extends BasicDao<SummaryQnAnswer> {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Map<String, Object>> selectQuestionAndAnanswerBySummaryQnAnswerID(String summaryQnAnswerID){
		
		return sqlSession.selectList("com.sict.dao.SummaryQnAnswerDao.selectQuestionAndAnanswerByUserID",summaryQnAnswerID);
		
	}
     public int selectCountWhereEndDateisnotnull(SummaryQnAnswer sq){
		
		return sqlSession.selectOne("com.sict.dao.SummaryQnAnswerDao.selectCountWhereEndDateisnotnull",sq);
		
	}
}
