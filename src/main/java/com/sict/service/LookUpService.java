package com.sict.service;

/*
 * 
 * 
 * =========================================================================== 
 /*
 * @(#)E-FUTURE VPM , V1.0
 * 
 * =========================================================================== 
 * (C)版权所有： 1997,2007 北京富基旋风. 保留所有相关权利.
 * ===========================================================================
 */

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.RoleDao;
import com.sict.dao.StudentDao;
import com.sict.entity.Role;
import com.sict.entity.Student;
import com.sict.util.Constants;



/**
 * 没用的，准备后边删除 郑春光 2015年3月11日
 * 
 */
/**
 * 查找管理器实现类.
 * <p>
 * 和持久层通信的业务服务接口的实现.
 * </p>
 * <p>
 * <a href="LookupManager.java.html"> <i>View Source </i> </a>
 * </p>
 * 
 * @author System
 */
@Repository(value = "lookupService")
@Transactional
public class LookUpService{
	
	/**
	 * 注入dao
	 */
	@Autowired
    RoleDao roleDao ;
	/**
	 * 注入dao
	 */
	@Autowired@Qualifier("studentDao")
    StudentDao stuDao ;
	//~ Instance fields
	// ========================================================

	
	/**
	 * 从持久层获取所有可能的角色.
	 * 
	 * @return List 角色集
	 * @see com.LookupService.vpm.basic.service.LookupManager#getAllRoles()
	 */
	public List getAllRoles() {
		List list = new ArrayList();
		Role role=new Role();
		List roles = roleDao.selectList(role);
		Role sysRole = null;
		
		for( int i = 0; i < roles.size(); i++ )
		{
			sysRole = ( Role )roles.get( i );
			System.out.println("-----------sysRole.getRole_name()-------"+sysRole.getRole_name());
		}
		

		return list;
	}
	
	/**
	 * 获取全部用户列表
	 */
	public void getAllUsers(ServletContext application)
	{
	 	List list = new ArrayList();
	 	Student stu=new Student();
	 	
		List stuList = stuDao.selectList(stu);//获取全部用户
		
      /*  // get listof possible roles
		application.setAttribute( Constants.USER_LIST, stus );
        ArrayList stuList = (ArrayList)application.getAttribute(Constants.USER_LIST);*/
    	//全部用户存map
       HashMap usersMap = new HashMap();

        if (usersMap == null) {
        	usersMap = new HashMap();
       }
        
        for( int i = 0; i < stuList.size(); i++ )
		{
		stu = ( Student )stuList.get( i );
			usersMap.put(stu.getStu_code(), stu);
		}
       //map存入application
		application.setAttribute( Constants.USER_LIST, usersMap );
    	
	}
	
}
