package com.sict.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.Option;
import com.sict.entity.SummaryOption;

@Repository
public class SummaryOptionDao extends BasicDao<SummaryOption> {

	@Autowired
	private SqlSessionTemplate sqlSession;
	public int selectOptionCount(Option o) {
		return sqlSession.selectOne("com.sict.dao.SummaryOptionDao.selectCount",o);
	}
}
