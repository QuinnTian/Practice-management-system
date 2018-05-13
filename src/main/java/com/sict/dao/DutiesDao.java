package com.sict.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.Duties;

@Repository
public class DutiesDao extends BasicDao<Duties> {
	@Autowired
	private SqlSessionTemplate sqlSession;

}
