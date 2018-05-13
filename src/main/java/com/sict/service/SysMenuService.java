package com.sict.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.SysMenuDao;
import com.sict.entity.Role;
import com.sict.entity.SysMenu;
import com.sict.entity.SysRoleMenu;
import com.sict.util.Common;

/**
 * 功能：菜单相关的service 
 * 
 * */
@Repository(value = "sysMenuService")
@Component("sysMenuService")
@Transactional
public class SysMenuService implements BasicService {
	@Autowired
	SysMenuDao sysMenuDao;
	@Resource
	SysRoleMenuService sysRoleMenuService;
	@Resource
	RoleService roleService;

	public Object insert(Object o) {
		SysMenu sm = (SysMenu) o;
		sm.setId(Common.returnUUID());
		DictionaryService.updateSysmenu(sm);
		return this.sysMenuDao.insert(sm);
	}

	public int update(Object o) {
		SysMenu sm = (SysMenu) o;
		DictionaryService.updateSysmenu(sm);
		return sysMenuDao.update(sm);
	}

	public int delete(Object t) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Object selectByID(String id) {
		return this.sysMenuDao.selectByID(id);
	}

	public Object insertOrUpdate(Object o) {
		// TODO Auto-generated method stub
		return this.sysMenuDao.insert(sysMenuDao);
	}

	public int selectCountByID(String id) {
		// TODO Auto-generated method stub
		SysMenu t = new SysMenu();
		t.setId(id);
		return this.sysMenuDao.selectCount(t);
	}

	public int selectCount(Object o) {
		// TODO Auto-generated method stub
		return this.sysMenuDao.selectCount(o);
	}

	public Object selectByCode(String code) {
		// TODO Auto-generated method stub
		return this.sysMenuDao.selectByCode(code);
	}
	/**
	 * 查询菜单
	 * @Description
	 * @param Object o
	 * @return List<SysMenu>
	 */
	public List selectList(Object o) {
		List<SysMenu> sysMenuList = sysMenuDao.selectList(o);
		List<SysMenu> newSysMenuList=setLogicalField(sysMenuList);
		return newSysMenuList;
	}
	/**
	 * 设置一些逻辑字段
	 * @Description
	 * @param List<SysMenu> sysMenuList
	 * @return List<SysMenu>
	 */
	public List<SysMenu> setLogicalField(List<SysMenu> sysMenuList) {
		for (SysMenu s : sysMenuList) {
			String smPaarent = s.getSm_parent();
			if (!smPaarent.trim().equalsIgnoreCase("无")) {
				SysMenu sysMenu = (SysMenu) selectByID(smPaarent);
				s.setSm_parent_name(sysMenu.getSm_name());
			}
			if (s.getSm_is_top().equalsIgnoreCase("1")) {
				s.setSm_istop_name("一级菜单");
			} else if (s.getSm_is_top().equalsIgnoreCase("2")) {
				s.setSm_istop_name("二级菜单");
			} else if (s.getSm_is_top().equalsIgnoreCase("3")) {
				s.setSm_istop_name("三级菜单");
			} else if (s.getSm_is_top().equalsIgnoreCase("4")) {
				s.setSm_istop_name("四级菜单");
			}

			if (s.getTemp1().equalsIgnoreCase("1")) {
				s.setSm_sort_name("管理员");
			} else if (s.getTemp1().equalsIgnoreCase("2")) {
				s.setSm_sort_name("教师");
			} else if (s.getTemp1().equalsIgnoreCase("3")) {
				s.setSm_sort_name("学生");
			} else if (s.getTemp1().equalsIgnoreCase("4")) {
				s.setSm_sort_name("领导");
			} else if (s.getTemp1().equalsIgnoreCase("5")) {
				s.setSm_sort_name("公司");
			} else {
				s.setSm_sort_name("其他");
			}
			
			if(s.getSm_used().equalsIgnoreCase("1")){
				s.setIsused("有效");
			}else{
				s.setIsused("无效");
			}
			
		}
		return sysMenuList;
	}
	/**
	 * 根据父菜单id查询所有子菜单列表
	 * @Description
	 * @param String id 父菜单id
	 * @return List<SysMenu>
	 */
	public List<SysMenu> selectListByParentId(String id) {
		SysMenu sm = new SysMenu();
		sm.setSm_parent(id);
		List<SysMenu> sysMenuList = sysMenuDao.selectList(sm);
		return sysMenuList;
	}
	/**
	 * 根据角色的类别得到所有的一级菜单列表，然后给各级菜单设置是否为叶子节点、子菜单的列表、子孩子 的数量
	 * 
	 * @Description
	 * @param Object o （SysMenu sysmenu）
	 *                  sysmenu.setTemp1(role_type);
						sysmenu.setSm_is_top(Constants.SYSMENU_LEVEL_ONE);
						sysmenu.setSm_used(Constants.SYSMENU_USERD);
	 * @return List<SysMenu>
	 */
	public List<SysMenu> selectTopMenuListByRoleType(Object o) {
		List<SysMenu> sysMenuList = sysMenuDao.selectList(o);
		for (int i = 0; i < sysMenuList.size(); i++) {
			if (sysMenuList.get(i).getSm_name().contains("首页")
					|| sysMenuList.get(i).getSm_name().contains("个人")
					|| sysMenuList.get(i).getSm_name().contains("帮")
					|| sysMenuList.get(i).getSm_name().contains("我们")
					|| sysMenuList.get(i).getSm_name().contains("密码")) {
				sysMenuList.remove(i);
			}
		}
		for (SysMenu s : sysMenuList) {
			List<SysMenu> smChildList = selectListByParentId(s.getId());
			if (smChildList.size() > 0) {
				for (int i = 0; i < smChildList.size(); i++) {
					List<SysMenu> twoList = selectListByParentId(smChildList
							.get(i).getId());
					if (twoList.size() > 0) {
						smChildList.get(i).setIsleaf(false);
						smChildList.get(i).setSysMenuList(twoList);
						smChildList.get(i).setChildSysMenuNum(twoList.size());
					} else {
						smChildList.get(i).setIsleaf(true);
						smChildList.get(i).setSysMenuList(null);
						smChildList.get(i).setChildSysMenuNum(0);
					}
				}
				s.setChildSysMenuNum(smChildList.size());
				s.setIsleaf(false);
				s.setSysMenuList(smChildList);
			} else {
				s.setIsleaf(true);
				s.setSysMenuList(null);
				s.setChildSysMenuNum(0);
			}
			if (s.getTemp1().equalsIgnoreCase("1")) {
				s.setSm_sort_name("管理员");
			} else if (s.getTemp1().equalsIgnoreCase("2")) {
				s.setSm_sort_name("教师");
			} else if (s.getTemp1().equalsIgnoreCase("3")) {
				s.setSm_sort_name("学生");
			} else if (s.getTemp1().equalsIgnoreCase("4")) {
				s.setSm_sort_name("领导");
			} else if (s.getTemp1().equalsIgnoreCase("5")) {
				s.setSm_sort_name("公司");
			} else {
				s.setSm_sort_name("其他");
			}
		}
		return sysMenuList;
	}

