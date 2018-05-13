package com.sict.util;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.sict.entity.Role;
import com.sict.service.LookUpService;
import com.sict.dao.RoleDao;
/**
 * 没用的，准备后边删除 郑春光 2015年3月11日
 * 
 */
public class StartUpListener extends ContextLoaderListener
implements ServletContextListener{


 	RoleDao roleDao;
 	LookUpService lookUpService;
	public void contextInitialized(ServletContextEvent event) {
		 

//        super.contextInitialized(event);

        ServletContext context = event.getServletContext();

        ApplicationContext ctx =
            WebApplicationContextUtils.getRequiredWebApplicationContext(context);

		 this.lookUpService=(LookUpService)ctx.getBean("lookUpService");
		 this.roleDao=(RoleDao)ctx.getBean("roleDao");
		 
	     setupContext( ctx, context );
	    }
	
	

    /**
     * 获取全部对象列表，并且放入到应用程序的缓存中
     * @param ctx		应用程序上下文
     * @param application	服务器上下文
     */
    public  void setupContext( ApplicationContext ctx, ServletContext application) {
//        LookupManager lookupManager = (LookupManager)ctx.getBean( "lookupManager" );

	 	List list = new ArrayList();
		Role role=new Role();
		List roles = roleDao.selectList(role);
        // get listof possible roles
		application.setAttribute( Constants.AVAILABLE_ROLES, roles );
        ArrayList roleList = (ArrayList)application.getAttribute(Constants.AVAILABLE_ROLES);
        Role sysRole = null;
    	for( int i = 0; i < roleList.size(); i++ )
		{
			sysRole = ( Role )roleList.get( i );
			application.setAttribute( sysRole.getRole_code(), sysRole.getRole_name() );
		}

    	lookUpService.getAllUsers(application);
    	/*lookUpService.getAllTeachers(application);
    	lookUpService.getAllOrgs(application);*/
    }
    
    
    
    
}
