package com.sict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.DailyInspectDao;
import com.sict.dao.DailyInspectDetailsDao;
import com.sict.entity.DailyInspect;
import com.sict.entity.DailyInspectDetails;
import com.sict.entity.PracticeRecord;


@Repository(value = "dailyInspectService")
@Transactional
public class DailyInspectService implements BasicService<DailyInspect>{
	
	
	@Autowired
	private com.sict.dao.DailyInspectDao DailyInspectDao;

	public List<DailyInspect> selectList(DailyInspect t) {
		// TODO Auto-generated method stub
		return null;
	}


	public DailyInspect insert(DailyInspect t) {
		DailyInspect la = (DailyInspect)t;
		DailyInspectDao.insert(la);
		return null;
	}

	public int update(DailyInspect t) {
		DailyInspect la = (DailyInspect)t;
		return DailyInspectDao.update(la);
	}

	public int delete(DailyInspect t) {
		DailyInspect la = (DailyInspect)t;
		return DailyInspectDao.delete(la);
	}

	public DailyInspect selectByID(String id) {
		return (DailyInspect) this.DailyInspectDao.selectByID(id);
	}

	public DailyInspect insertOrUpdate(DailyInspect t) {
		DailyInspect la = (DailyInspect)t;
		return null;
	}

	public int selectCount(DailyInspect t) {
		DailyInspect la = (DailyInspect)t;
		return DailyInspectDao.selectCount(la);
	}
	
	public List<DailyInspect> getDailyInspectByStuIdAndType(String stu_id,String type) {
		return DailyInspectDao.getDailyInspectByStuIdAndType(stu_id,type);
	}
	/***
	 * 通过当前时间获取数据库中是否有班级id
	 * 2016-04-15 师杰
	 */
	public List<DailyInspect> getDailyInspectByDate(String date) {
		return DailyInspectDao.getDailyInspectByDate(date);
	}
	/**
	 * 通过导员ID、学年、类型时间获取数据库中日常检查表中的记录
	 * by 张邦卿 2016-05-16
	 */
	public List<DailyInspect> getDailyInspectByDYId(String Id,String date,String type,String year) {
		return DailyInspectDao.getDailyInspectByDYId(Id,date,type,year);
	}
	/**
	 * 通过班主任ID和时间获取数据库中日常检查表中的记录
	 * by 宋浩 2016-05-09
	 */
	public List<DailyInspect> getHeadteaDailyInspectByDYId(String Id,String date,String type,String year) {
		return DailyInspectDao.getHeadteaDailyInspectByDYId(Id,date,type,year);
	}
	/**
	 * 通过班长ID、查询时间、类别获取数据库中日常检查表中的记录 by宋浩
	 * by 宋浩 2016-05-09
	 */
	public List<DailyInspect> getMonitorDailyInspectByDYId(String Id,String date,String type) {
		return DailyInspectDao.getMonitorDailyInspectByDYId(Id,date,type);
	}
	
}
