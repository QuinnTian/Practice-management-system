package com.sict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.Evaluate;

@Repository
public class EvaluateDao extends BasicDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 功能：检查是否签到成功 by孟凡朕 20140917
	 * 
	 * */
	public List<Evaluate> selectEvaluate(String id) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("stu_id", id);
		List<Evaluate> list = sqlSession.selectList(
				"com.sict.dao.EvaluateDao.selectEvaluate", param);
		return list;
	}

	/**
	 * 功能：查询惩罚记录列表,得到所有惩罚记录方法名：getChengfaList by王磊 *
	 * 
	 * */
	public List<Map<String, String>> getEvalList(String tea_code) {
		return sqlSession.selectList("com.sict.dao.EvaluateDao.selectEval",
				tea_code);// com.sict.dao.EvaluateDao
	}

	/**
	 * 功能：功能新建奖惩 by ：王磊 2015年4月16日
	 */
	public int insertEvaluate(Evaluate e) {
		return sqlSession.insert("com.sict.dao.EvaluateDao.insert", e);
	}

	/**
	 * 功能：通过教师id，和实践教学任务得到奖惩列表 by ：王磊 2015年4月16日
	 */
	public List<Evaluate> selectByTeaId(String tea_id) {
		return sqlSession.selectList("com.sict.dao.EvaluateDao.selectByTeaId",
				tea_id);
	}

	/**
	 * 功能：通过教师id，和实践教学任务得到奖惩列表 by ：王磊 2015年4月16日
	 */
	public List listByTeaIdAndPracticeId(String tea_id, String practice_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tea_id", tea_id);
		map.put("practice_id", practice_id);
		return sqlSession.selectList(
				"com.sict.dao.EvaluateDao.selectByTeaIdAndPracticeId", map);
	}

	/**
	 * 功能：通过学生id得到奖惩列表 by ：周睿 2016年1月20日
	 */
	public List<Evaluate> ListByStu_Id(String stu_id) {
		return sqlSession.selectList("com.sict.dao.EvaluateDao.ListByStu_Id",
				stu_id);
	}
}
