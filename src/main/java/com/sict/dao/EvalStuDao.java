package com.sict.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.EvalStu;
@Repository
public class EvalStuDao extends BasicDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<EvalStu> selectByStuid(String stu_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.sict.dao.EvalStuDao.selectByStuid",stu_id);
	}
	
}
