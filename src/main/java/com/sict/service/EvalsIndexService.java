package com.sict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.EvalsIndexDao;
import com.sict.entity.EvalsIndex;
import com.sict.entity.Org;

/**
 * 功能：..相关的service 使用 @Repository 注释 EvalsIndexDao by李瑶婷 20141030 *
 * 
 * */
@Repository(value = "evalsIndexService")
@Transactional
public class EvalsIndexService implements BasicService {

	@Autowired
	EvalsIndexDao EvalsIndexDao;

	public List selectList(Object o) {
		EvalsIndex ei=(EvalsIndex)o;
		return EvalsIndexDao.selectList(ei);
	}

	public Object insert(Object o) {
		int a=0;
		EvalsIndex e = (EvalsIndex) o;
		a=EvalsIndexDao.insert(e);
		DictionaryService.updateEvalsIndex(e);
		return a;
	}

	public int update(Object o) {
		return EvalsIndexDao.update(o);
	}

	public int delete(Object o) {
		return EvalsIndexDao.delete(o);
	}

	public Object selectByID(String id) {
		return this.EvalsIndexDao.selectByID(id);
	}

	public Object insertOrUpdate(Object o) {
		return null;
	}

	public int selectCount(Object o) {
		return this.EvalsIndexDao.selectCount(o);
	}

	public Object selectByCode(String code) {
		return this.EvalsIndexDao.selectByCode(code);
	}

	// 通过学院id查出奖惩标准指标数据 by 王磊
	public List<EvalsIndex> ListById(String xy_id) {
		return this.EvalsIndexDao.ListById(xy_id);
	}

	// 查询出奖惩指标的所有年份2015-1-26 by王磊
	public List<String> ListYears() {
		return this.EvalsIndexDao.ListYears();
	}

	// 根据时间和范围scope查询出记录 by王磊2015-1-26
	public List<EvalsIndex> ListByYearAndScope(String scope, String year) {
		return this.EvalsIndexDao.ListByYearAndScope(scope, year);
	}

	// 根据标准的id删除指标
	public int deleteByStandId(String StandId) {
		return this.EvalsIndexDao.deleteByStandId(StandId);

	}
	/**
	 * 功能：根据指标id查询所有详细奖惩指标
	 * by 李达、师杰 20160329
	 */
	public List<EvalsIndex> selectByStandId(String StandId) {
		return EvalsIndexDao.selectByStandId(StandId);
	}
}
