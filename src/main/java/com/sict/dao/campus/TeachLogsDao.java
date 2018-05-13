package com.sict.dao.campus;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.dao.BasicDao;
import com.sict.entity.TeachLogs;

@Repository
public class TeachLogsDao extends BasicDao<TeachLogs>{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 功能：根据授课任务表ID查询相关教学日志表  
	 * @author 李达  2016.5.14
	 * @param teaching_task_id
	 * @return List<TeachLogs>
	 */
	public List<TeachLogs> selectByTeaching_task_id(String teaching_task_id) {
		return sqlSession.selectList("com.sict.dao.campus.TeachLogsDao.selectByTeaching_task_id",
				teaching_task_id);
	}
	
	/**
	 * 功能：根据当前时间、节次、授课任务表id和 地点id获取 教学日志表记录
	 * @author 李达    2016.5.15
	 * @param time
	 * @param cs_id
	 * @param cr_id
	 * @param sn
	 */
	public TeachLogs selectByTCsIdSnAndCrId(Date time,String cs_id,String cr_id,String s_n){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("time", time);
		map.put("cs_id", cs_id);
		map.put("cr_id", cr_id);
		map.put("s_n", s_n);
		return sqlSession.selectOne("com.sict.dao.campus.TeachLogsDao.selectByTCsIdSnAndCrId",map);
	}
	/**
	 * 功能：根据开始结束日期查询此教师的 所有授课记录
	 * @author 李达   2016-05-15
	 * @param begin_time
	 * @param end_time
	 * @param tt_id
	 * @return
	 */
	public List<TeachLogs> selectByTimeAndTtId(Date begin_time,Date end_time,String tt_id){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin_time", begin_time);
		map.put("end_time", end_time);
		map.put("tt_id", tt_id);
		return sqlSession.selectList("com.sict.dao.campus.TeachLogsDao.selectByTimeAndTtId",map);
	}
}
