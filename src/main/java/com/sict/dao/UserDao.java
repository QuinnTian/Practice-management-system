package com.sict.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.SummaryQnAnswer;
import com.sict.entity.User;

@Repository
public class UserDao extends BasicDao<User> {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public List<User> selectBySummaryQnAnswer(SummaryQnAnswer summaryQnAnswer){
		
		return sqlSession.selectList("com.sict.dao.UserDao.selectBySummaryQnAnswer",summaryQnAnswer);
		
	}
	
}
