package com.sict.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.TeaCourses;

@Repository
public class TeaCoursesDao extends BasicDao<TeaCourses> {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
