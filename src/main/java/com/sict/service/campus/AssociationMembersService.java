package com.sict.service.campus;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.campus.AssociationMembersDao;
import com.sict.entity.AssociationMembers;
import com.sict.service.BasicService;
import com.sict.util.Common;

@Service
@Transactional
public class AssociationMembersService implements BasicService<AssociationMembers> {

	@Autowired
	private AssociationMembersDao associationMembersDao;

	public List<AssociationMembers> selectList(AssociationMembers t) {

		return associationMembersDao.selectList(t);
	}

	public AssociationMembers insert(AssociationMembers t) {
		// 增加id state为有效---减少控制器代码
		t.setId(Common.returnUUID());
		t.setState("1");
		associationMembersDao.insert(t);
		return null;
	}

	public int update(AssociationMembers t) {

		return associationMembersDao.update(t);
	}

	public int delete(AssociationMembers t) {

		return associationMembersDao.delete(t);
	}

	public AssociationMembers selectByID(String id) {

		return associationMembersDao.selectByID(id);
	}

	public AssociationMembers insertOrUpdate(AssociationMembers t) {

		return null;
	}

	public int selectCount(AssociationMembers t) {

		return associationMembersDao.selectCount(t);
	}

	/**
	 * 功能：通过学生会id查询此学生会所有成员 by 李达、师杰 20160301
	 */
	public List<AssociationMembers> selectStusByAssId(String AssId) {
		return associationMembersDao.selectStusByAssId(AssId);
	}

	/**
	 * 根据当前学生id获取所在学生会id 师杰 2016-04-13
	 */
	public Object selectByStuId(String stuId) {
		return associationMembersDao.selectByStuId(stuId);
	}

}
