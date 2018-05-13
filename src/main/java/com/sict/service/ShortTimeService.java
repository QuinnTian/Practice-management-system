package com.sict.service;


import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.CompanyDao;
import com.sict.dao.RegionalDistributionDao;
import com.sict.dao.ShortTimeDao;
import com.sict.entity.Company;
import com.sict.entity.RecruitInfo;
import com.sict.entity.RegionalDistribution;
import com.sict.entity.ShortTime;
import com.sict.util.Common;

/**
 * 功能：..相关的service 使用 @Repository 注释 CompanyDao by李瑶婷20141105 *
 * 
 * */
@Repository(value = "shortTimeService")
@Transactional
public class ShortTimeService implements BasicService {

	@Autowired
	ShortTimeDao shorttimedao;
	public List<ShortTime> selectList(Object t) {
		// TODO Auto-generated method stub
		ShortTime  s=(ShortTime) t;
		return this.shorttimedao.selectList(s);
	}

	public ShortTime insert(Object t) {
		// TODO Auto-generated method stub
		ShortTime  s=(ShortTime) t;
		s.setId(Common.returnUUID16());
		this.shorttimedao.insert(s);
		return null;
	}

	public int update(Object t) {
		// TODO Auto-generated method stub
		ShortTime  s=(ShortTime) t;
		this.shorttimedao.update(s);
		return 0;
	}

	public int delete(Object t) {
		// TODO Auto-generated method stub
		ShortTime  s=(ShortTime) t;
		return this.shorttimedao.delete(s);
		
	}

	public Object selectByID(String id) {
		// TODO Auto-generated method stub
		ShortTime  s=(ShortTime)this.shorttimedao.selectByID(id);
		return s;
	}

	public Object insertOrUpdate(Object t) {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectCount(Object t) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * 删除所有数据 2015年8月9日 12:04:18
	 * 
	 * @author WuGee
	 */
	public void deleteAll() {
		shorttimedao.deleteAll();
	}
	/**
	 * 查询学院 某年的签到使用情况
	 * 
	 * @param grade
	 * @return
	 */
	public List<Map<String, String>> getCollegeSignstuUsePro(String grade,
			String year, String org_id) {
		return shorttimedao.getCollegeSignstuUsePro(grade, year, org_id);
	}

	public void deleteYearMouth() {
		// TODO Auto-generated method stub
		shorttimedao.deleteYearMouth();
	}
	
}
