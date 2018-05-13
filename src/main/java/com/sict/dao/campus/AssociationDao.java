package com.sict.dao.campus;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.dao.BasicDao;
import com.sict.entity.Association;

@Repository
public class AssociationDao extends BasicDao<Association> {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Association> SelectBySaCategory(Association SaCategory) {
		return sqlSession.selectList("com.sict.dao.campus.AssociationDao.SelectBySaCategory", SaCategory);
	}

	public Association selectMaxCode(String collage_id) {
		return sqlSession.selectOne("com.sict.dao.campus.AssociationDao.selectMaxCode", collage_id);
	}

	public Association selectById1(String id) {
		return sqlSession.selectOne("com.sict.dao.campus.AssociationDao.selectById1", id);
	}

	/**
	 * 功能：通过上级部门id查出该部门所有学生会 by 李达、师杰 20160301
	 */
	public List<Association> selectByParentId(String PraentId) {
		return sqlSession.selectList("com.sict.dao.campus.AssociationDao.selectByParentId", PraentId);
	}
}
