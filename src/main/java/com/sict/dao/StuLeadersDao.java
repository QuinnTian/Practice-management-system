package com.sict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.StuLeaders;

@Repository
public class StuLeadersDao extends BasicDao<StuLeaders> {
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 根据Year和当前辅导员ID查询出该班级的所有学生干部
	public List<StuLeaders> selectListByCOUNSELOR_IDAndYear(String COUNSELOR_ID, String Year) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("COUNSELOR_ID", COUNSELOR_ID);
		map.put("Year", Year);
		return sqlSession.selectList("com.sict.dao.StuLeadersDao.selectListByCOUNSELOR_IDAndYear", map);
	}

}
