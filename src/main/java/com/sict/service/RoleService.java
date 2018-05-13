package com.sict.service;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.sict.service.DirectRecordService;
import com.sict.dao.PracticeTaskDao;
import com.sict.dao.RoleDao;
import com.sict.entity.Org;
import com.sict.entity.Role;
import com.sict.entity.Teacher;
import com.sict.entity.UserRole;
import com.sict.util.Common;
import com.sict.util.Constants;
import com.sict.util.DateService;

/**
 * 功能：角色相关的service
 * bywjg 2015-12-22
 * 
 * */
@Repository(value = "roleService")
@Transactional
public class RoleService implements BasicService {
	@Resource
	SysRoleMenuService sysRoleMenuService;
	@Resource
	UserRoleService userRoleService;
	@Autowired
	RoleDao roleDao;
	/**
	 * 查询角色列表
	 * @param	
	 * @return  List<Role>
	 */
	public List<Role> selectList(Object o) {
		Role role=(Role)o;
		List<Role> roleList=roleDao.selectList(role);
		List<Role> newRoleList=numReturn(roleList);
		return newRoleList;
	}
	public Object insert(Object o) {
		Role s = (Role) o;
		s.setState("1");
		DictionaryService.updateRole(s);
		return roleDao.insert(s);
	}

	public int update(Object o) {
		Role s = (Role) o;
		DictionaryService.updateRole(s);
		return roleDao.update(s);
	}

	public int delete(String roleid) {
		DictionaryService.deleteRole(roleid);
		sysRoleMenuService.deleteBySrmRoleId(roleid);//删除角色对应的菜单
		return roleDao.deleteById(roleid);
	}

	public Object selectByID(String id) {
		return this.roleDao.selectByID(id);
	}

	public Object insertOrUpdate(Object o) {
		return this.roleDao.insert(roleDao);
	}

	public int selectCount(Object o) {
		return this.roleDao.selectCount(o);
	}

	public Object selectById(String id) {
		return this.roleDao.selectByID(id);// selectById(id);
	}
	
	public int delete(Object t) {
		return 0;
	}
	
	/**
	 * 根据角色的多个级别查询角色
	 * @param	String roleLevel1,String roleLevel2
	 * @return  List<Role>
	 */
	public List<Role> getRoleByRoleLevel(String roleLevel1,String roleLevel2) {
		List<Role> roleList=roleDao.getRoleByRoleLevel(roleLevel1,roleLevel2);
		List<Role> newRoleList=numReturn(roleList);
		return newRoleList;
	}
	/**
	 * 设置角色的一些逻辑字段
	 * @param	List<Role> roleList
	 * @return  List<Role>
	 */
	public List<Role> numReturn(List<Role> roleList) {
		UserRole ur = new UserRole();
		int user_num;// 定义用户数量
		for (Role r : roleList) {
			if(r.getCollege_id()!= null ){
				if (r.getCollege_id().equalsIgnoreCase("SYS")) {
					r.setCollege_name("系统");
				}else{
					r.setCollege_name(DictionaryService.findOrg(r.getCollege_id()).getOrg_name());
				}
			}
			if(r.getSchool_id()!=null){
				if (r.getSchool_id().equalsIgnoreCase("SYS")) {
					r.setSchool_name("系统");
				} else {
					r.setSchool_name(DictionaryService.findOrg(r.getSchool_id()).getOrg_name());
				}
			}
			if (r.getRole_type().equalsIgnoreCase("1")) {
				r.setRole_type_name("管理员");
			} else if (r.getRole_type().equalsIgnoreCase("2")) {
				r.setRole_type_name("教师");
			} else if (r.getRole_type().equalsIgnoreCase("3")) {
				r.setRole_type_name("学生");
			} else if (r.getRole_type().equalsIgnoreCase("4")) {
				r.setRole_type_name("领导");
			} else if (r.getRole_type().equalsIgnoreCase("5")) {
				r.setRole_type_name("公司");
			} else {
				r.setRole_type_name("其他");
			}
			ur.setRole_id(r.getId());
			user_num = userRoleService.selectCount(ur);// 查询出用户数量
			if (user_num > 0) {
				r.setIsBeOccupied(true);
			}
		}
		return roleList;
	}
	
