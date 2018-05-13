package com.sict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.sict.service.DirectRecordService;
import com.sict.util.Common;
import com.sict.dao.SysRoleMenuDao;
import com.sict.entity.Role;
import com.sict.entity.SysRoleMenu;

/**
 * 功能：角色菜单对应相关的service 使用 @Repository
 * 
 * */
@Repository(value = "sysRoleMenuService")
@Transactional
public class SysRoleMenuService implements BasicService {

	@Autowired
	SysRoleMenuDao sysRoleMenuDao;

	public List<SysRoleMenu> selectList(Object o) {
		SysRoleMenu srm = (SysRoleMenu) o;
		return sysRoleMenuDao.selectList(srm);
	}

	public Object insert(Object o) {
		SysRoleMenu s = (SysRoleMenu) o;
		s.setId(Common.returnUUID());
		return sysRoleMenuDao.insert(s);
	}

	public int update(Object o) {
		return sysRoleMenuDao.update(o);
	}

	public int delete(Object o) {
		return sysRoleMenuDao.delete(o);
	}

	public Object selectByID(String id) {
		return this.sysRoleMenuDao.selectByID(id);
	}

	public Object insertOrUpdate(Object o) {
		return this.sysRoleMenuDao.insert(sysRoleMenuDao);
	}

	public int selectCount(Object o) {
		return this.sysRoleMenuDao.selectCount(o);
	}

	public Object selectById(String id) {
		return this.sysRoleMenuDao.selectByID(id);
	}

	/**
	 * 保存该角色对应的菜单
	 * @param	String role_id, String[] sysMenu 菜单数组
	 * @return  String
	 */
	public String insertSysRoleMenuBySrmRoleId(String role_id, String[] sysMenu) {
		SysRoleMenu srm = new SysRoleMenu();
		// 循环插入到数据库中
		if (sysMenu != null) {
			for (int i = 0; i < sysMenu.length; i++) {
				srm.setSrm_menu_id(sysMenu[i]);
				srm.setSrm_role_id(role_id);
				this.insert(srm);
			}
		}
		return null;
	}
	
	/**
	 * 根据角色id更新这个角色对应的菜单，先删除之前对应的菜单，在把新选择的菜单加上
	 * @param	String role_id 角色id, String[] sysMenu 菜单数组
	 * @return  String
	 */
	public String updateSysRoleMenuBySrmRoleId(String role_id, String[] sysMenu) {
		SysRoleMenu sysRoleMenu=new SysRoleMenu();
		sysRoleMenu.setSrm_role_id(role_id);
		List<SysRoleMenu> menuIdList = this.selectList(sysRoleMenu);// 查询出该角色所对应的菜单ID
		for (SysRoleMenu l : menuIdList) {
			this.delete(l);
		}// 删除数据库原有的对应菜单
		this.insertSysRoleMenuBySrmRoleId(role_id, sysMenu);
		return null;
	}
	
	/**
	 * 根据角色模板的菜单列表同步 要同步的角色数组 里角色的菜单
	 * @param String[] rolelist 要同步的角色数组, String[] sysMenu 角色模板的菜单列表
	 * @return  
	 */
	public String synchronousRole(String[] rolelist, String[] sysMenu) {
		for(int i=0;i<rolelist.length;i++){
			String role_id=rolelist[i];
			this.updateSysRoleMenuBySrmRoleId(role_id, sysMenu);
		}
		return null;
	}
	
	/**
	 * 把角色模板的菜单 复制给目标角色
	 * @param	String roleTemplate_id, String role_id
	 * @return  
	 */
	public String saveSysRoleMenuByRoleTemplateId(String roleTemplate_id, String role_id) {
		SysRoleMenu srm=new SysRoleMenu();
		srm.setSrm_role_id(roleTemplate_id);
		List<SysRoleMenu> sysRoleMenuList = this.selectList(srm);//取出模板对应的菜单列表
		//this.insertSysRoleMenuBySrmRoleId(role_id, sysRoleMenuList); list转数组
		SysRoleMenu sysRoleMenu = new SysRoleMenu();
		if (sysRoleMenuList != null) {
			for (int i = 0; i < sysRoleMenuList.size(); i++) {
				sysRoleMenu.setSrm_menu_id(sysRoleMenuList.get(i).getSrm_menu_id());
				sysRoleMenu.setSrm_role_id(role_id);
				this.insert(sysRoleMenu);// 循环添加新的对应菜单
			}
		}
		return null;
	}
	
	/**
	 * 根据角色id删除这个角色下的所有菜单
	 * @param	
	 * @return  
	 */
	public int deleteBySrmRoleId(String SRM_ROLE_ID) {
		return this.sysRoleMenuDao.deleteBySrmRoleId(SRM_ROLE_ID);
	}
	
	
	
	
	
	
	//---------------------------------以下方法没有整理
	/**
	 * 给角色分配学院管理员菜单 根据角色模板获得学院管理员的角色对应的菜单 方法过时
	 * @param	
	 * @return  
	 */
	/*public Object saveMenuForRole(String collegeAdminRole) {
		SysRoleMenu srm = new SysRoleMenu();
		srm.setSrm_role_id("ROLE_ADMIN_COLLEGE");
		List<SysRoleMenu> sysRoleMenuList = this.selectList(srm);
		for (SysRoleMenu s : sysRoleMenuList) {
			SysRoleMenu sr = new SysRoleMenu();
			sr.setId(Common.returnUUID());
			sr.setSrm_menu_id(s.getSrm_menu_id());
			sr.setSrm_role_id(collegeAdminRole);
			this.insert(sr);
		}
		return "1";
	}*/

	/**
	 * 给角色分配菜单
	 * @param	
	 * @return  
	 */
	public Object saveMenuForRoleByTemptlet(String role_id, String Temptlet) {
		SysRoleMenu srm = new SysRoleMenu();
		srm.setSrm_role_id(Temptlet);
		List<SysRoleMenu> sysRoleMenuList = this.selectList(srm);
		for (SysRoleMenu s : sysRoleMenuList) {
			SysRoleMenu sr = new SysRoleMenu();
			sr.setSrm_menu_id(s.getSrm_menu_id());
			sr.setSrm_role_id(role_id);
			this.insert(sr);
		}
		return "1";
	}
}
