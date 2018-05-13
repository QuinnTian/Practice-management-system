package com.sict.dao.campus;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.dao.BasicDao;
import com.sict.entity.TeachingTask;

@Repository
public class TeachingTaskDao extends BasicDao<TeachingTask>{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 功能：通过教师id获取当前教师所有授课任务表
	 * @author 李达  2016.5.14
	 * @param tea_id
	 * @return list<TeachingTask>
	 */
	public List<TeachingTask> selectByTeaId(String tea_id) {
		return sqlSession.selectList("com.sict.dao.campus.TeachingTaskDao.selectByTeaId",tea_id);
	}
	/**
	 * 功能：通过教学班id获取当前教师所有授课任务表
	 * @author 李达  2016.5.16
	 * @param tc_id
	 * @return TeachingTask
	 */
	public TeachingTask selectByTc_id(String tc_id){
		return sqlSession.selectOne("com.sict.dao.campus.TeachingTaskDao.selectByTc_id",tc_id);
	}
	/**
	 * 功能：通过教学班id和教师id获取教学任务
	 * @author 李达  2016.5.16
	 * @param tc_id
	 * @return TeachingTask
	 */
	public TeachingTask selectByTc_idAndTea_id(String tc_id,String tea_id){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tc_id", tc_id);
		map.put("tea_id", tea_id);
		return  sqlSession.selectOne("com.sict.dao.campus.TeachingTaskDao.selectByTc_idAndTea_id",map);
	}
	/**
	 * 功能：通过开始结束时间和教师id获取教学任务
	 * @author 李达  2016.6.13
	 * @param tc_id
	 * @return TeachingTask
	 */
	public List<TeachingTask> selectByTimeAndTeaId(Date begin_time,Date end_time,String tea_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin_time", begin_time);
		map.put("end_time", end_time);
		map.put("tea_id", tea_id);
		return sqlSession.selectList("com.sict.dao.campus.TeachingTaskDao.selectByTimeAndTeaId",map);
	}
	
}
