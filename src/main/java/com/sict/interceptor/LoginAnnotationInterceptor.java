package com.sict.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sict.authority.Login;
import com.sict.authority.ResultTypeEnum;
import com.sict.common.CommonSession;
import com.sict.entity.User;
import com.sict.service.StudentService;
import com.sict.service.TeacherService;
import com.sict.service.UserService;
import com.sict.util.Common;

public class LoginAnnotationInterceptor extends HandlerInterceptorAdapter {
	
	@Resource(name = "userService")
	private UserService userService;
	@Resource(name = "studentService")
	private StudentService studentService;
	@Resource(name = "teacherService")
	private TeacherService teacherService;

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		HandlerMethod handler2 = (HandlerMethod) handler;
		Login login = handler2.getMethodAnnotation(Login.class);

		if (null == login) {
			// 没有声明权限,放行
			return true;
		}
		HttpSession session = request.getSession();
		String user_type = (String) session.getAttribute("current_user_type");
		
		if(user_type == null){
			String name = request.getParameter("name");
			String pwd = request.getParameter("pwd");
			if(name != null && pwd != null){
				User user = CommonSession.queryUser(name, pwd, session, userService);
				if(user != null){
					CommonSession.setUserInfo(user, session, studentService, teacherService);
				}
				return true;
			}
		}
		
		
		if (null == user_type || "".equals(user_type) || user_type.isEmpty()) {
			// 需要登录
			if (login.value() == ResultTypeEnum.page) {
				// 采用传统页面进行登录提示
				request.getRequestDispatcher("/login.jsp").forward(
						request, response);
			}
			return false;
		}
		return true;

	}

}
