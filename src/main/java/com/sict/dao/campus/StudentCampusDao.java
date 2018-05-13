package com.sict.dao.campus;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.sict.dao.StudentDao;


/**
 * 功能：在校生学生相关的数据库操作 
 *  @Repository  注入StudentCampusDao
 * 
 * */
@Repository(value="studentCampusDao")@Qualifier("studentCampusDao")
public class StudentCampusDao extends StudentDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	

}
