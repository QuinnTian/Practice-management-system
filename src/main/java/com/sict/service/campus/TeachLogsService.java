package com.sict.service.campus;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.dao.TeaCoursesDao;
import com.sict.dao.campus.TeachLogsDao;
import com.sict.entity.TeachLogs;
import com.sict.service.BasicService;


@Repository(value = "teachLogsService")
public class TeachLogsService implements BasicService<TeachLogs>{
	
	@Autowired
	private TeachLogsDao teachLogsDao;

	public List<TeachLogs> selectList(TeachLogs t) {
		// TODO Auto-generated method stub
		return null;
	}

	public TeachLogs insert(TeachLogs t) {
		// TODO Auto-generated method stub
		TeachLogs a = (TeachLogs) t;
		if(teachLogsDao.insert(t)>0){
			return a;
		}else{
			return null;
		}
		
	}

	public int update(TeachLogs t) {
		// TODO Auto-generated method stub
		TeachLogs a = (TeachLogs) t;
		return teachLogsDao.update(a);
	}

	public int delete(TeachLogs t) {
		// TODO Auto-generated method stub
		return 0;
	}

	public TeachLogs selectByID(String id) {
		// TODO Auto-generated method stub
		return teachLogsDao.selectByID(id);
	}

	public TeachLogs insertOrUpdate(TeachLogs t) {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectCount(TeachLogs t) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	/**
	 * 功能：根据授课任务表ID查询相关教学日志表  
	 * @author 李达  2016.5.14
	 * @param teaching_task_id
	 * @return List<TeachLogs>
	 */
	public List<TeachLogs> selectByTeaching_task_id(String teaching_task_id){
		return this.teachLogsDao.selectByTeaching_task_id(teaching_task_id);
	}
	/**
	 * 功能：根据当前时间、节次、授课任务表id和 地点id获取 教学日志表记录
	 * @author 李达   2016-05-15
	 * @param time
	 * @param cs_id
	 * @param cr_id
	 * @param sn
	 * @return TeachLogs
	 */
	public TeachLogs selectByTCsIdSnAndCrId(Date time,String cs_id,String cr_id,String s_n){
		return this.teachLogsDao.selectByTCsIdSnAndCrId(time,cs_id,cr_id,s_n);
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
		return this.teachLogsDao.selectByTimeAndTtId(begin_time,end_time,tt_id);
	}
	
}
