package com.sict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.LevelApproval;

@Repository
public class LevelApprovalDao extends BasicDao<LevelApproval> {
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 根据id获取申请信息(non-Javadoc)
	 * 
	 * @see com.sict.dao.BasicDao#selectByID(java.lang.String)
	 * @author by 师杰 20160117
	 */
	public LevelApproval selectByLevel_App_ID(String id) {
		return sqlSession.selectOne("com.sict.dao.LevelApprovalDao.selectByLevel_App_ID", id);
	}

	public List<LevelApproval> selectByApp_tea(String tea_id) {
		List<LevelApproval> list = sqlSession.selectList("com.sict.dao.LevelApprovalDao.selectByApp_tea", tea_id);
		return list;
	}

	/**
	 * 功能：　根据班级id获取审批记录
	 * 
	 * @author 张向杨
	 * @param classId
	 *            班级id
	 * @since 2016-04-20
	 * @return List<LevelApproval>
	 */
	public List<LevelApproval> selectByClassId(String classId) {
		return sqlSession.selectList("com.sict.dao.LevelApprovalDao.selectByClassId", classId);
	}

	/**
	 * 功能：根据学院id获取申请信息
	 * 
	 * 
	 * @author 张向杨
	 * @param map
	 *            map集合
	 * @since 2016-05-03
	 * @return List<LevelApproval>
	 */
	public List<LevelApproval> selectByCollegeIdAndApprovalStateAndleaveType(Map<String, Object> map) {

		return sqlSession
				.selectList("com.sict.dao.LevelApprovalDao.selectByCollegeIdAndApprovalStateAndleaveType", map);
	}

	public List<LevelApproval> selectByStuIdAndLeaveType(Map<String, Object> map) {

		return sqlSession.selectList("com.sict.dao.LevelApprovalDao.selectByStuIdAndLeaveType", map);
	}

	/**
	 * 功能：　根据班级id获取有效的请假记录
	 * 
	 * @author 丁乐晓
	 * @param classId
	 *            ,sla_effects 班级id
	 * @since 2016-05-12
	 * @return List<LevelApproval>
	 */
	public List<LevelApproval> selectPassByClassId(String classid, String sla_effects) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("classid", classid);
		map.put("sla_effects", sla_effects);
		return sqlSession.selectList("com.sict.dao.LevelApprovalDao.selectPassByClassId", map);
	}

}
