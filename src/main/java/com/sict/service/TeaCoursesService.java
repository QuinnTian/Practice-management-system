package com.sict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.dao.TeaCoursesDao;
import com.sict.entity.TeaCourses;
import com.sict.util.Common;

@Repository(value = "teaCoursesService")
public class TeaCoursesService implements BasicService<TeaCourses> {
	@Autowired
	private TeaCoursesDao teaCoursesDao;

	public List<TeaCourses> selectList(TeaCourses t) {

		return teaCoursesDao.selectList(t);
	}

	public TeaCourses insert(TeaCourses t) {
		TeaCourses teaCourses = null;
		t.setId(Common.returnUUID());
		java.util.Date date = new java.util.Date();
		java.sql.Date data1 = new java.sql.Date(date.getTime());
		t.setCreate_time(data1);
		t.setState("1");
		int row = teaCoursesDao.insert(t);
		if (row > 0) {
			teaCourses = t;
		}
		return teaCourses;
	}

	public int update(TeaCourses t) {
		// TODO Auto-generated method stub
		return teaCoursesDao.update(t);
	}

	public int delete(TeaCourses t) {
		// TODO Auto-generated method stub
		return teaCoursesDao.delete(t);
	}

	public TeaCourses selectByID(String id) {
		// TODO Auto-generated method stub
		return teaCoursesDao.selectByID(id);
	}

	public TeaCourses insertOrUpdate(TeaCourses t) {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectCount(TeaCourses t) {
		// TODO Auto-generated method stub
		return teaCoursesDao.selectCount(t);
	}
}
