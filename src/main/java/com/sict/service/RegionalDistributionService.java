package com.sict.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.CompanyDao;
import com.sict.dao.RegionalDistributionDao;
import com.sict.entity.Company;
import com.sict.entity.RecruitInfo;
import com.sict.entity.RegionalDistribution;
import com.sict.util.Common;

/**
 * 功能：..相关的service 使用 @Repository 注释 CompanyDao by李瑶婷20141105 *
 * 
 * */
@Repository(value = "regionalDistributionService")
@Transactional
public class RegionalDistributionService implements BasicService {

	@Autowired
	RegionalDistributionDao regionalDistributionDao;

	public List<RegionalDistribution> selectList(Object t) {
		RegionalDistribution r=(RegionalDistribution) t;
		// TODO Auto-generated method stub
		return this.regionalDistributionDao.selectList(r);
	}

	public RegionalDistribution insert(Object t) {
		
		RegionalDistribution r=(RegionalDistribution) t;
		r.setId(Common.returnUUID16());
		// TODO Auto-generated method stub
		this.regionalDistributionDao.insert(r);
		return null;
	}

	public int update(Object t) {
		RegionalDistribution r=(RegionalDistribution) t;
		// TODO Auto-generated method stub
		this.regionalDistributionDao.update(r);
		return 0;
	}

	public int delete(Object t) {
		RegionalDistribution r=(RegionalDistribution) t;
		// TODO Auto-generated method stub
		return this.regionalDistributionDao.delete(r);
	}

	public RegionalDistribution selectByID(String id) {
		// TODO Auto-generated method stub
		RegionalDistribution r=	(RegionalDistribution)this.regionalDistributionDao.selectByID(id);
		return r;
	}

	public Object insertOrUpdate(Object t) {
		RegionalDistribution r=(RegionalDistribution) t;
		// TODO Auto-generated method stub
		return null;
	}

	public int selectCount(Object t) {
		RegionalDistribution r=(RegionalDistribution) t;
		// TODO Auto-generated method stub
		return this.regionalDistributionDao.selectCount(r);
	}
	
	//返回某个学院在某个省份的学生数量
	public int getCountByNameAndGradeAndOrg(String grade,String name,String org_id) {
		
		return this.regionalDistributionDao.getCountByNameAndGradeAndOrg(grade,name,org_id);
	}
	
	//返回整个学校在某个省份的学生数量
	public int getAllCountByNameAndGradeAndOrg(String grade,String name) {
		
		return this.regionalDistributionDao.getAllCountByNameAndGradeAndOrg(grade,name);
	
	}
	
	/*
	 * 返回某个学院在某个省份的学生占学校的比例
	 */
	public double getPent(String grade,String name,String org_id){
		int allcount=getAllCountByNameAndGradeAndOrg(grade,name);
		int count=getCountByNameAndGradeAndOrg(grade, name, org_id);
		double pet=((double)count/allcount)*100;
		String falseRate = new java.text.DecimalFormat("#.00").format(pet);
		double scale = Double.parseDouble(falseRate);
		return scale;
	}
	
}
