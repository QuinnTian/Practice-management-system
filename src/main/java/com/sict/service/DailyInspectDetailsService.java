package com.sict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.DailyInspectDetailsDao;
import com.sict.entity.DailyInspect;
import com.sict.entity.DailyInspectDetails;
import com.sict.entity.PracticeRecord;

@Repository(value = "dailyInspectDetailsService")
@Transactional
public class DailyInspectDetailsService implements BasicService<DailyInspectDetails> {

	@Autowired
	private DailyInspectDetailsDao dailyInspectDetailsDao;


	// 根据关联上级id查询 某检查表下所有关联的详情表
	public List<DailyInspectDetails> selectByInspect_id(String inspect_id) {
		return dailyInspectDetailsDao.selectByInspect_id(inspect_id);
	}

	/**
	 * 根据日常检查表id合并日常检查详情表数据 by 师杰2016-04-06
	 */
	public List<DailyInspectDetails> groupByIndexId(String inspect_id) {
		return dailyInspectDetailsDao.groupByIndexId(inspect_id);
	}
	/**
	 * 根据日常检查表id和作用对象查询相关日常检查详情表中的学生id by师杰 2016-05-02
	 */
	public List<String> selectMebByObj(String inspect_id) {
		return dailyInspectDetailsDao.selectMebByObj(inspect_id);
	}
	/**
	 * 通过导员ID和时间获取数据库中日常检查详情表中的记录
	 * by 张邦卿 2016-05-09
	 */
	public List<DailyInspectDetails> getDailyInspectByDYId(String Id) {
		return dailyInspectDetailsDao.getDailyInspectByDYId(Id);
	}

	public List<DailyInspectDetails> selectList(DailyInspectDetails t) {
		
		return dailyInspectDetailsDao.selectList(t);
	}

	public DailyInspectDetails insert(DailyInspectDetails t) {
		dailyInspectDetailsDao.insert(t);
		return null;
	}

	public int update(DailyInspectDetails t) {
		return dailyInspectDetailsDao.update(t);
	}

	public int delete(DailyInspectDetails t) {
		return dailyInspectDetailsDao.delete(t);
	}

	public DailyInspectDetails selectByID(String id) {
		return dailyInspectDetailsDao.selectByID(id);
	}

	public DailyInspectDetails insertOrUpdate(DailyInspectDetails t) {
		return null;
	}

	public int selectCount(DailyInspectDetails t) {
		return dailyInspectDetailsDao.selectCount(t);
	}
}
