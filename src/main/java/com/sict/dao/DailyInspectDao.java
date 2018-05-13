package com.sict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.Courses;
import com.sict.entity.DailyInspect;
import com.sict.entity.DailyInspectDetails;
import com.sict.entity.PracticeTask;

/**
 * 功能：请假申请的数据库操作 使用 @Repository 注释 DailyInspectDao by 李达、师杰 20160301 *
 * 
 * */
@Repository
public class DailyInspectDao extends BasicDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 功能：插入一条记录
	 */
	public void insert(DailyInspect d) {
 		sqlSession.insert("com.sict.dao.DailyInspectDao.insert", d);
 	}
	/**
	 * 功能：根据学生ID查询其全部记录 
	 */
	public List<DailyInspect> getDailyInspectByStuIdAndType(String stu_id,String type) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("stu_id", stu_id);
		param.put("type", type);
		List<DailyInspect> list = sqlSession.selectList("com.sict.dao.DailyInspectDao.getDailyInspectByStuIdAndType",param);
		return list;
	}
	/**
	 * 通过时间获取数据库中存在的班级id
	 * by 师杰 2016-04-15
	 */
	public List<DailyInspect> getDailyInspectByDate(String date) {
		List<DailyInspect> list = sqlSession.selectList("com.sict.dao.DailyInspectDao.getDailyInspectByDate",date);
		return list;
	}
	/**
	 * 通过导员ID、学年、类型、时间获取数据库中日常检查表中的记录
	 * by 张邦卿 2016-05-09
	 */
	public List<DailyInspect> getDailyInspectByDYId(String Id,String date,String type,String year) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("Id", Id);
		param.put("date", date);
		param.put("type", type);
		param.put("year", year);
		List<DailyInspect> list = sqlSession.selectList(
				"com.sict.dao.DailyInspectDao.getDailyInspectByDYId",
				param);
		return list;
	}
	/**
	 * 通过班主任ID和时间获取数据库中日常检查表中的记录
	 * by 宋浩 2016-05-16
	 */
	public List<DailyInspect> getHeadteaDailyInspectByDYId(String Id,String date,String type,String year) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("Id", Id);
		param.put("date", date);
		param.put("type", type);
		param.put("year", year);
		List<DailyInspect> list = sqlSession.selectList(
				"com.sict.dao.DailyInspectDao.getHeadteaDailyInspectByDYId",
				param);
		return list;
	}
	/**
	 * 通过班主任ID、查询时间、类别获取数据库中日常检查表中的记录 by宋浩
	 * by 宋浩 2016-05-17
	 */
	public List<DailyInspect> getMonitorDailyInspectByDYId(String Id,String date,String type) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("Id", Id);
		param.put("date", date);
		param.put("type", type);
		List<DailyInspect> list = sqlSession.selectList(
				"com.sict.dao.DailyInspectDao.getMonitorDailyInspectByDYId",
				param);
		return list;
	}
	
}
