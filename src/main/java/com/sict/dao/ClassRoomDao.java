package com.sict.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.ClassRoom;

@Repository(value = "classRoomDao")
public class ClassRoomDao extends BasicDao<ClassRoom> {

	@Autowired
	private SqlSessionTemplate sqlSession;
	/**
	 * 功能：查询所属校区
	 * @author 鲁雪艳
	 * @param scr_userdept 部门id
	 * @return List<ClassRoom>
	 * @since 2016-05-04
	 * */
	public List<ClassRoom> selectCampus(String scr_userdept){
		return sqlSession.selectList("com.sict.dao.ClassRoomDao.selectCampus", scr_userdept);
	}
	/**
	 * 功能：根据楼号(ABCDEFS)查询此楼所有教室
	 * @author 李达 
	 * @CreateDate 2016-05-13
	 * @param key
	 */
	public List<ClassRoom> selectByScrNum(String ScrNum){
		return sqlSession.selectList("com.sict.dao.ClassRoomDao.selectByScrNum",ScrNum);
	}
}
