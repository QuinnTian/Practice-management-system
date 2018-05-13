package com.sict.interceptor;

import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sict.authority.AuthorityHelper;
import com.sict.authority.AuthorityType;
import com.sict.authority.FireAuthority;
import com.sict.authority.ResultTypeEnum;

public class AuthorityAnnotationInterceptor extends HandlerInterceptorAdapter {

	final Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HandlerMethod handler2=(HandlerMethod) handler;
		FireAuthority fireAuthority = handler2.getMethodAnnotation(FireAuthority.class);
	
		if(null == fireAuthority){
			//没有声明权限,放行
			return true;
		}
		
		logger.debug("fireAuthority", fireAuthority.toString());
		
		HttpSession session = request.getSession();
		String user_role = null;
		try {
			user_role = session.getAttribute("current_user_role").toString();
		} catch (Exception e) {
			// TODO: handle exception
		}
		boolean aflag = false;
		
		for(AuthorityType at:fireAuthority.authorityTypes()){
			if(AuthorityHelper.hasAuthority(at.getType(), user_role)==true){
				aflag = true;
				break;
			}
		}
		
		if(false == aflag){
			if (fireAuthority.resultType() == ResultTypeEnum.page) {
		//采用传统页面进行提示
				request.getRequestDispatcher("/login.jsp");
//				StringBuilder sb = new StringBuilder();
//				sb.append(request.getContextPath());
//				sb.append("/index.jsp?result=没有权限");
//				response.sendRedirect(sb.toString());
			}
			
			return false;
			
		}
		
		return true;

	}
	
}
