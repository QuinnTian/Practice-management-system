package com.sict.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sict.entity.Student;
import com.sict.entity.Teacher;

/**
 * 权限登录成功句柄 该类为平台成功跳转到多个入口提供依据
 * 
 * @author ryuu-kk
 * 
 */

@Service
@Transactional
public class CustomAuthenticationSuccessHandler implements
		AuthenticationSuccessHandler {
	
	private static final Logger log = LoggerFactory.getLogger(CustomAuthenticationSuccessHandler.class);

	@Autowired
	private TeacherService teacherService;
	@Autowired
	private StudentService studentService;

	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {

		HttpSession session = request.getSession();
		System.out.println(request.getParameter("user_role"));
		String target = "";
		String Usertype="";//教师、学生、系统管理员、学校管理员
		String current_role_selected="";
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		log.info("---------- onAuthenticationSuccess ---------");
		log.info(userDetails.getUsername()+" 登录IP = " + getClientIp(request));
		Collection<?> authorities = userDetails.getAuthorities();//得到用户所有角色
		List userRoleList = new ArrayList();//存放登录人的权限，用于多角色选择
		StringBuffer current_user_role = new StringBuffer();
		for(Object o: authorities){	
			GrantedAuthority au = (GrantedAuthority)o;
			current_user_role.append(au.getAuthority() +";");
			
			System.out.println("----当前用户角色:"+au.getAuthority());
			if("ROLE_ADMIN".equals(au.getAuthority())
					||"ROLE_TEACHER".equals(au.getAuthority())
					||"ROLE_LEADER".equals(au.getAuthority())
					||"ROLE_COMPANY".equals(au.getAuthority())){
				Usertype = "teacher";
			}else if(au.getAuthority().contains("ROLE_ADMIN")
					||au.getAuthority().contains("ROLE_TEACHER")
					||au.getAuthority().contains("ROLE_LEADER")
					||au.getAuthority().contains("ROLE_COMPANY")){
				userRoleList.add(au.getAuthority());
				Usertype = "teacher";
				if(au.getAuthority().contains("ROLE_ADMIN_SCHOOL")){
					Usertype = "schooladmin";
				}
			}else if("ROLE_STUDENT".equals(au.getAuthority())){
				Usertype = "student";
			}else if(au.getAuthority().contains("ROLE_STUDENT")){
				userRoleList.add(au.getAuthority());
				Usertype = "student";
			}else if ("ROLE_SYS_ADMIN".equals(au.getAuthority())) {
				userRoleList.add(au.getAuthority());
				Usertype = "sysadmin";
		    }
			//如果没有上述角色，显示非法用户 byzcg 2015年1月14日
			if(Usertype=="")
			{
				log.info("非法用户角色: userDetails = "+userDetails.toString()+" authorities = "+authorities.toString());	
				target="login.jsp";
			}
			if (Usertype == "teacher" || Usertype == "sysadmin" || Usertype == "schooladmin") { // 登录成功，设置当前用户，教师类型
				Teacher tea = (Teacher)teacherService.selectByCode(userDetails.getUsername());	
				session.setAttribute("current_user", tea);//设置当前用户
				session.setAttribute("current_user_type", "teacher");//设置当前用户类型
			}
			else if(Usertype == "student")
			{
				Student stu = (Student)studentService.selectByCode(userDetails.getUsername());	
				session.setAttribute("current_user", stu);
				session.setAttribute("current_user_type", "student");
			}
			session.setAttribute("current_user_role", current_user_role);
		}
		
		if(Usertype.equals("student")){
			target="student/index.do";
			if(userRoleList.size()!=0){
				current_role_selected=userRoleList.get(0).toString();
				for(int i=0;i<userRoleList.size();i++){//如果实习，实习角色为默认角色
					if(userRoleList.get(i).toString().contains("ROLE_STUDENT_PRACTICE")){
						current_role_selected=userRoleList.get(i).toString();
					}
				}
			}else{
				current_role_selected=null;
			}
		}else if(Usertype.equals("sysadmin")){
			    target="sysadmin/index.do";
		}/*else if(Usertype.equals("schooladmin")){
			if(userRoleList.size()!=0){
				current_role_selected=userRoleList.get(0).toString();
			}
		    target="schooladmin/index.do";
		}*/
		if(Usertype.equals("teacher")){
			
			if(userRoleList.size()==0){//只有教师基础角色，没有领导、管理员其他角色
				userRoleList.add("ROLE_TEACHER");
				target="teacher/index.do";
				current_role_selected="ROLE_TEACHER";
			}else{
				current_role_selected=userRoleList.get(0).toString();
				if(userRoleList.get(0).toString().contains("ROLE_ADMIN_SCHOOL")){
					target="schooladmin/index.do";
				}else if(userRoleList.get(0).toString().contains("ROLE_TEACHER")){
					target="teacher/index.do";
				}else if(userRoleList.get(0).toString().contains("ROLE_ADMIN")){
					target="admin/index.do";
				}else if(userRoleList.get(0).toString().contains("ROLE_LEADER")){
					target="leader/index.do";
				}else if(userRoleList.get(0).toString().contains("ROLE_COMPANY")){
					target="company/index.do";
				}else{
					target="teacher/index.do";
				}
			}
		}
		/*
		 * 获取登录表单的用户名记录到cookie中
		 * 张文琪  2016-8-31
		 * */
		String name=request.getParameter("j_username");
		Cookie cookie=new Cookie("USERNAME", name);
		cookie.setPath("/");
		response.addCookie(cookie);
		
		
		
		session.setAttribute("user_role", userRoleList);
		session.setAttribute("current_role_selected", current_role_selected);
		response.sendRedirect(target);
	}

	public String getClientIp(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}

		if (ip == null)
			ip = "";
		else
			ip = ip.trim();

		return ip;
	}
}