	/**
	 * 角色对应菜单 的拼接方法
	 * @Description
	 * @author 
	 * @param List<SysMenu> sysMenuList
	 * @return StringBuffer
	 */
	public StringBuffer StringBufferWithSysMenu(List<SysMenu> sysMenuList) {
		StringBuffer sb = new StringBuffer();
		sb.append("<table border='1' width='100%'>");
		sb.append("<tr><td>用户角色资源</td><td><table border='1'  width='100%'>");
		for (SysMenu s : sysMenuList) {
			sb.append("<tr id='" + s.getId() + "'>");
			sb.append("<td>");
			sb.append("<div class='checkbox'>");
			sb.append("<label>");
			sb.append("<input type='checkbox' name='roleMenu' onclick=\"return allSelect('"
					+ s.getId()
					+ "',this.checked)\" value='"
					+ s.getId()
					+ "'>" + s.getSm_name() + "</label>");
			/*
			 * sb.append("<td><input type='button' value='删除' onclick=\"doDel('"
			 * + s.getId() + " ')\"></td>");
			 */
			sb.append("</div>");
			sb.append("</td>");
			if (s.isIsleaf()) {
				sb.append("<td></td>");
			}
			if (!s.isIsleaf()) {
				sb.append("<td><table border='1' width='100%'>");
				List<SysMenu> sysMenuTwo = s.getSysMenuList();
				for (SysMenu two : sysMenuTwo) {
					sb.append("<tr id='" + two.getId() + "'>");
					sb.append("<td>");
					sb.append("<div class='checkbox'>");
					sb.append("<label>");
					sb.append("<input type='checkbox' name='roleMenu' onclick=\"return allSelect('"
							+ two.getId()
							+ "',this.checked)\" value='"
							+ two.getId()
							+ "'>"
							+ two.getSm_name()
							+ "</label>");
					sb.append("</div>");
					sb.append("</td>");
					if (two.isIsleaf()) {
						sb.append("<td width='50%'></td>");
					}
					if (!two.isIsleaf()) {
						sb.append("<td>");
						sb.append("<table  width='100%'>");
						List<SysMenu> sysMenuThree = two.getSysMenuList();
						for (SysMenu three : sysMenuThree) {
							sb.append("<tr>");
							sb.append("<td>");
							sb.append("<div class='checkbox'>");
							sb.append("<label>");
							sb.append("<input type='checkbox' name='roleMenu' onclick=\"return allSelect('"
									+ three.getId()
									+ "',this.checked)\" value='"
									+ three.getId()
									+ "'>"
									+ three.getSm_name()
									+ "</label>");
							sb.append("</div>");
							sb.append("</td>");
							sb.append("</tr>");
						}
						sb.append("</table>");
						sb.append("</td>");
					}
					sb.append("</tr>");
				}
				sb.append("</table>");
				sb.append("</td>");
			}
			sb.append("</tr>");
		}
		sb.append("</table>");
		sb.append("</td>");
		sb.append("</tr>");
		sb.append("</table>");
		
		
		return sb;
	}
	/**
	 * 下拉列表的拼接方法
	 * @Description
	 * @author 
	 * @param List<SysMenu> sysMenuList
	 * @return StringBuffer
	 */
	public StringBuffer ajaxGetParentMenu(List<SysMenu> sysMenuList) {
		StringBuffer sb = new StringBuffer();
		sb.append("<option value='" +"无"+ "'>"+"无"+"</option>");
		for (SysMenu s : sysMenuList) {
			sb.append("<option value='" + s.getId() + "'>"+s.getSm_code()+"-"+s.getSm_sort_name()+"-"+s.getSm_name()+"</option>");
		}
		return sb;
	}
	
