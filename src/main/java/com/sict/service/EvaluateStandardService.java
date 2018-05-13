package com.sict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.EvaluateStandardDao;
import com.sict.entity.EvaluateStandard;

/**
 * 功能：..相关的service 使用 @Repository 注释 EvaluateStandardDao by李瑶婷 20141030 *
 * 
 * */
@Repository(value = "evaluateStandardService")
@Transactional
public class EvaluateStandardService implements BasicService {

	@Autowired
	EvaluateStandardDao EvaluateStandardDao;

	public List selectList(Object o) {
		return EvaluateStandardDao.selectList(o);
	}

	public Object insert(Object o) {
		EvaluateStandard e = (EvaluateStandard) o;
		DictionaryService.updateEvaluateStandard(e);
		return EvaluateStandardDao.insert(e);
	}

	public int update(Object o) {
		EvaluateStandard e = (EvaluateStandard) o;
		DictionaryService.updateEvaluateStandard(e);
		return EvaluateStandardDao.update(e);
	}

	public int delete(Object o) {
		DictionaryService.deleteEvaluateStandard((String)o);
		return EvaluateStandardDao.delete(o);
	}

	public Object selectByID(String id) {
		return this.EvaluateStandardDao.selectByID(id);
	}

	public Object insertOrUpdate(Object o) {
		return null;
	}

	public int selectCount(Object o) {
		return this.EvaluateStandardDao.selectCount(o);
	}

	public Object selectByCode(String code) {
		return this.EvaluateStandardDao.selectByCode(code);
	}
	//通过学院id查出奖惩标准数据by王磊2015-1-26
	public List<EvaluateStandard> ListById(String xy_id){
		return this.EvaluateStandardDao.ListById(xy_id);
	}
	//查询出奖惩指标的所有年份2015-1-26
	public List<String> ListYears(){
		return this.EvaluateStandardDao.ListYears();
	}
	//根据时间和范围scope查询出记录 by王磊2015-1-26
	public List<EvaluateStandard> ListByYearAndScope(String scope,String year){
		return this.EvaluateStandardDao.ListByYearAndScope(scope, year);
	}
	/*
	 * 功能：获取通知表中最大的通知编码 by王磊20150121
	 */
	public String getMaxEvaluateStandCode(String part_code) {
		return this.EvaluateStandardDao.getMaxEvaluateStandCode(part_code);
	}

	// 根据时间和学院id查出本年的学院里的标准by王磊2015-1-26
	public List<EvaluateStandard> selectByYearAndId(String xy_id, String year) {
		return this.EvaluateStandardDao.selectByYearAndId(xy_id, year);
	}

	// 根据系部id和学院id查出本年的学院里的标准by王磊2015-1-26
	public List<EvaluateStandard> selectByIds(String xy_id, String xibu_id) {
		return this.EvaluateStandardDao.selectByIds(xy_id, xibu_id);
	}	
	//根据标准类型查询出此类型所有标准  by 李达20160301
		public List<EvaluateStandard> selectByType(String type) {
			return this.EvaluateStandardDao.selectByType(type);
		}
	//根据标准类型早操和范围查询出早操指标(若存在多条记录会报错，仅用于早操) by师杰 2016-04-16
		public Object selectByTypeAndScope(String type,String scope) {
			return this.EvaluateStandardDao.selectByTypeAndScope(type,scope);
			}
}
