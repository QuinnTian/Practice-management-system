package com.sict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.GraduationThesis;

/*
 * 功能：毕业论文相关的数据库操作
 * 使用 @Repository 注释GraduationThesisDao
 * by ccc 20140923	 * 
 */
@Repository
public class GraduationThesisDao extends BasicDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	String className = getClass().getName();
	public String namespace = className;

	/**
	 * zcg 20141009 获取论文版本号
	 * 
	 * @param stu_code
	 * @return
	 */
	public Object getCurrentVersion(String user_id) {
		// return (Integer)
		// getSqlMapClientTemplate().queryForObject("kaochang.zuiDaZuoCi",kcBiaoShi);
		return sqlSession.selectOne(namespace + ".getCurrentVersion", user_id);
	}
	
	/**
	 * 功能：根据学号 实习任务id 获得版本号最大的那个论文
	 * bywjg 2015-4-20
	 * @param String stu_id,String pra_id
	 * @return GraduationThesis
	 * 
     */
	public GraduationThesis getMaxVersionByStuAndPraId(String stu_id,String pra_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stu_id", stu_id);
		map.put("pra_id", pra_id);
		return sqlSession.selectOne("com.sict.dao.GraduationThesisDao.getMaxVersionByStuAndPraId",map);
	}
	/**
	 * 功能：根据学生id 实习任务id 获得最新的实训作品信息 
	 * bywjg 2015-6-5
	 * @param String stu_id,String pra_id
	 * @return GraduationThesis
	 * 
     */
	public GraduationThesis getNewTrainByStuAndPraId(String stu_id,String pra_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stu_id", stu_id);
		map.put("pra_id", pra_id);
		return sqlSession.selectOne("com.sict.dao.GraduationThesisDao.getNewTrainByStuAndPraId",map);
	}

}
