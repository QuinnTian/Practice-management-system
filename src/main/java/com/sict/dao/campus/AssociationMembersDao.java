package com.sict.dao.campus;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.dao.BasicDao;
import com.sict.entity.AssociationMembers;

@Repository
public class AssociationMembersDao extends BasicDao<AssociationMembers> {
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 功能：通过学生会id查询此学生会所有成员 by 李达、师杰 20160329
	 */
	public List<AssociationMembers> selectStusByAssId(String AssId) {
		return sqlSession.selectList("com.sict.dao.campus.AssociationMembersDao.selectStusByAssId", AssId);
	}

	/**
	 * 通过当前学生id获取所在学生会id 师杰 2016-04-13
	 */
	public Object selectByStuId(String stuId) {
		return sqlSession.selectOne("com.sict.dao.campus.AssociationMembersDao.selectByStuId", stuId);
	}
}
