package com.sict.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.Courses;
import com.sict.entity.RecruitInfo;

@Repository
public class CourseDao extends BasicDao {
	
     @Autowired
	private SqlSessionTemplate sqlSession;
     /**
 	 * 此方法没有调用
 	 * by  wjg  2015-7-6
 	 * */
 	public void insertCourses(Courses courses) {
 		sqlSession.insert("com.sict.dao.CourseDao.insertCourses", courses);
 	}
 	/**
	 * 微信
	 * by  wjg  2015-7-6
	 * */
	public List<Courses> getCourseBycollege(String college_id){
		List<Courses> courses= sqlSession.selectList("com.sict.dao.CourseDao.getCourseBycollege", college_id);
		return courses;
	}
	/**
	 * 根据学院id  获取到该学院的课程 
	 * 增加  张向杨   2015 - 12- 28 
	 * */
	public List<Courses> getCourse(String college_id){
		List<Courses> courses= sqlSession.selectList("com.sict.dao.CourseDao.getCourse", college_id);
		return courses ;
	}
}
