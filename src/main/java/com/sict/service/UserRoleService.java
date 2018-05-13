package com.sict.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.UserRoleDao;
import com.sict.entity.Role;
import com.sict.entity.Teacher;
import com.sict.entity.UserRole;
import com.sict.util.Common;

/**
 * 功能：..相关的service 使用 @Repository 注释 UserRoleDao byccc20141103 *
 * 
 * 
 * */
@Repository(value = "userRoleService")
@Transactional
public class UserRoleService implements BasicService {
	@Autowired
	UserRoleDao userRoleDao;

	public List selectList(Object o) {
		// TODO Auto-generated method stub
		return this.userRoleDao.selectList(o);
	}

	public Object insert(Object o) {
		int a = 0;
		UserRole ur = (UserRole) o;
		int userroleCount = this.selectCount(ur);// 判断用户之前有没有这个角色
		if (userroleCount == 0) {
			ur.setId(Common.returnUUID());
			ur.setState("1");
			a = userRoleDao.insert(ur);
			DictionaryService.updateUserRole(ur);
			return a;
		} else {
			return null;
		}
	}

	public int update(Object o) {
		int a = 0;
		UserRole p = (UserRole) o;
		a = userRoleDao.update(p);
		DictionaryService.updateUserRole(p);
		return a;
	}

	public int delete(Object o) {
		int a = 0;
		UserRole p = (UserRole) o;
		a = userRoleDao.delete(p);
		DictionaryService.deleteUserRole(p.getId());
		return a;
	}

	public Object selectByID(String id) {
		// TODO Auto-generated method stub
		return userRoleDao.selectByCode(id);
	}

	public Object insertOrUpdate(Object o) {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectCount(Object o) {
		UserRole p = (UserRole) o;
		return userRoleDao.selectCount(p);
	}

	/**
	 * 更新状态 by吴敬国20141104
	 * 
	 * @param
	 * @return List<Role>
	 */
	public int updateState(Object o) {

		return userRoleDao.updateState(o);
	}

	/**
	 * 查询和当前管理员相同部门，所管理的教师的姓名和权限 by吴敬国20141104
	 * 
	 * @param String
	 *            teaCode，dept_code
	 * @return List<Map<String, String>>
	 */
	public List<UserRole> selectUserRoleList(String tea_code, String dept_id) {
		return this.userRoleDao.selectUserRoleList(tea_code, dept_id);

	}

	/**
	 * 查询角色，没有学生角色和没有超级管理员 by吴敬国20141104
	 * 
	 * @param
	 * @return List<Role>
	 */
	public List<Role> selectRole(Role rl) {
		return this.userRoleDao.selectRole(rl);
	}

	/**
	 * 查询这个部门不包含当前用户的没有该权限的教师 by吴敬国20141104
	 * 
	 * @param
	 * @return List<Teacher>
	 */
	public List<Teacher> selectTeacherByRoleId(String dept_id, String role_id) {
		List<Teacher> teacherlist = this.userRoleDao.selectTeacherByRoleId(
				dept_id, role_id);
		return teacherlist;
	}

	public List selectview_user_by_username(String username) {
		return this.userRoleDao.selectview_user_by_username(username);
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
		return this.userRoleDao.selectUserRoleByDeptIdAndRoleId(role_id,
				dept_id);
	}

	/**
	 * 根据部门的id得到给部门所有的用户权限信息 
	 * by吴敬国20141104
	 * 
	 * @param String dept_id
	 * @return List<UserRole>
	 */
	public List<UserRole> selectUserRoleByDeptId(String dept_id) {
		return this.userRoleDao.selectUserRoleByDeptId(dept_id);
	}

	/**
	 * 保存用户基本角色类型 by吴敬国2016-1-11
	 * 
	 * @param
	 * @return List<UserRole>
	 */
	public String saveBasicUserRole(String user_id, String basic_admin,
			String basic_teacher, String basic_student, String basic_leader,
			String basic_company) {

		if (basic_admin != null) {
			UserRole adminUR = new UserRole();
			adminUR.setUser_id(user_id);
			adminUR.setRole_id("ROLE_ADMIN");
			this.insert(adminUR);
		}
		if (basic_teacher != null) {
			UserRole teacherUR = new UserRole();
			teacherUR.setUser_id(user_id);
			teacherUR.setRole_id("ROLE_TEACHER");
			this.insert(teacherUR);
		}
		if (basic_student != null) {
			UserRole studentUR = new UserRole();
			studentUR.setUser_id(user_id);
			studentUR.setRole_id("ROLE_STUDENT");
			this.insert(studentUR);
		}
		if (basic_leader != null) {
			UserRole leaderUR = new UserRole();
			leaderUR.setUser_id(user_id);
			leaderUR.setRole_id("ROLE_LEADER");
			this.insert(leaderUR);
		}
		if (basic_company != null) {
			UserRole companyUR = new UserRole();
			companyUR.setUser_id(user_id);
			companyUR.setRole_id("ROLE_COMPANY");
			this.insert(companyUR);
		}
		return null;
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
		return userRoleDao.updatecustomMenuIds(userRole);
	}

	/**
	 * 给用户添加角色
	 * */
	public String saveUserRole(String user_id, String role_id) {
		UserRole userRole = new UserRole();
		userRole.setRole_id(role_id);
		userRole.setUser_id(user_id);
		this.insert(userRole);
		return null;
	}
	
	/*
	 * 
	 * 找某学生已有的角色——张文琪
	 */
	public List<UserRole> selectNowRoleByStu_Id(String stu_id) {
		return userRoleDao.selectNowRoleByStu_Id(stu_id);
	}
	
	/*
	 * 
	 * 根据角色ID找所有的用户ID——张文琪
	 */
	public List<String> selectUsersByStu_Id(String role_id) {
		return userRoleDao.selectUsersByRole_Id(role_id);
	}

	/*
	 * 
	 * 根据角色ID和用户ID删除记录——张文琪
	 */
	public int deleteByUser_idAndStu_Id(String user_id, String role_id) {
		return userRoleDao.deleteRoleByRole_IdAndUser_id(user_id, role_id);
	}
	
	
	
	
}
