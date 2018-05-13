package com.sict.common;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.sict.entity.OnlineTestQuestionnaire;
import com.sict.entity.Student;
import com.sict.entity.Teacher;
import com.sict.entity.User;
import com.sict.service.DictionaryService;
import com.sict.service.StudentService;
import com.sict.service.TeacherService;
import com.sict.service.UserService;

@Component
public class CommonSession {

	public static String queryResultValue(HttpServletRequest request){
		Map<String, ?> map = RequestContextUtils.getInputFlashMap(request);
		if(map!=null){
			return (String) map.get("result");
		}else{
			return "";
		}
	}
	
	
	/**
	 * 判断一个用户是否存在，如果存在返回一个对象，否则返回一个空对象,并设置这个用户的用户类型（学生，老师）
	 * @param name
	 * @param pwd
	 * @return
	 */
	public static User queryUser(String name,String pwd,HttpSession session,UserService userService){
		
		User user = new User();
		user.setS_t_code(name);
		user.setLogin_pass(pwd);
		List<User> users = userService.selectList(user);
		if(users.size()>0){
			user =  users.get(0);
			return user;
		}else{
			return null;
		}
	}
	
	/**
	 * 设置一个用户的类型和用户，是老师还是学生
	 * @param user
	 * @param session
	 */
	public static void setUserInfo(User user,HttpSession session,StudentService studentService,TeacherService teacherService){
		
		int studentNum = studentService.selectCountById(user.getId());
		if(studentNum > 0){
			session.setAttribute("current_user_type", "student");
			Student student = studentService.selectByID(user.getId());
			session.setAttribute("current_user", student);
			return;
		}
		if(teacherService.selectCountByID(user.getId()) > 0){
			session.setAttribute("current_user_type", "teacher");
			session.setAttribute("current_user", teacherService.selectByID(user.getId()));
			return;
		}
	}
	
	
	/**
	 * 获取一个用户的类型，是学生还是老师还是管理员。
	 * @param session
	 * @return
	 */
	public static String getUserType(HttpSession session){
		
		return (String) session.getAttribute("current_user_type");
		
	}
	
	/**
	 * 获取一个用户
	 * @param session
	 * @return
	 */
	public static User getUser(HttpSession session,UserService userService){
		
		String type = getUserType(session);
		String id = null;
		if("teacher".equals(type)){
			Teacher t = (Teacher) session.getAttribute("current_user");
			id = t.getId();
		}else if("student".equals(type)){
			Student s = (Student) session.getAttribute("current_user");
			id = s.getId();
		}
		if(id != null){
			User user = userService.selectByID(id);
			if(id.length()==16){
				user.setOrg_id(DictionaryService.findTeacher(id).getDept_id());
			}else{
				user.setOrg_id(DictionaryService.findStudent(id).getClass_id());
			}
			return user;
		}else{
			return null;
		}
	}
	
	
	public static OnlineTestQuestionnaire getOTestQuestionnaire(HttpSession session){
		return (OnlineTestQuestionnaire) session.getAttribute("otQuestionnaire");
	}
	
	
	
	/**
	 * 当前的用户权限
	 * @param session
	 * @return
	 */
	public static String getUserRole(HttpSession session) {

		return (String) session.getAttribute("nowUserRole");
	}
	
	/**
	 * 设置当前的用户权限
	 * @param session
	 * @return
	 */
	public static void setUserRole(HttpSession session,String roleName) {
		session.setAttribute("nowUserRole",roleName);
	}

	public static String roleTeacher = "ROLE_TEACHER";
	public static String roleAdmin = "ROLE_ADMIN";
	public static String roleStudent = "ROLE_STUDENT";
	public static String roleLeader = "ROLE_LEADER";
	
	
	/**
	 * 是否是教师
	 * @param session
	 * @return
	 */
	public static boolean isRoleTeacher(HttpSession session) {
		if (roleTeacher.equals(getUserRole(session))) {
			return true;
		} else {
			return false;
		}
	}

	public static boolean isRoleAdmin(HttpSession session) {
		if (roleAdmin.equals(getUserRole(session))) {
			return true;
		} else {
			return false;
		}
	}
	
	public static boolean isRoleStudent(HttpSession session) {
		if (roleStudent.equals(getUserRole(session))) {
			return true;
		} else {
			return false;
		}
	}
	
	public static boolean isRoleLeader(HttpSession session) {
		if (roleLeader.equals(getUserRole(session))) {
			return true;
		} else {
			return false;
		}
	}

}
