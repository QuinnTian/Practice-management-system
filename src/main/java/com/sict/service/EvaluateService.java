package com.sict.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.dao.EvaluateDao;
import com.sict.entity.Evaluate;

/**
 * 功能：..相关的service 使用 @Repository 注释 EvaluateDao by王磊201401015 *
 * 
 * */
@Repository(value = "evaluateService")

public class EvaluateService{
	@Autowired
	EvaluateDao evaluatedao;
	/**
	 * 功能实现查询违纪记录
	 * @param o
	 * @return
	 */
	public List<Map<String, String>> getEvalList(String tea_code) {
		return evaluatedao.getEvalList(tea_code);

	}
	/**
	 * 功能：功能新建奖惩
	 * by ：王磊
	 * 2015年4月16日
	 */
	public int insertEvaluate(Object o) {
		Evaluate e = (Evaluate) o;
		return evaluatedao.insertEvaluate(e);
	}

	public List selectList(Object o) {
		return evaluatedao.selectList(o);
	}

	public Object insert(Object o) {
		Evaluate e=(Evaluate)o;
		return evaluatedao.insert(e);
	}

	public Object update(Object o) {
		return null;
	}

	public int delete(Object o) {
		return evaluatedao.delete(o);
	}

	public Object selectByID(String id) {
		return evaluatedao.selectByID(id);
	}

	public Object insertOrUpdate(Object o) {
		return null;
	}

	public int selectCount(Object o) {
		return 0;
	}
	/**
	 * 功能：通过教师id，和实践教学任务得到奖惩列表
	 * by ：王磊
	 * 2015年4月16日
	 */
	public List ListById(String tea_id) {
		return evaluatedao.selectByTeaId(tea_id);
	}
	/**
	 * 功能：通过教师id，和实践教学任务得到奖惩列表
	 * by ：王磊
	 * 2015年4月16日
	 */
	public List listByTeaIdAndPracticeId(String tea_id,String practice_id){
		return evaluatedao.listByTeaIdAndPracticeId(tea_id, practice_id);
		
	}
	/**
	 * 功能：通过学生id得到奖惩列表
	 * by ：周睿
	 * 2016年1月20日
	 */
	public List<Evaluate> ListByStu_Id(String stu_id) {
		return evaluatedao.ListByStu_Id(stu_id);
	}
}
