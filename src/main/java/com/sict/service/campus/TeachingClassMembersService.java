package com.sict.service.campus;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.campus.TeachingClassMembersDao;
import com.sict.entity.TeachingClassMembers;
import com.sict.service.BasicService;

@Repository(value = "teachingClassMembersService")
@Transactional
public class TeachingClassMembersService implements BasicService<TeachingClassMembers>{
	@Autowired
	private TeachingClassMembersDao teachingclassmembersDao;

	public List<TeachingClassMembers> selectList(TeachingClassMembers t) {
		// TODO Auto-generated method stub
		return null;
	}

	public TeachingClassMembers insert(TeachingClassMembers t) {
		// TODO Auto-generated method stub
		teachingclassmembersDao.insert(t);
		return null;
	}

	public int update(TeachingClassMembers t) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(TeachingClassMembers t) {
		// TODO Auto-generated method stub
		return 0;
	}

	public TeachingClassMembers selectByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	public TeachingClassMembers insertOrUpdate(TeachingClassMembers t) {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectCount(TeachingClassMembers t) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	/**
	 * 功能：通过教学班id查询所有班级学生
	 * @author 李达 2016.5.14
	 * @param tc_id
	 * @return List<TeachingClassMembers>
	 */
	public List<TeachingClassMembers> selectByTc_id(String tc_id){
		return teachingclassmembersDao.selectByTc_id(tc_id);
	}

}
