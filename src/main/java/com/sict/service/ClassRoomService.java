package com.sict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.ClassRoomDao;
import com.sict.entity.ClassRoom;
import com.sict.util.Common;

@Service(value = "classRoomService")
@Transactional
public class ClassRoomService implements BasicService<ClassRoom> {
	@Autowired
	private ClassRoomDao classRoomDao;

	public List<ClassRoom> selectList(ClassRoom t) {
		// TODO Auto-generated method stub
		return classRoomDao.selectList(t);
	}

	public ClassRoom insert(ClassRoom t) {
		
		t.setId(Common.returnUUID());
		t.setState("1");
		classRoomDao.insert(t);
		return null;
	}

	public int update(ClassRoom t) {
		// TODO Auto-generated method stub
		return classRoomDao.update(t);
	}

	public int delete(ClassRoom t) {
		// TODO Auto-generated method stub
		return classRoomDao.delete(t);
	}

	public ClassRoom selectByID(String id) {
		// TODO Auto-generated method stub
		return classRoomDao.selectByID(id);
	}

	/**
	 * 暂时没有使用
	 * */
	public ClassRoom insertOrUpdate(ClassRoom t) {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectCount(ClassRoom t) {
		// TODO Auto-generated method stub
		return classRoomDao.selectCount(t);
	}
	/**
	 * 功能：查询所属校区
	 * @author 鲁雪艳
	 * @param scr_userdept 部门id
	 * @return List<ClassRoom>
	 * @since 2016-05-04
	 * */
	public List<ClassRoom> selectCampus(String scr_userdept){
		return classRoomDao.selectCampus(scr_userdept);
	}
	/**
	 * 功能：根据楼号(ABCDEFS)查询此楼所有教室
	 * @author 李达 
	 * @CreateDate 2016-05-13
	 * @param key
	 */
	public List<ClassRoom> selectByScrNum(String ScrNum){
		return classRoomDao.selectByScrNum(ScrNum);
	}
}
