package com.sict.dao.campus;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.dao.BasicDao;
import com.sict.entity.TeachingClassMembers;

	@Repository
	public class TeachingClassMembersDao extends BasicDao<TeachingClassMembers>{

		@Autowired
		private SqlSessionTemplate sqlSession;
		
		/**
		 * 功能：通过教学班id查询所有班级学生
		 * @author 李达 2016.5.14
		 * @param tc_id
		 * @return List<TeachingClassMembers>
		 */
		public List<TeachingClassMembers> selectByTc_id(String tc_id){
			return sqlSession.selectList("com.sict.dao.campus.TeachingClassMembersDao.selectByTc_id",tc_id);
		}
}
