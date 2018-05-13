package com.sict.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.Region;

/*
 * 功能：签到
 * 使用 @Repository 注释 
 * by孟凡朕20140918	 * 
 * time,wx_code,stu_code,true_name，sign_place
 * */
@Repository
public class RegionDao extends BasicDao{

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Region> selectAllRegions() {
		List<Region> list = sqlSession
				.selectList("com.sict.dao.RegionDao.selectAllRegions");
		return list;
	}

}
