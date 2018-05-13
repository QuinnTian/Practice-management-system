package com.sict.dao;

import java.util.HashMap;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.RegionalDistribution;

/**
 * 功能：企业相关的数据库操作 使用 @Repository 注释 CompanyDao by李瑶婷20141105 *
 * 
 * */
@Repository
public class RegionalDistributionDao extends BasicDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 返回某个学院在某个省份的学生数量
	public int getCountByNameAndGradeAndOrg(String grade, String name,
			String org_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("grade", grade);
		map.put("name", name);
		map.put("org_id", org_id);
		int count = 0;
		try {
			if (name.equals("其他")) {
				count = sqlSession.selectOne("com.sict.dao.RegionalDistributionDao.getQTCountByNameAndGradeAndOrg",map);
			} else {
				count = sqlSession.selectOne("com.sict.dao.RegionalDistributionDao.getCountByNameAndGradeAndOrg",map);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return count;
	}

	// 返回整个学校在某个省份的学生数量
	public int getAllCountByNameAndGradeAndOrg(String grade, String name) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("grade", grade);
		map.put("name", name);
		int count = 0;
		try {
			if (name.equals("其他")) {
				count = sqlSession.selectOne("com.sict.dao.RegionalDistributionDao.getQTAllCountByNameAndGradeAndOrg",map);
			} else {
				count = sqlSession.selectOne("com.sict.dao.RegionalDistributionDao.getAllCountByNameAndGradeAndOrg",map);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return count;
	}

}