	/**
	 * 根据角色id得到这个角色对应的角色
	 * @Description
	 * @param String role_id 角色id
	 * @return List<SysMenu>
	 */
	public List<SysMenu> getSysMenuByRoleId(String role_id) {
		List<SysMenu> sysMenuList=selectListByRoleTypeAndId(role_id);
		List<String> pass_name = new ArrayList<String>();// 过滤掉基本菜单。
		pass_name.add("首页");
		pass_name.add("个人信息");
		pass_name.add("帮助");
		pass_name.add("联系我们");
		pass_name.add("管理员首页");
		List<SysMenu> sysMenuLists = new ArrayList();
		for (SysMenu n : sysMenuList) {
			if (!pass_name.contains(n.getSm_name())) {
				sysMenuLists.add(n);
			}
		}
		return sysMenuLists;
	}
	/**
	 * 根据角色id查询该角色对应的所有菜单列表，查询该角色类别对应的所有菜单列表，并且标注哪些角色是已经选中的
	 * @Description
	 * @param String role_id
	 * @return List<SysMenu>
	 */
	public List<SysMenu> selectListByRoleTypeAndId(String role_id) {
		SysMenu sysmenu = new SysMenu();
		Role role =(Role) roleService.selectById(role_id);
		String temp1 = role.getRole_type();
		sysmenu.setTemp1(temp1);// 角色状态
		sysmenu.setSm_used("1");
		List<SysMenu> sysMenuList = sysMenuDao.selectList(sysmenu);// all
		SysRoleMenu srm=new SysRoleMenu();
		srm.setSrm_role_id(role_id);
		List<SysRoleMenu> menuIdList =sysRoleMenuService.selectList(srm);
		for (SysMenu s : sysMenuList) {
			if (s.getSm_is_top().equals("1")) {
				for (SysRoleMenu l : menuIdList) {// 根据条件循环修改ischecked的状态，分三个级别
					if (s.getId().equals(l.getSrm_menu_id())) {
						s.setIschecked(true);
					}
				}
				List<SysMenu> smChildList = selectListByParentId(s.getId());
				if (smChildList.size() > 0) {
					for (int i = 0; i < smChildList.size(); i++) {
						for (SysRoleMenu l : menuIdList) {
							if (smChildList.get(i).getId()
									.equals(l.getSrm_menu_id())) {
								smChildList.get(i).setIschecked(true);
							}
						}
						List<SysMenu> twoList = selectListByParentId(smChildList
								.get(i).getId());
						if (twoList.size() > 0) {
							for (int j = 0; j < twoList.size(); j++) {
								for (SysRoleMenu l : menuIdList) {
									if (twoList.get(j).getId()
											.equals(l.getSrm_menu_id())) {
										twoList.get(j).setIschecked(true);
									}
								}
							}
							smChildList.get(i).setIsleaf(false);
							smChildList.get(i).setSysMenuList(twoList);
							smChildList.get(i).setChildSysMenuNum(
									twoList.size());
						} else {
							smChildList.get(i).setIsleaf(true);
							smChildList.get(i).setSysMenuList(null);
							smChildList.get(i).setChildSysMenuNum(0);
						}
					}
					s.setChildSysMenuNum(smChildList.size());
					s.setIsleaf(false);
					s.setSysMenuList(smChildList);
				} else {
					s.setIsleaf(true);
					s.setSysMenuList(null);
					s.setChildSysMenuNum(0);
				}
			}
		}
		return sysMenuList;
	}
	/**
	 * 组装sm_code的方法
	 * @Description
	 * @param String role_id 角色id
	 * @return List<SysMenu>
	 */
	public String installSmCode(String temp1,String sm_OneNum,String sm_TwoNum,String sm_ThreeNum) {
		String sm_code;
		/* if(sysMenu.getSm_code().equals("") || sysMenu.getSm_code()==null ){ */
		if (temp1.equalsIgnoreCase("1")) {
			sm_code = "admin";
		} else if (temp1.equalsIgnoreCase("2")) {
			sm_code = "tea";
		} else if (temp1.equalsIgnoreCase("3")) {
			sm_code = "stu";
		} else if (temp1.equalsIgnoreCase("4")) {
			sm_code = "leader";
		} else if (temp1.equalsIgnoreCase("5")) {
			sm_code = "com";
		} else {
			sm_code = "other";
		}
		if (!(sm_OneNum.equals("无") || sm_OneNum == null)) {
			sm_code = sm_code + sm_OneNum;
		}
		if (!(sm_TwoNum.equals("无") || sm_TwoNum == null)) {
			sm_code = sm_code + sm_TwoNum;
		}
		if (!(sm_ThreeNum.equals("无") || sm_ThreeNum == null)) {
			sm_code = sm_code + sm_ThreeNum;
		}
		return sm_code;
	}
	
	
	
