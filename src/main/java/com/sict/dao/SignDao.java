package com.sict.dao;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.BMapEntity;
import com.sict.entity.Sign;

/*
 * 功能：签到
 * 使用 @Repository 注释 
 * by孟凡朕20140918	 * 
 * time,wx_code,stu_code,true_name，sign_place
 * */
@Repository
public class SignDao extends BasicDao<Sign>{

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Sign> isQd(Timestamp sign_time, String stu_id) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("sign_time", sign_time.toString().substring(0, 10));
		param.put("stu_id", stu_id);

		List<Sign> list = sqlSession.selectList("com.sict.dao.SignDao.isQd",
				param);

		return list;
	}

	public void stuQd(Sign sign) {
		// SqlMapClient c = getSqlMapClientTemplate().getSqlMapClient();
		// c.endTransaction();

		sqlSession.insert("com.sict.dao.SignDao.stuQd", sign);
	}

	/**
	 * 功能：查询从未签到学生的stu_code by邢志武20141115 *
	 * 
	 * @param tea_code
	 * @return list
	 * */
	public List<BMapEntity> selectNeverSignStuIdByTeaCode(String tea_code) {
		return sqlSession.selectList(
				"com.sict.dao.SignDao.selectNeverSignStuIdByTeaCode", tea_code);
	}

	/**
	 * 查询该教师管理的所有学生中签到的学生的stu_id by邢志武 20141114 *
	 * 
	 * @param tea_code
	 * @return list
	 * */
	public List<BMapEntity> selectAllSignStuIdByTeaCode(String tea_code) {
		return sqlSession.selectList(
				"com.sict.dao.SignDao.selectAllSignStuIdByTeaCode", tea_code);
	}

	/**
	 * 功能：查询所需学生的全部信息 by邢志武20141115 *
	 * 
	 * @param stu_code
	 * @return list
	 * */

	public List<BMapEntity> selectAllStuByStuID(String stu_id) {
		return sqlSession.selectList(
				"com.sict.dao.SignDao.selectAllStuByStuID", stu_id);
	}

	/**
	 * 功能：查询所需学生的经度 by邢志武20141115 *
	 * 
	 * @param stu_code
	 * @return list
	 * */

	public List<BMapEntity> selectStuLatitudeByStuId(String stu_id) {
		return sqlSession.selectList(
				"com.sict.dao.SignDao.selectStuLatitudeByStuId", stu_id);
	}

	/**
	 * 功能：查询所需学生的纬度 by邢志武20141115 *
	 * 
	 * @param stu_code
	 * @return list
	 * */

	public List<BMapEntity> selectStuLongitudeByStuId(String stu_id) {
		return sqlSession.selectList(
				"com.sict.dao.SignDao.selectStuLongitudeByStuId", stu_id);
	}

	/**
	 * 根据STU_CODE，查询从未签到过的学生的全部信息 by邢志武20141115
	 * 
	 * @param stu_code
	 * @return list
	 * */
	public List<BMapEntity> selectUnSignAllStuByStuId(String stu_id) {
		return sqlSession.selectList(
				"com.sict.dao.SignDao.selectUnSignAllStuByStuId", stu_id);
	}
	/**
	 * 根据stu_id，查询签到情况，本月签到次数
	 * 
	 * @param stu_id
	 * @return list
	 * */
	public List<BMapEntity> selectSignAllStuStateByStuId(String stu_id) {
		return sqlSession.selectList(
				"com.sict.dao.SignDao.selectSignAllStuStateByStuId", stu_id);
	}
	
	
	/**
	 * 根据stu_id，moth查询签到情况 次数
	 * 
	 * @param stu_id
	 * @return list
	 * */
	public List<BMapEntity> selectSignAllStuStateByStuIdAndMoth(String stu_id,String year) {
		Map<String, String> p = new HashMap<String, String>();
		p.put("stu_id", stu_id);
		p.put("year", year);
		return sqlSession.selectList(
				"com.sict.dao.SignDao.selectSignAllStuStateByStuIdAndMoth", p);
	}

	
	
	/**
	 * 根据stu_id，moth查询签到情况 详情
	 * 
	 * @param stu_id
	 * @return list
	 * */
	public List<BMapEntity> selectSignStuStateByStuIdAndMothMes(String stu_id,String year) {
		Map<String, String> p = new HashMap<String, String>();
		p.put("stu_id", stu_id);
		p.put("year", year);
		return sqlSession.selectList(
				"com.sict.dao.SignDao.selectSignStuStateByStuIdAndMothMes", p);
	}
	
	
	public Object updateSignPlace(Sign sg) {
		// TODO Auto-generated method stub
		return sqlSession.update("com.sict.dao.SignDao.updateSignPlace", sg);
	}

	/**
	 * 根据学生id，查询签到过的学生的全部信息 byccc20150117
	 * 
	 * @param id
	 * @return list
	 * */
	public List<Sign> selectByStuID(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.sict.dao.SignDao.selectByStuID", id);
	}

	public List<Sign> selectByStusID(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.sict.dao.SignDao.selectByStusID", id);
	}

	public int insertSignPlace(Sign sg) {
		// TODO Auto-generated method stub
		return sqlSession.insert("com.sict.dao.SignDao.stuQd", sg);
	}

	// 点击签到后将签到时间存入数据库和登陆时间并不是一样的
	public int updateSign_time(Sign sign) {
		// TODO Auto-generated method stub
		return sqlSession.update("com.sict.dao.SignDao.updateSign_Time", sign);
	}

	/**
	 * <!-- 根据实践任务开始时间，查询该小组中从未签到的学生id by 邢志武 2015-01-24 -->
	 * */
	public List<String> selectNeverSinStusByPk_time(String ts, String pk_id) {
		Map<String, String> p = new HashMap<String, String>();
		p.put("ts", ts);
		p.put("pk_id", pk_id);
		return sqlSession.selectList(
				"com.sict.dao.SignDao.selectNeverSinStusByPk_time", p);
	}

	/**
	 * 
	 * @param stu_id
	 * @return
	 *  修改最新的签到数据 sunlei 2015-03-26 
	 */
	public Sign changeLaById(String sid) {
		return sqlSession.selectOne("com.sict.dao.SignDao.changeLaById", sid);
	}

	/**
	 * 
	 * @param group_id
	 * @return
	 * 根据小组id查询该小组本周签到学生的数量 邢志武  2015-03-26 （按任务）
	 */
	public int getSinStusSizeByGroupId(String group_id) {
		return sqlSession.selectOne(
				"com.sict.dao.SignDao.getSinStusSizeByGroupId", group_id);
	}
	
	
	/**
	 * 
	 * @param
	 * @return
	 * 查询某系本周签到学生的数量 邢志武  2015年9月10日 (按班级)
	 */
	public int getNewDepartmentSignStusSize(String org_id, String grade) {
		Map<String, String> m = new HashMap<String, String>();
		m.put("org_id", org_id);
		m.put("grade", grade);
		return sqlSession.selectOne("com.sict.dao.SignDao.getNewDepartmentSignStusSize", m);
	}
	
	/**
	 * 
	 * @param
	 * @return
	 * 获取系校外实习人数（根据班级）
	 */
	public int getNewDepartmentStusSize(String org_id, String grade) {
		Map<String, String> m = new HashMap<String, String>();
		m.put("org_id", org_id);
		m.put("grade", grade);
		return sqlSession.selectOne("com.sict.dao.SignDao.getNewDepartmentStusSize", m);
	}
	/**
	 * 
	 * @param
	 * @return
	 * 获取学院本周签到人数（根据班级）
	 */
	public int getNewCollegeSignStusSize(String org_id, String grade) {
		Map<String, String> m = new HashMap<String, String>();
		m.put("org_id", org_id);
		m.put("grade", grade);
		return sqlSession.selectOne("com.sict.dao.SignDao.getNewCollegeSignStusSize", m);
	}
	/**
	 * 查询商职学院本周签到学生的数量 
	 * @param grade
	 * @return
	 */
	public int getNewSchoolSignStusSize( String grade) {
		return sqlSession.selectOne("com.sict.dao.SignDao.getNewSchoolSignStusSize", grade);
	}
	
	/**
	 * 查询学院 某年的签到使用情况
	 * @param grade
	 * @return
	 */
	public List<Map<String, String>> getCollegeSignstuUsePro( String grade,String year,String org_id) {
		Map<String, String> map=new HashMap<String, String>();
		map.put("grade", grade);
		map.put("year", year);
		map.put("org_id", org_id);
		
		return sqlSession.selectList("com.sict.dao.SignDao.getCollegeSignstuUsePro",map);
	}

	/**
	 * 根据选中年份查找一共有多少个月提交了月总结 李泽 2016/04/21
	 */
	public List<String> getMonthByGrade(String year) {
		year = year + "-%";
		return sqlSession.selectList("com.sict.dao.SignDao.getMonthByGrade",
				year);
	}

	/**
	 * 查找每个学院每个月提交月总结的人数 李泽 2016/04/21
	 */
	public List<Object> getCountByYearAndDpt(String grade, String departmentId,
			String year) {
		Map<String, String> map = new HashMap<String, String>();
		year = year + "-%";
		map.put("grade", grade);
		map.put("department", departmentId);
		map.put("year", year);
		return sqlSession.selectList(
				"com.sict.dao.SignDao.getCountByYearAndDpt", map);
	}
}
