package com.sict.service.campus;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.campus.TeachingClassDao;
import com.sict.entity.TeachingClass;
import com.sict.service.BasicService;



@Repository(value = "teachingClassService")
@Transactional
public class TeachingClassService implements BasicService<TeachingClass>{
	@Autowired
	private TeachingClassDao teachingclassDao;

	public List<TeachingClass> selectList(TeachingClass t) {
		// TODO Auto-generated method stub
		return null;
	}

	public TeachingClass insert(TeachingClass t) {
		// TODO Auto-generated method stub
		
		if(t.getCourses_type().equals("校选修")){
			t.setCourses_type("1");
		}else if(t.getCourses_type().equals("院选修")){
			t.setCourses_type("2");
		}else if(t.getCourses_type().equals("必修课")){
			t.setCourses_type("3");
		}else if(t.getCourses_type().equals("限选课")){
			t.setCourses_type("4");
		}else if(t.getCourses_type().equals("公共必修课")){
			t.setCourses_type("5");
		}
		t.setState("1");
		teachingclassDao.insert(t);
		return null;
	}

	public int update(TeachingClass t) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(TeachingClass t) {
		// TODO Auto-generated method stub
		return 0;
	}

	public TeachingClass selectByID(String id) {
		// TODO Auto-generated method stub
		return teachingclassDao.selectByID(id);
	}

	public TeachingClass insertOrUpdate(TeachingClass t) {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectCount(TeachingClass t) {
		// TODO Auto-generated method stub
		return this.teachingclassDao.selectCount(t);
	}
	
	/**
	 * 功能：根据 课程id查询相关的教学班
	 * @author    李达
	 *  @CreateDate 2016-05-20  
	 * @param CourseId
	 * @return
	 */
	public List<TeachingClass> selectByCourseId(String CourseId){
		return teachingclassDao.selectByCourseId(CourseId);
	}
	/*
	 * 根据学院id  获取到该学院的教学班信息 
	 * 丁乐晓   2016 - 05- 27 
	 * */
	public List<TeachingClass> getTeachingClass(String smsyear,String smster,String college_id){
		return teachingclassDao.getTeachingClass(smsyear,smster,college_id);	 
	}
}
