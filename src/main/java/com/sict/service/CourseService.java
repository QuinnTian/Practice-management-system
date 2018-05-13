package com.sict.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.CourseDao;
import com.sict.entity.Courses;
import com.sict.entity.Org;
import com.sict.entity.Teacher;
import com.sict.util.Common;

/**
 * 功能：..相关的service 使用 @Repository 注释 OrgDao by郑春光20140910 *
 * 
 * */
@Repository(value = "courseService")
@Transactional
public class CourseService implements BasicService {

	@Autowired
	CourseDao courseDao;
	/**
	 * 注入orgService
	 * 
	 * */
	@Resource(name = "orgService")
	private OrgService orgService;

	public List selectList(Object o) {
		Courses s = (Courses) o;
		return courseDao.selectList(s);
	}
	
	public Object insert(Object o) {
		Courses s = (Courses) o;
		s.setId(Common.returnUUID16());
		s.setState("1");
		DictionaryService.updateCourses(s);
		DictionaryService.updateCoursesCodeByCode(s);
		return courseDao.insert(s);
	}

	public int update(Object o) {
		Courses s = (Courses) o;
		DictionaryService.updateCourses(s);
		DictionaryService.updateCoursesCodeByCode(s);
		return courseDao.update(o);
	}

	public int delete(Object o) {
		Courses s = (Courses) o;
		DictionaryService.deleteCourses(s.getId());
		DictionaryService.deleteCoursesCodeByCode(s.getCourse_code());
		return courseDao.delete(o);
	}

	public Object selectByID(String id) {
		return this.courseDao.selectByID(id);
	}

	public Object insertOrUpdate(Object o) {
		return this.courseDao.insert(courseDao);
	}

	public int selectCount(Object o) {
		return this.courseDao.selectCount(o);
	}
	/**
	 * 此方法没有调用
	 * by  wjg  2015-7-6
	 * */
	public Object selectById(String id) {
		return this.courseDao.selectByID(id);
	}
	/**
	 * 此方法没有调用
	 * by  wjg  2015-7-6
	 * */
	public void insertCourses(Courses courses) {
		courses.setId(Common.returnUUID16());
		Timestamp d = new Timestamp(System.currentTimeMillis());
		courses.setCreate_time(d);
		this.courseDao.insertCourses(courses);
	}
	/**
	 * 微信
	 * by  wjg  2015-7-6
	 * */
	public List<Courses> getCourseBycollege(String college_id) {
		List<Courses> courses=this.courseDao.getCourseBycollege(college_id);
		return courses;
	}
	/**
	 * 根据学院id  获取 该学院的课程信息
	 * web by w张向杨 2015-12-28
	 * */
	public List<Courses> getCourse(String college_id) {
		List<Courses> courses = this.courseDao.getCourse(college_id);
		return courses;
	}
	
	/**
	 * 功能：查询该编号在数据中的个数
	 * by
	 * 
	 * */
	public int getCount(String course_code){
		Courses course=new Courses();
		course.setCourse_code(course_code);
		int a;
		a=courseDao.selectCount(course);
		return a;
	}
	
	/**
	 * 解析课程信息表 对表中数据进行的验证
	 * 2016-5-28
	 */
	public List<Courses> validateCourseExcel(List<Courses> coursesList) {
		// 对教师表的数据验证编号是否重复
		List<String> codeList = new ArrayList();// 
		String infor = "";// 声明变量，存储表格中未按要求的信息存储。
		int b;
		// 表格的数据验证
		for (Courses course : coursesList) {
			String course_code = course.getCourse_code();
			String org_name=course.getOrg_name();
			List<Org> org=orgService.getOrgByOrgName(org_name);
			b = this.getCount(course_code);//这地方改成用字典判断比较好，每次都查询数据库比较慢
			//检验课程号
			if (course_code == null) {
				infor = "课程号不能为空,";
			} else {
				if (b != 0) {
					infor = "课程号在数据库有重复,";
				};
			};
			if (course.getCourse_name() == null) {
				infor = infor + "课程名称不能为空";
			}
			if (org.size()==0) {
				infor = infor + "开设组织不存在";
			}
			if (codeList.size() != 0) {
				infor = infor + Common.isCodeExist(course_code, codeList, "课程编号");
			}
			if (infor.trim().equals("")) {
				infor = "无";
			}
			if (org.size()!=0) {
				course.setOrg_id(org.get(0).getId());
			}
			course.setTemp1(infor.trim());
			infor = "";
			if (course.getCourse_code() != null) {
				codeList.add(course_code);
			}
			//检验用户名
			/*
			if (codeList.size() != 0) {
				infor = infor + Common.isCodeExist(teaCode, codeList, "教师编号");
			}
			;*/
		}
		// 判断是否在excel中重复
		String[] co = new String[codeList.size()];
		for (int a = 0; a < codeList.size(); a++) {
			co[a] = codeList.get(a);
		}
		return coursesList;
	}
	
	
}
