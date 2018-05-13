package com.sict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.MonthSummary;

/*
 * 功能：签到
 * 使用 @Repository 注释 
 * by孟凡朕20140918	 * 
 * time,wx_code,stu_code,true_name，sign_place
 * */
@Repository
public class MonthSummaryDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<MonthSummary> isMonthSummary(String time, String stu_code) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("time", time);
		param.put("stu_code", stu_code);

		List<MonthSummary> list = sqlSession.selectList(
				"com.sict.dao.MonthSummaryDao.isMonthSummary", param);

		return list;
	}

	public void upPhoto(MonthSummary monthSummary) {

		sqlSession.insert("com.sict.dao.MonthSummaryDao.upPhoto", monthSummary);
	}

}
