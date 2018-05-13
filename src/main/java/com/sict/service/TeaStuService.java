package com.sict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.TeaStuDao;
import com.sict.entity.TeaStu;

/**
 * 功能：管理员相关的service 使用 @Repository 注释 TeaStuDao byccc20141021 *
 * 
 * */
@Repository(value = "teaStuService")
@Transactional
public class TeaStuService implements BasicService {
	@Autowired
	TeaStuDao teaStuDao;

	public List selectList(Object o) {
		// TODO Auto-generated method stub
		return teaStuDao.selectList(o);
	}

	public Object insert(Object o) {
		// TODO Auto-generated method stub
		return teaStuDao.insert(o);
	}

	public int update(Object o) {
		// TODO Auto-generated method stub

		return teaStuDao.update(o);
	}

	public int delete(Object o) {
		// TODO Auto-generated method stub
		return this.teaStuDao.delete(o);
	}

	public Object selectByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object insertOrUpdate(Object o) {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectCount(Object o) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<TeaStu> selectByStuCode(String stu_code) {
		// TODO Auto-generated method stub
		return teaStuDao.selectByStuCode(stu_code);
	}
	public List<TeaStu> selectPractice(String stu_code) {
		// TODO Auto-generated method stub
		return teaStuDao.selectPractice(stu_code);
	}
	/**
	 * 功能实现查询对应学生信息记录by practice_code
	 * @param String practice_code
	 * @return List
	 * 方法过时
	 * 检查：吴敬国 2015年6月4日
	 */
	public List<TeaStu> selectListByTeaCode(String tea_code,String practice_code) {
	    return (List<TeaStu>) teaStuDao.getStudents(tea_code,practice_code);
		
	}

}