package com.sict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.DailyInspect;
import com.sict.entity.DailyInspectDetails;

/**
 * 功能：请假申请的数据库操作 使用 @Repository 注释 DailyInspectDetailsDao by syj 20160122 *
 * 
 * */
@Repository
public class DailyInspectDetailsDao extends BasicDao<DailyInspectDetails> {
	@Autowired
	private SqlSessionTemplate sqlSession;

	

	/**
	 * 根据关联上级id查询 某检查表下所有关联的详情表
	 */
	public List<DailyInspectDetails> selectByInspect_id(String inspect_id) {
		List<DailyInspectDetails> list = sqlSession.selectList(
				"com.sict.dao.DailyInspectDetailsDao.selectByInspect_id",
				inspect_id);
		return list;
	}

	/**
	 * 根据日常检查表id合并日常检查详情表数据 by 师杰2016-04-06
	 */
	public List<DailyInspectDetails> groupByIndexId(String inspect_id) {
		List<DailyInspectDetails> list = sqlSession.selectList(
				"com.sict.dao.DailyInspectDetailsDao.groupByIndexId",
				inspect_id);
		return list;
	}
	/**
	 * 根据日常检查表id和作用对象查询相关日常检查详情表中的学生id by师杰 2016-05-02
	 */
	public List<String> selectMebByObj(String inspect_id) {
		List<String> list = sqlSession.selectList(
				"com.sict.dao.DailyInspectDetailsDao.selectMebByObj",
				inspect_id);
		return list;
		}
	/**
	 * 通过导员ID和时间获取数据库中日常检查详情表中的记录
	 * by 张邦卿 2016-05-09
	 */
	public List<DailyInspectDetails> getDailyInspectByDYId(String Id) {
		List<DailyInspectDetails> list = sqlSession.selectList(
				"com.sict.dao.DailyInspectDetailsDao.getDailyInspectByDYId",
				Id);
		return list;
	}

}
