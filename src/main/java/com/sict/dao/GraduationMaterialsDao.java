package com.sict.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.GraduationMaterials;
import com.sict.entity.UserCheck;

/**
 * 功能：就业材料相关的数据库操作
 * 使用 @Repository 注释GraduationMaterialsDao
 * by ccc 20141030	
 *    wjg 2015-6-4  
 */
@Repository
public class GraduationMaterialsDao extends BasicDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<GraduationMaterials> selectByState(UserCheck m) {
		return sqlSession.selectList("com.sict.dao.GraduationMaterialsDao.selectByState",m);
	}

}
