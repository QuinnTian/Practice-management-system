package com.sict.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sict.entity.QAnswer;

@Repository
public class QAnswerDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<QAnswer> getSelectQAnswer(QAnswer qa){
		return sqlSession.selectList("com.sang.dao.QAnswerDao.selectQAnswer",qa);
	}
	
	public int insertQAnswer(QAnswer qa){
		return sqlSession.insert("com.sang.dao.QAnswerDao.insertQAnswer",qa);
	}
	public int updateQAnswer(QAnswer qa){
		return sqlSession.update("com.sang.dao.QAnswerDao.updateQAnswer", qa);
	}
	
	public int selectQAnswerCount(QAnswer qa){
		return sqlSession.selectOne("com.sang.dao.QAnswerDao.selectQAnswerCount",qa);
	}
	
	public int deleteQAnswer(QAnswer qa){
		return sqlSession.delete("com.sang.dao.QAnswerDao.deleteQAnswer", qa);
	}
	
	public int deleteQAnswerByAll(QAnswer qa){
		return sqlSession.delete("com.sang.dao.QAnswerDao.deleteQAnswerByAll", qa);
	}
	
	public int distinctQAnswerQuestion_id(QAnswer qa){
		return sqlSession.selectOne("com.sang.dao.QAnswerDao.distinctQAnswerQuestion_id",qa);
	}
	
	public int distinctQAnswerCount(QAnswer qa){
		return sqlSession.selectOne("com.sang.dao.QAnswerDao.distinctQAnswerCount",qa);
	}
}
