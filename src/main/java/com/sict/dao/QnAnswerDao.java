package com.sict.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.QnAnswer;


@Repository
public class QnAnswerDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<QnAnswer> getSelectQnAnswer(QnAnswer qna){
		return sqlSession.selectList("com.sict.dao.QnAnswerDao.select",qna);
	}
	
	public int insertQnAnswer(QnAnswer qna){
		return sqlSession.insert("com.sict.dao.QnAnswerDao.insert",qna);
	}
	public int updateQnAnswer(QnAnswer qna){
		return sqlSession.update("com.sict.dao.QnAnswerDao.update", qna);
	}
	
	public int selectQnAnswerCount(QnAnswer qna){
		return sqlSession.selectOne("com.sict.dao.QnAnswerDao.selectCount",qna);
	}
	
	public int deleteQnAnswer(QnAnswer qna){
		return sqlSession.delete("com.sict.dao.QnAnswerDao.delete", qna);
	}
	
	public QnAnswer selectByID (String id){
		return sqlSession.selectOne("com.sict.dao.QnAnswerDao.selectByID", id);
	}
	
}
