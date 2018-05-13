package com.sict.service.campus;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.campus.TeachingTaskDao;
import com.sict.entity.TeachingTask;
import com.sict.service.BasicService;

@Repository(value = "teachingTaskService")
@Transactional
public class TeachingTaskService implements BasicService<TeachingTask>{
	@Autowired
	private TeachingTaskDao teachingtaskDao;

	public List<TeachingTask> selectList(TeachingTask t) {
		// TODO Auto-generated method stub
		return null;
	}

	public TeachingTask insert(TeachingTask t) {
		// TODO Auto-generated method stub
		teachingtaskDao.insert(t);
		return null;
	}

	public int update(TeachingTask t) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(TeachingTask t) {
		// TODO Auto-generated method stub
		return 0;
	}

	public TeachingTask selectByID(String id) {
		// TODO Auto-generated method stub
		return teachingtaskDao.selectByID(id);
	}

	public TeachingTask insertOrUpdate(TeachingTask t) {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectCount(TeachingTask t) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * 功能：通过教师id获取当前教师所有授课任务表
	 * @author 李达  2016.5.14
	 * @param tea_id
	 * @return list<TeachingTask>
	 */
	public List<TeachingTask> selectByTeaId(String tea_id) {
		return teachingtaskDao.selectByTeaId(tea_id);
	}
	/**
	 * 功能：通过教学班id获取当前教师所有授课任务表
	 * @author 李达  2016.5.16
	 * @param tc_id
	 * @return TeachingTask
	 */
	public TeachingTask selectByTc_id(String tc_id){
		return teachingtaskDao.selectByTc_id(tc_id);
	}
	/**
	 * 功能：通过教学班id和教师id获取教学任务
	 * @author 李达  2016.5.16
	 * @param tc_id
	 * @return TeachingTask
	 */
	public TeachingTask selectByTc_idAndTea_id(String tc_id,String tea_id){
		return teachingtaskDao.selectByTc_idAndTea_id(tc_id,tea_id);
	}
	/**
	 * 功能：通过开始结束时间和教师id获取教学任务
	 * @author 李达  2016.6.13
	 * @param tc_id
	 * @return TeachingTask
	 */
	public List<TeachingTask> selectByTimeAndTeaId(Date begin_time,Date end_time,String tea_id){
		return teachingtaskDao.selectByTimeAndTeaId(begin_time,end_time,tea_id);
	}
	
}
