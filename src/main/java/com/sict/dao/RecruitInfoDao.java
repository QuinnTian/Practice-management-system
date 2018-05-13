package com.sict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.BMapEntity;
import com.sict.entity.Notice;
import com.sict.entity.RecruitInfo;

/**
 * 功能：相关的数据库操作 使用 @Repository 注释 RoleDao bywtt20141103 *
 * 
 * */
@Repository
public class RecruitInfoDao extends BasicDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 功能：查询前十条列表 by ccc2015-01-28
	 * */
	public List<RecruitInfo> getAllRecruitInfos() {
		List<RecruitInfo> list = sqlSession
				.selectList("com.sict.dao.RecruitInfoDao.selectten");
		return list;
	}

	/**
	 * 功能：查询list列表 by 邢志武 2015-01-22
	 * */
	public List<RecruitInfo> select() {
		return sqlSession.selectList("com.sict.dao.RecruitInfoDao.select");
	}

	/**
	 * 功能：查询列表 by ccc 2015-0317
	 * */
	public List<RecruitInfo> getAllRecruitInfosByCollege(String CollegeCode) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("CollegeCode", CollegeCode);
		return sqlSession.selectList(
				"com.sict.dao.RecruitInfoDao.getAllRecruitInfosByCollege",
				param);
	}
	/**
	 * 功能：选出每个学院的总数 by ccc 2015-0410
	 * */
	public int selectAllzpxxBycolleage(String org_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(
				"com.sict.dao.RecruitInfoDao.selectAllzpxxBycolleage", org_id);
	}
	/**
	 * 功能：选出学院的上一页下一页第几页 by ccc 2015-0410
	 * */
	public List<RecruitInfo> getAllRecruitInfosByCollegeAndPage(String org_id,
			int page) {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("CollegeCode", org_id);
		param.put("page", page);
		return sqlSession
				.selectList(
						"com.sict.dao.RecruitInfoDao.getAllRecruitInfosByCollegeAndPage",
						param);
	}
	
	/**
	 * 功能：查询list列表 by 邢志武 2015-01-22
	 * 修改：  张向杨   2015-12-28 
	 * */
	public List<RecruitInfo> select(RecruitInfo ri) {
		return sqlSession.selectList("com.sict.dao.RecruitInfoDao.select",ri);
	}
}