	//---------------------------------以下方法没有整理
	
	
	/**
	 * 根据角色id 查询所有的一级菜单，然后给各级菜单设置是否为叶子节点、子菜单的列表、子孩子 的数量   没用
	 * @Description
	 * @param String role_id 角色id
	 * @return List<SysMenu>
	 */
	public List<SysMenu> selectByRoleId(String role_id) {
		List<SysMenu> sysMenuList = this.sysMenuDao.selectByRoleId(role_id);// 一级菜单
		for (SysMenu s : sysMenuList) {
			List<SysMenu> smChildList = sysMenuDao.selectByRoleIdAndPraentId(
					role_id, s.getId());
			if (smChildList.size() > 0) {
				for (int i = 0; i < smChildList.size(); i++) {
					List<SysMenu> twoList = sysMenuDao
							.selectByRoleIdAndPraentId(role_id, smChildList
									.get(i).getId());
					if (twoList.size() > 0) {
						smChildList.get(i).setIsleaf(false);
						smChildList.get(i).setSysMenuList(twoList);
						smChildList.get(i).setChildSysMenuNum(twoList.size());
					} else {
						smChildList.get(i).setIsleaf(true);
						smChildList.get(i).setSysMenuList(null);
						smChildList.get(i).setChildSysMenuNum(0);
					}
				}
				s.setChildSysMenuNum(smChildList.size());
				s.setIsleaf(false);
				s.setSysMenuList(smChildList);
			} else {
				s.setIsleaf(true);
				s.setSysMenuList(null);
				s.setChildSysMenuNum(0);
			}
		}
		return sysMenuList;
	}
	
