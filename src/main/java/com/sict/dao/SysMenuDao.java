package com.sict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.Student;
import com.sict.entity.SysMenu;

/**
 * 功能：相关的数据库操作 使用 @Repository 注释 RoleDao bywtt20141103 *
 * 
 * */
@Repository
public class SysMenuDao extends BasicDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<SysMenu> selectByRoleId(String role_id) {
		List<SysMenu> list = sqlSession.selectList(
				"com.sict.dao.SysMenuDao.selectByRoleId", role_id);
		return list;
	}
	/**
	 * 根据角色id 和 父菜单id 查询所有子菜单的列表
	 * @Description
	 * @param String role_id,String praent_id
	 * @return List<SysMenu>
	 */
	public List<SysMenu> selectByRoleIdAndPraentId(String role_id,
			String praent_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("role_id", role_id);
		map.put("praent_id", praent_id);
		List<SysMenu> list = sqlSession.selectList("com.sict.dao.SysMenuDao.selectByRoleIdAndPraentId", map);
		return list;
	}

	/**
	 * 根据角色id查菜单资源表且 为可用 且为一级菜单
	 * 
	 * @Description
	 * @author 吴宝
	 * @param srm_role_id
	 *            角色id
	 * @return 菜单资源list
	 */

	public List<SysMenu> selectListByRoleId(String srm_role_id) {
		List<SysMenu> list = sqlSession.selectList(
				"com.sict.dao.SysMenuDao.selectListByRoleId", srm_role_id);
		return list;
	}

	/**
	 * 根据角色id查菜单资源表且为可用且SM_SHORTCUT_KEY（是否为快捷键）为1
	 * 
	 * @Description
	 * @author 吴宝
	 * @param srm_role_id
	 *            角色id
	 * @return 菜单资源list
	 */

	public List<SysMenu> selectListByRoleIdMP(String srm_role_id) {
		List<SysMenu> list = sqlSession.selectList(
				"com.sict.dao.SysMenuDao.selectListByRoleIdMP", srm_role_id);
		return list;
	}
}
