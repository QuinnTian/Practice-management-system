package com.sict.biz;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.StudentDao;
import com.sict.dao.TeacherDao;
import com.sict.entity.Student;
import com.sict.entity.Teacher;
import com.sict.service.DictionaryService;

@Service
public class StuBind {

	@Resource@Qualifier("studentDao")
	StudentDao studentDao;
	@Resource
	TeacherDao teacherDao;
	/***
	 * 通过微信号查找单个学生byWx by孟凡朕 20140917
	 * 
	 * @param wx_code
	 * @return
	 */
	public String selectByWx(String wx_code) {

		System.out.println(wx_code);
		List<Student> stu = studentDao.selectByWx(wx_code);

		if (stu.size() == 1) {
			return "true";
		} else if (stu.size() == 0) {
			return "false";
		} else {
			return "no";
		}
	}

	/***
	 * 通过微信号查找单个老师byWx 邢志武 2015年6月24日 
	 * 
	 * @param wx_code
	 * @return
	 */
	public String selectTeacherByWx(String wx_code) {

		System.out.println(wx_code);
		List<Teacher> tea = teacherDao.selectTeacherByWx(wx_code);

		if (tea.size() == 1) {
			return "true";
		} else if (tea.size() == 0) {
			return "false";
		} else {
			return "no";
		}
	}
	/***
	 * 绑定微信号与学生账号 by孟凡朕 20140917
	 * 
	 * @param stu_code
	 * @return
	 */
	public String studentBind(String wx_code, String stu_code,
			String true_name, String id_card, String login_pass) {

		System.out.println(wx_code);

		String id = isStudent(stu_code, true_name, id_card, login_pass);

		if (id.equals("false")) {
			return "false";
		} else {
			studentDao.studentBind(wx_code, id);
			Student student=DictionaryService.findStudent(id);
			student.setWx_code(wx_code);
			DictionaryService.updateStudent(student);
			String s = selectByWx(wx_code);
			if (s.equals("true")) {
				return "true";
			} else if (s.equals("false")) {
				return "no";
			} else {
				return "falseD";// if (s.equals("no"))
			}
		}

	}
	
	/***
	 * 绑定微信号与老师账号 邢志武 2015年6月24日 
	 * 
	 * @param stu_code
	 * @return
	 */
	public String TeacherBind(String wx_code, String tea_code,
			String true_name, String login_pass) {

		System.out.println(wx_code);

		String id = isTeacher(tea_code, true_name, login_pass);

		if (id.equals("false")) {
			return "false";
		} else {
			teacherDao.teacherBind(wx_code, id);
			Teacher teacher=DictionaryService.findTeacher(id);
			teacher.setWx_code(wx_code);
			DictionaryService.updateTeacher(teacher);
			String s = selectTeacherByWx(wx_code);
			if (s.equals("true")) {
				return "true";
			} else if (s.equals("false")) {
				return "no";
			} else {
				return "falseD";// if (s.equals("no"))
			}
		}

	}
	
	/**
	 * 验证用户输入的信息是否正确 邢志武 2015年6月24日 20:37:16
	 */

	public String isTeacher(String tea_code, String true_name, 
			String login_pass) {

		// System.out.println(wx_code);
		List<Teacher> tea = teacherDao.isTeacher(tea_code, true_name, login_pass);

		if (tea.size() == 1) {
			return tea.get(0).getId() + "";
		} else {
			return "false";
		}
	}

	/**
	 * 验证用户输入的信息是否正确 by孟凡朕 20140917
	 */

	public String isStudent(String stu_code, String true_name, String id_card,
			String login_pass) {

		// System.out.println(wx_code);
		List<Student> stu = studentDao.isStudent(stu_code, true_name, id_card,
				login_pass);

		if (stu.size() == 1) {
			return stu.get(0).getId() + "";
		} else {
			return "false";
		}
	}
	
	
	
}
