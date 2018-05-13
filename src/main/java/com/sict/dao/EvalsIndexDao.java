package com.sict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.EvalsIndex;

/**
 * 功能：奖惩标准相关的数据库操作 使用 @Repository 注释 EvaluateStandardDao by李瑶婷 20141030 *
 * 
 * */
@Repository
public class EvalsIndexDao extends BasicDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<EvalsIndex> ListById(String xy_id) {
		return sqlSession.selectList("com.sict.dao.EvalsIndexDao.selectById",xy_id);
	}

	// 查询出奖惩指标的所有年份
	// by 王磊2015-1-26
	public List<String> ListYears() {
		return sqlSession.selectList("com.sict.dao.EvalsIndexDao.selectYears");
	}

	// 根据时间和范围scope查询出记录by王磊2015-1-26
	public List<EvalsIndex> ListByYearAndScope(String scope, String year) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("scope", scope);
		map.put("year", year);
		return sqlSession.selectList("com.sict.dao.EvalsIndexDao.selectByYearAndScore", map);
	}

	// 根据标准的id删除指标
	public int deleteByStandId(String standId) {
		return sqlSession.delete("com.sict.dao.EvalsIndexDao.evalByStandId",standId);
	}
	// 根据指标id查询所有详细奖惩指标  by 李达、师杰 20160329
		public  List<EvalsIndex> selectByStandId(String standId) {
			return sqlSession.selectList("com.sict.dao.EvalsIndexDao.selectByStandId",standId);
		}
}
