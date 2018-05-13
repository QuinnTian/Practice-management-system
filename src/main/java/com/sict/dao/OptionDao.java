package com.sict.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.Option;
import com.sict.entity.Question;

@Repository
public class OptionDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Object> getSelectOption(Option o) {
		return sqlSession.selectList("com.sict.dao.OptionDao.selectOption", o);
	}

	public int insertOption(Option o) {
		return sqlSession.insert("com.sict.dao.OptionDao.insertOption", o);
	}
	
	public int updateQuestion(Option o) {
		return sqlSession.update("com.sict.dao.OptionDao.updateOption", o);
	}

	public int selectOptionCount(Option o) {
		return sqlSession.selectOne("com.sict.dao.OptionDao.selectOptionCount",
				o);
	}

	public int deleteOption(Option o) {
		return sqlSession.delete("com.sict.dao.OptionDao.deleteOption", o);
	}
	
	public int deleteOptionByQid(String qId){
		return sqlSession.delete("com.sict.dao.OptionDao.deleteOptionByQid", qId);
	}
}
