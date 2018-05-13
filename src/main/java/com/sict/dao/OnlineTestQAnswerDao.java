package com.sict.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;

import com.sict.entity.OnlineTestQAnswer;
import com.sict.entity.OnlineTestQuestionnaire;

@Repository
public class OnlineTestQAnswerDao extends BasicDao<OnlineTestQAnswer> {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int sumValidityByQnAnswerID(String qnanswer_id){
		try {
			return sqlSession.selectOne("com.sict.dao.OnlineTestQAnswerDao.sumValidity",qnanswer_id);
		} catch (Exception e) {
			return 0;
		}
	}
	
	public int sumScoreByQnAnswerID(String qnanswer_id){
		try {
			return sqlSession.selectOne("com.sict.dao.OnlineTestQAnswerDao.sumScore",qnanswer_id);
		} catch (Exception e) {
			return 0;
		}
	}
	
	public int sumScoreByQuestionType(Map<String, String> map){
		
		try {
			return sqlSession.selectOne("com.sict.dao.OnlineTestQAnswerDao.sumScoreByQuestionType",map);
		} catch (Exception e) {
			return 0;
		}
		
	}

	public int deleteByotQnAnswer_ID(String otQnAnswer_ID) {
		return sqlSession.delete("com.sict.dao.OnlineTestQAnswerDao.deleteByotQnAnswer_ID",otQnAnswer_ID);
	}
}
