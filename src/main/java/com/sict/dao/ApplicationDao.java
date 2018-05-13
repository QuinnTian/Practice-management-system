package com.sict.dao;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.Application;

/**
 * 功能：请假申请的数据库操作 使用 @Repository 注释 ApplicationDao by周睿 20160114 *
 * 
 * */
@Repository
public class ApplicationDao extends BasicDao<Application> {
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 根据id获取申请信息(non-Javadoc)
	 * 
	 * @see com.sict.dao.BasicDao#selectByID(java.lang.String)
	 * @author by 师杰 20160116
	 */
	public Application selectByID(String id) {
		return sqlSession.selectOne("com.sict.dao.ApplicationDao.selectByID", id);
	}

	public List<Application> selectByTea_id(String tea_id) {
		List<Application> list = sqlSession.selectList("com.sict.dao.ApplicationDao.selectByTea_id", tea_id);
		return list;
	}

	/**
	 * 根据查询时间获得那天的请假数据 by宋浩 20160506
	 */
	public List<Application> selectBySla_time(String sla_time) {
		return sqlSession.selectList("com.sict.dao.ApplicationDao.selectBySla_time", sla_time);
	}

	/**
	 * 功能：根据班级id、审批状态、请假类型 查询到该班级内的所有学生的请假记录
	 * 
	 * @author 张向杨
	 * @param String
	 *            classId
	 * @param String
	 *            approvalState
	 * @param String
	 *            leaveType
	 * @param boolean 标记是否去除查询出来的 sla_code的重复项
	 * @since 2.0 时间： 2016-04-20
	 * */
	public List<Application> selectListByClassIdAndApprovalStateAndleaveType(Map<String, Object> map) {

		return sqlSession
				.selectList("com.sict.dao.ApplicationDao.selectListByClassIdAndApprovalStateAndleaveType", map);
	}

	/**
	 * 根据审批状态获取申请信息(non-Javadoc)
	 * 
	 * @author by 李秋林 2016-04-25
	 */
	public List<Application> selectByApproval_state(String state) {
		return sqlSession.selectList("com.sict.dao.ApplicationDao.selectByApproval_state", state);
	}

	/**
	 * 功能： 根据学院id查询学院所用学生的请假记录（包括审批通过、未通过、进行中等）
	 * 
	 * @author 张向杨
	 * @param college_id
	 *            学院id
	 * @param approvalState
	 *            审批状态
	 * @since 2016-05-03
	 * @return List<Application>
	 */
	public List<Application> selectByCollegeIdAndApprovalState(String collegeId, String approvalState) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("collegeId", collegeId);
		map.put("approvalState", approvalState);
		return sqlSession.selectList("com.sict.dao.ApplicationDao.selectByCollegeIdAndApprovalState", map);
	}

	/**
	 * 功能： 查询请假条当天请假条的最大编码
	 * 
	 * @author 张向杨
	 * @param code
	 *            请假编码的 学院和日期部分（请假编码=学院编号+当天日期+4位数值）
	 * @return 返回当天请假记录编码最大的记录
	 * @createTime 2016-05-12
	 * */
	public Application selectMaxCode(String code) {

		return sqlSession.selectOne("com.sict.dao.ApplicationDao.selectMaxCode", code);
	}

	/**
	 * 功能： 查询请假条当天请假条的最大编码
	 * 
	 * @author 张向杨
	 * @param map
	 *            map集合
	 * @return List<Application>
	 * @createTime 2016-05-12
	 * */
	public List<Application> selectByStuIdAndLeaveTypeAndApprovalState(Map<String, Object> map) {
		return sqlSession.selectList("com.sict.dao.ApplicationDao.selectByStuIdAndLeaveTypeAndApprovalState", map);
	}

	/**
	 * 功能：通过学生ID、时间和影响范围判断此学生当前是否处于请假期间
	 * 
	 * @author 李达 2016.5.15
	 * @param stu_id
	 *            ,nowtime
	 * @return Application
	 */
	public Application CheckByStuId(String stu_id, Timestamp nowtime, String scope) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stu_id", stu_id);
		map.put("nowtime", nowtime);
		map.put("scope", scope);
		return sqlSession.selectOne("com.sict.dao.ApplicationDao.CheckByStuId", map);
	}

	/**
	 * 功能：根据学院id获取申请信息
	 * 
	 * 
	 * @author 张向杨
	 * @param map
	 *            map集合
	 * @since 2016-05-20
	 * @return List<Application>
	 */
	public List<Application> selectByCollegeIdAndApprovalStateAndleaveTypeSla_time(Map<String, Object> map) {

		return sqlSession.selectList(
				"com.sict.dao.ApplicationDao.selectByCollegeIdAndApprovalStateAndleaveTypeSla_time", map);
	}
}
