package com.sict.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.Role;
import com.sict.entity.Teacher;
import com.sict.entity.UserRole;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 功能：相关的数据库操作 使用 @Repository 注释 UserRoleDao byccc20141021
 * 
 * */
@Repository
public class UserRoleDao extends BasicDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 查询和当前管理员相同部门，所管理的教师的姓名和权限 by吴敬国20141104
	 * 
	 * @param String
	 *            teaCode，dept_code
	 * @return List<Map<String, String>>
	 */

	public List<UserRole> selectUserRoleList(String tea_code, String dept_id) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tea_code", tea_code);
		map.put("dept_id", dept_id);

		return sqlSession.selectList(
				"com.sict.dao.UserRoleDao.selectUserRoleList", map);
	}

	/**
	 * 查询角色，没有学生角色和没有超级管理员 by吴敬国20141104
	 * 
	 * @param
	 * @return List<Role>
	 */
	public List<Role> selectRole(Role rl) {
		return sqlSession.selectList(namespace + ".selectRole", rl);
	}

	/**
	 * 更新状态 by吴敬国20141104
	 * 
	 * @param
	 * @return List<Role>
	 */
	public int updateState(Object n) {
		return sqlSession.update("com.sict.dao.UserRoleDao.updateState", n);
	}

	/**
	 * 查询这个部门不包含当前用户的没有该权限的教师 by吴敬国20141104
	 * 
	 * @param
	 * @return List<Teacher>
	 */
	public List<Teacher> selectTeacherByRoleId(String dept_id, String role_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dept_id", dept_id);
		map.put("role_id", role_id);
		return sqlSession.selectList(
				"com.sict.dao.UserRoleDao.selectTeacherByRoleId", map);
	}

	public List selectview_user_by_username(String username) {
		return sqlSession.selectList(
				"com.sict.dao.UserRoleDao.selectview_user_by_username",
				username);
	}

	/**
	 * 根据部门的id和role的id(管理员或教师等)得到用户权限 比如得到软件系有管理员权限的 by吴敬国20141104
	 * 
	 * @param String
	 *            role_id,String dept_id
	 * @return List<UserRole>
	 */

	public List<UserRole> selectUserRoleByDeptIdAndRoleId(String role_id,
			String dept_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("role_id", role_id);
		map.put("dept_id", dept_id);
		return sqlSession
				.selectList(
						"com.sict.dao.UserRoleDao.selectUserRoleByDeptIdAndRoleId",
						map);
	}

	/**
	 * 根据部门的id得到给部门所有的用户权限信息 by吴敬国20141104
	 * 
	 * @param String
	 *            String dept_id
	 * @return List<UserRole>
	 */
	public List<UserRole> selectUserRoleByDeptId(String dept_id) {
		return sqlSession.selectList(
				"com.sict.dao.UserRoleDao.selectUserRoleByDeptId", dept_id);
	}

	/**
	 * 根据用户id更新用户权限表自定义导航（custom_menu_ids）
	 * 
	 * @Description
	 * @author 吴宝
	 * @param userRole
	 * @return
	 */

	public int updatecustomMenuIds(UserRole userRole) {
		return sqlSession.update(
				"com.sict.dao.UserRoleDao.updatecustomMenuIds", userRole);
	}
	
	/**
	 * 根据学生ID查该学生已有的角色信息 by张文琪20160530
	 * 
	 * @param String
	 *            role_id,String dept_id
	 * @return List<UserRole>
	 */

	public List<UserRole> selectNowRoleByStu_Id(String stu_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stu_id", stu_id);
		return sqlSession.selectList(
				"com.sict.dao.UserRoleDao.selectnowroleByStu_Id", map);
	}

	/**
	 * 根据角色ID查该学生已有的用户 by张文琪20160601
	 * 
	 * @param String
	 *            role_id,String dept_id
	 * @return List<UserRole>
	 */

	public List<String> selectUsersByRole_Id(String role_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("role_id", role_id);
		return sqlSession.selectList(
				"com.sict.dao.UserRoleDao.selectUser_IdByRole_Id", map);
	}

	/**
	 * 根据角色ID和用户ID删除该记录 by张文琪20160601
	 * 
	 * @param String
	 *            role_id,String dept_id
	 * @return List<UserRole>
	 */

	public int deleteRoleByRole_IdAndUser_id(String user_id, String role_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("role_id", role_id);
		map.put("user_id", user_id);
		return sqlSession.delete("com.sict.dao.UserRoleDao.delete", map);
	}
}