	/**
	 * 根据角色模板的id得到由该模板生成的角色列表
	 * @param	String roleTemplateId 角色模板的id
	 * @return  List<Role>
	 */
	public List<Role> getRoleListbyRoleTemplateid(String roleTemplateId) {
		Role role=new Role();
		role.setTemp2(roleTemplateId);
		List<Role> roleList=this.selectList(role);
		return roleList;
	}
	/**
	 * 根据角色模板建立一个学校的角色
	 * @param	String roleTemplate_id,String school_id,String college_id,HttpSession session
	 * @return  String
	 */
	public String saveSchoolRoleByRoleTemplate(String roleTemplate_id,String school_id,HttpSession session) {
		Role roleTemplate=DictionaryService.findRole(roleTemplate_id);
		Org school=DictionaryService.findOrg(school_id);
		
		String role_code=this.getSchoolRoleCode(roleTemplate_id, school_id);
		Role r=new Role();
		r.setId(role_code);
		int num=this.selectCount(r);
		if(num == 0){ //已经有的不要重复
			Role role=new Role();
			role.setId(role_code);
			role.setRole_code(role_code);
			role.setRole_type(roleTemplate.getRole_type());
			role.setRole_name(school.getOrg_name()+roleTemplate.getRole_name());
			role.setRole_desc(school.getOrg_name()+roleTemplate.getRole_name());
			role.setSchool_id(school_id);
			Teacher tea = (Teacher) session.getAttribute("current_user");
			role.setCreate_tea(tea.getId());
			//role.setCollege_id();
			role.setCreate_time(DateService.getNowTimeTimestamp());
			role.setState(Constants.STATE_USERD);
			role.setTemp1(Constants.ROLE_LEVEL_THREE);
			role.setTemp2(roleTemplate_id);
			this.insert(role);
			sysRoleMenuService.saveSysRoleMenuByRoleTemplateId(roleTemplate_id, role_code);
		}
		return "";
	}
	/**
	 * 得到学校的角色编码命名规则   编码规则：角色模板编码_学校编码
	 * @param	String roleTemplate_id,String school_id
	 * @return  
	 */
	public String getSchoolRoleCode(String roleTemplate_id,String school_id) {
		String role_code=null;
		role_code=DictionaryService.findRole(roleTemplate_id).getRole_code()+"_"+DictionaryService.findOrg(school_id).getOrg_code();
		return role_code;
	}
	/**
	 * 根据角色模板建立一个学院的角色
	 * @param	String roleTemplate_id,String school_id,String college_id,HttpSession session
	 * @return  
	 */
	public String saveRoleByRoleTemplate(String roleTemplate_id,String school_id,String college_id,HttpSession session) {
		Role roleTemplate=DictionaryService.findRole(roleTemplate_id);
		Org college=DictionaryService.findOrg(college_id);
		String role_code=this.getRoleCode(roleTemplate_id, school_id, college_id);
		Role r=new Role();
		r.setId(role_code);
		int num=this.selectCount(r);
		if(num==0){
			Role role=new Role();
			role.setId(role_code);
			role.setRole_code(role_code);
			role.setRole_type(roleTemplate.getRole_type());
			role.setRole_name(college.getOrg_name()+roleTemplate.getRole_name());
			role.setRole_desc(college.getOrg_name()+roleTemplate.getRole_name());
			role.setSchool_id(school_id);
			Teacher tea = (Teacher) session.getAttribute("current_user");
			role.setCreate_tea(tea.getId());
			role.setCollege_id(college_id);
			role.setCreate_time(DateService.getNowTimeTimestamp());
			role.setState(Constants.STATE_USERD);
			role.setTemp1(Constants.ROLE_LEVEL_THREE);
			role.setTemp2(roleTemplate_id);
			this.insert(role);
			sysRoleMenuService.saveSysRoleMenuByRoleTemplateId(roleTemplate_id, role_code);
		}
		
		return "";
	}
	/**
	 * 得到学院的角色编码   编码规则：角色模板编码_学校编码学院编码
	 * @param	String roleTemplate_id,String school_id,String college_id
	 * @return  
	 */
	public String getRoleCode(String roleTemplate_id,String school_id,String college_id) {
		String role_code=null;
		role_code=DictionaryService.findRole(roleTemplate_id).getRole_code()+"_"+DictionaryService.findOrg(school_id).getOrg_code()
				+DictionaryService.findOrg(college_id).getOrg_code();
		return role_code;
	}
	/**
	 * 根据学院id和角色类别查询这个角色列表
	 * @param	String college_id,String role_type
	 * @return  List<Role>
	 */
	public List<Role> selectByCollegeId(String college_id,String role_type) {
		return this.roleDao.selectByCollegeId(college_id,role_type);
	}
	/**
	 * 根据角色模板id和学院id查找由该模板生成的角色
	 * @param	String college_id,String roleTemplate_id
	 * @return  Role
	 */
	public Role getRoleByColegeIdAndRoleTemplateId(String college_id,String roleTemplate_id) {
		List<Role> roleList = this.selectByCollegeId(college_id, roleTemplate_id);
		Role role=new Role();
		if (roleList.size() > 0) {
			role = roleList.get(0);
		}
		return role;
	}
	
	
	public Role SelectRoleByUseID(String UserId,String Rolecode){
		return roleDao.selectRoleByUseID(UserId, Rolecode);
	}
	
	
	
	
	
	
	//---------------------------------以下方法没有整理
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public Object addRoleCode(Role role) {
		String role_code;
		if(role.getRole_type().equalsIgnoreCase("1")){
			role_code="ROLE_ADMIN_";
		}else if(role.getRole_type().equalsIgnoreCase("2")){
			role_code="ROLE_TEACHER_";
		}else if(role.getRole_type().equalsIgnoreCase("3")){
			role_code="ROLE_STUDENT_";
		}else if(role.getRole_type().equalsIgnoreCase("4")){
			role_code="ROLE_LEADER_";
		}else if(role.getRole_type().equalsIgnoreCase("5")){
			role_code="ROLE_COMPANY_";
		}else {
			role_code="ROLE_OTHER_";
		}
		//role_code +=DictionaryService.findOrg(role.getSchool_id()).getOrg_code();
		role_code =role_code+"SZ";
		role_code +=DictionaryService.findOrg(role.getCollege_id()).getOrg_code();
		role.setRole_code(role_code);
		
		return role;
	}
	
	
	
