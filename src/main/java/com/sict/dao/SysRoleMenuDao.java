package com.sict.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.SysRoleMenu;

/**
 * 功能：相关的数据库操作 使用 @Repository 注释 RoleDao bywtt20141103 *
 * 
 * */
@Repository
public class SysRoleMenuDao extends BasicDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	public int deleteBySrmRoleId(String SRM_ROLE_ID){
		return sqlSession.delete("com.sict.dao.SysRoleMenuDao.deleteBySrmRoleId",SRM_ROLE_ID);
		}
}