	/**
	 * 根据一级菜单去查找所有子菜单
	 * 
	 * @Description
	 * @author 吴宝
	 * @param list
	 *            一级菜单list
	 * @return
	 */
	public List<SysMenu> selectListCustomMenuBySysMeunList(List<SysMenu> list) {
		List<SysMenu> sysMenuList = list;
		for (int i = 0; i < sysMenuList.size(); i++) {
			if (!sysMenuList.get(i).getSm_page().equals("#")) {
				sysMenuList.remove(i);
			}
		}

		for (SysMenu s : sysMenuList) {// 根据一级菜单去查寻二级菜单
			List<SysMenu> smChildList = selectListByParentId(s.getId());
			if (smChildList.size() > 0) {
				for (int i = 0; i < smChildList.size(); i++) {// 根据二级菜单去查询三级菜单
					List<SysMenu> twoList = selectListByParentId(smChildList
							.get(i).getId());
					if (twoList.size() > 0) {
						smChildList.get(i).setIsleaf(false);
						smChildList.get(i).setSysMenuList(twoList);
						smChildList.get(i).setChildSysMenuNum(twoList.size());
					} else {
						smChildList.get(i).setIsleaf(true);
						smChildList.get(i).setSysMenuList(null);
						smChildList.get(i).setChildSysMenuNum(0);
					}
				}
				s.setChildSysMenuNum(smChildList.size());
				s.setIsleaf(false);
				s.setSysMenuList(smChildList);
			} else {
				s.setIsleaf(true);
				s.setSysMenuList(null);
				s.setChildSysMenuNum(0);
			}
			if (s.getTemp1().equalsIgnoreCase("1")) {
				s.setSm_sort_name("管理员");
			} else if (s.getTemp1().equalsIgnoreCase("2")) {
				s.setSm_sort_name("教师");
			} else if (s.getTemp1().equalsIgnoreCase("3")) {
				s.setSm_sort_name("学生");
			} else if (s.getTemp1().equalsIgnoreCase("4")) {
				s.setSm_sort_name("领导");
			} else if (s.getTemp1().equalsIgnoreCase("5")) {
				s.setSm_sort_name("公司");
			} else {
				s.setSm_sort_name("其他");
			}
		}
		return sysMenuList;
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
		return sysMenuDao.selectListByRoleId(srm_role_id);
	}

	/**
	 * 根据角色id获得所有子菜单
	 * 
	 * @Description
	 * @author 吴宝
	 * @param srm_role_id
	 * @return 所有子菜单
	 */

	public List<SysMenu> getAllListMenu(String srm_role_id) {
		List<SysMenu> list = this.selectListByRoleId(srm_role_id);
		List<SysMenu> listall = this.selectListCustomMenuBySysMeunList(list);
		return listall;
	}
	/**
	 * 根据角色id查菜单资源表且为可用且SM_SHORTCUT_KEY（是否为快捷键）为1
	 * @Description
	 * @author 吴宝
	 * @param srm_role_id
	 *            角色id
	 * @return 可以为快捷菜单的列表（手机）
	 */

	public List<SysMenu> selectListByRoleIdMP(String srm_role_id) {
		return sysMenuDao.selectListByRoleIdMP(srm_role_id);
	}
	
	// 暂时不用
	/*public List selectListByRoleType(Object o) {
		List<SysMenu> sysMenuList = sysMenuDao.selectList(o);
		for (SysMenu s : sysMenuList) {
			if (s.getSm_is_top().equalsIgnoreCase("1")) {
				List<SysMenu> smChildList = selectListByParentId(s.getId());
				s.setChildSysMenuNum(smChildList.size());
				if (smChildList.size() == 0) {
					s.setIsleaf(true);
				} else {
					s.setIsleaf(false);
				}
				s.setSysMenuList(smChildList);
			} else if (s.getSm_is_top().equalsIgnoreCase("2")) {
				List<SysMenu> smChildList = selectListByParentId(s.getId());
				s.setChildSysMenuNum(smChildList.size());
				if (smChildList.size() == 0) {
					s.setIsleaf(true);
				} else {
					s.setIsleaf(false);
				}
				s.setSysMenuList(smChildList);
			} else if (s.getSm_is_top().equalsIgnoreCase("3")) {
				List<SysMenu> smChildList = selectListByParentId(s.getId());
				s.setChildSysMenuNum(smChildList.size());
				if (smChildList.size() == 0) {
					s.setIsleaf(true);
				} else {
					s.setIsleaf(false);
				}
				s.setSysMenuList(smChildList);
			} else if (s.getSm_is_top().equalsIgnoreCase("4")) {
			}

			if (s.getTemp1().equalsIgnoreCase("1")) {
				s.setSm_sort_name("管理员");
			} else if (s.getTemp1().equalsIgnoreCase("2")) {
				s.setSm_sort_name("教师");
			} else if (s.getTemp1().equalsIgnoreCase("3")) {
				s.setSm_sort_name("学生");
			} else if (s.getTemp1().equalsIgnoreCase("4")) {
				s.setSm_sort_name("领导");
			} else if (s.getTemp1().equalsIgnoreCase("5")) {
				s.setSm_sort_name("公司");
			} else {
				s.setSm_sort_name("其他");
			}
		}
		return sysMenuList;
	}*/
	
}