	//根据学院id初始化基础的角色信息和角色菜单---在校生的时候应该还要加上其他的一些默认角色2016-3-4
	public Object saveBasicRoleByCollegeId(String college_id) {
        String college_code=DictionaryService.findOrg(college_id).getOrg_code();
        String college_name=DictionaryService.findOrg(college_id).getOrg_name();
		String [] BasicRole=
			{"ROLE_ADMIN_EMPLOYMENT","ROLE_LEADER_COLLEGE","ROLE_STUDENT_PRACTICE","ROLE_TEACHER_PRACTICE"};
		String [] BasicRoleName ={
			"学院就业教师","学院领导","校外实习学生","实习指导教师"};
		String [] BasicRoleType ={
				"1","4","3","2"};
		Role role=new Role();
		for(int i=0;i<BasicRole.length;i++){
			String role_code=BasicRole[i]+"_SZ"+college_code;
			role.setId(role_code);
			role.setRole_code(role_code);
			role.setRole_name(college_name+BasicRoleName[i]);
			role.setRole_desc(college_name+BasicRoleName[i]);
			role.setRole_type(BasicRoleType[i]);
			role.setCreate_time(DateService.getNowTimeTimestamp());
			role.setCreate_tea("1");
			role.setSchool_id("szxy");
			role.setCollege_id(college_id);
			role.setTemp1("3");
			this.insert(role);
			sysRoleMenuService.saveMenuForRoleByTemptlet(role_code, BasicRole[i]);
		}
		return "";
	}
	/**
	 * 按照学院ID找全部学生的角色 张文琪 2016-5-30
	 * 
	 */
	public List<Role> selectStuList(String college_id) {

		List<Role> roleList = roleDao.selectByOnlyCollegeId(college_id);
		// List<Role> newRoleList = numReturn(roleList);
		return roleList;
	}

}
