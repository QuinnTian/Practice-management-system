package com.sict.dao.campus;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.dao.BasicDao;
import com.sict.entity.TeachingClass;
/**
 * 功能：教学表相关的service 使用 by岳贤昌20160512 *
 * 
 * */

	@Repository
	public class TeachingClassDao extends BasicDao<TeachingClass>{

		@Autowired
		private SqlSessionTemplate sqlSession;
		
		public TeachingClass selectByID(String id){
			return sqlSession.selectOne("com.sict.dao.campus.TeachingClassDao.selectByID",id);
		}
		/**
		 * 功能：根据 课程id查询相关的教学班
		 * @author    李达
		 * @CreateDate 2016-05-20  
		 * @param CourseId
		 * @return
		 */
		public List<TeachingClass>  selectByCourseId(String CourseId){
			return sqlSession.selectList("com.sict.dao.campus.TeachingClassDao.selectByCourseId",CourseId);
		}
		
		/*
		 * 根据学院id  获取到该学院的教学班信息 
		 * 丁乐晓   2016 - 05- 27 
		 * */
		public List<TeachingClass> getTeachingClass(String smsyear,String smster,String college_id){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("smsyear", smsyear);
			map.put("smster", smster);
			map.put("college_id", college_id);
			return sqlSession.selectList("com.sict.dao.campus.TeachingClassDao.getTeachingClass", map);
		}	
}
