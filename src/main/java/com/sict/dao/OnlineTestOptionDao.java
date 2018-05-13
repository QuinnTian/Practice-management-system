package com.sict.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.OnlineTestOption;

@Repository
public class OnlineTestOptionDao extends BasicDao<OnlineTestOption> {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
