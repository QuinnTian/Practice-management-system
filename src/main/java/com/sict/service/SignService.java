package com.sict.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.SignDao;
import com.sict.entity.BMapEntity;
import com.sict.entity.Sign;
import com.sict.entity.Student;
import com.sict.entity.TeaStu;
import com.sict.util.Common;

/**
 * 功能：..相关的service 使用 @Repository 注释 TeacherDao by郑春光20140910 *
 * 
 * */
@Repository(value = "signService")
@Transactional
public class SignService implements BasicService {

	@Autowired
	SignDao signDao;
	@Resource
	PracticeTaskService practiceTaskService;

	/**
	 * 查询该教师管理的所有学生中签到的学生的stu_code by邢志武 20141114
	 * 
	 * @param String
	 *            teaCode
	 * @return List
	 */
	public List<BMapEntity> selectAllSignStuIdByTeaCode(String tea_code) {
		return this.signDao.selectAllSignStuIdByTeaCode(tea_code);

	}

	/**
	 * 功能：查询从未签到过学生的stu_code by邢志武20141115 *
	 * 
	 * @param String
	 *            teaCode
	 * @return List
	 */
	public List<BMapEntity> selectNeverSignStuIdByTeaCode(String tea_code) {
		return this.signDao.selectNeverSignStuIdByTeaCode(tea_code);

	}

	/**
	 * 查询所需学生的全部信息 by邢志武20141115 *
	 * 
	 * @param String
	 *            teaCode
	 * @return List
	 */
	public List<BMapEntity> selectAllStuByStuID(String stu_id) {
		return this.signDao.selectAllStuByStuID(stu_id);

	}

	/**
	 * 查询所需学生的经度 by邢志武20141115 *
	 * 
	 * @param String
	 *            teaCode
	 * @return List
	 */
	public List<BMapEntity> selectStuLatitudeByStuId(String stu_id) {
		return this.signDao.selectStuLatitudeByStuId(stu_id);

	}

	/**
	 * 查询所需学生的纬度 by邢志武20141115 *
	 * 
	 * @param String
	 *            teaCode
	 * @return List
	 */
	public List<BMapEntity> selectStuLongitudeByStuId(String stu_id) {
		return this.signDao.selectStuLongitudeByStuId(stu_id);

	}

	/**
	 * 查询从未签到过学生的全部信息 by邢志武20141115 *
	 * 
	 * @param String
	 * 
	 * @return List
	 */
	public List<BMapEntity> selectUnSignAllStuByStuId(String stu_id) {
		return this.signDao.selectUnSignAllStuByStuId(stu_id);

	}

	/**
	 * 根据stu_id，moth查询签到情况 次数
	 * 
	 * @param String
	 * 
	 * @return List
	 */
	public List<BMapEntity> selectSignAllStuStateByStuIdAndMoth(String stu_id,
			String year) {
		return this.signDao.selectSignAllStuStateByStuIdAndMoth(stu_id, year);

	}

	/**
	 * 根据stu_id，moth查询签到情况 详情
	 * 
	 * @param String
	 * @return List
	 */
	public List<BMapEntity> selectSignStuStateByStuIdAndMothMes(String stu_id,
			String year) {
		return this.signDao.selectSignStuStateByStuIdAndMothMes(stu_id, year);

	}

	/**
	 * 查询从未签到过学生的全部信息 by邢志武20141115 *
	 * 
	 * @param String
	 * 
	 * @return List
	 */
	public List<BMapEntity> selectSignAllStuStateByStuId(String stu_id) {
		return this.signDao.selectSignAllStuStateByStuId(stu_id);

	}

	public List selectList(Object o) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object insert(Object o) {
		// TODO Auto-generated method stub
		return null;
	}

	public int update(Object o) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(Object o) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Object selectByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object insertOrUpdate(Object o) {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectCount(Object o) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Object updateSignPlace(Sign sg) {
		// TODO Auto-generated method stub

		return signDao.updateSignPlace(sg);
	}

	/**
	 * 添加签到信息 byccc20150117 *
	 * 
	 * @param Sign
	 *            sg
	 * @return int
	 */
	public int insertSignPlace(Sign sg) {
		// TODO Auto-generated method stub
		sg.setId(Common.returnUUID());
		return this.signDao.insertSignPlace(sg);
	}

	/**
	 * <!-- 根据实践任务开始时间，查询该小组中从未签到的学生id by 邢志武 2015-01-24 -->
	 */
	public List<String> selectNeverSinStusByPk_time(String ts, String pk_id) {
		return this.signDao.selectNeverSinStusByPk_time(ts, pk_id);

	}

	/**
	 * 修改最新的签到数据 sunlei 20150409
	 * 
	 */
	public Sign changeLaById(String sid) {
		return signDao.changeLaById(sid);
	}

	/**
	 * 
	 * @param group_id
	 * @return 根据小组id查询该小组本周签到学生的数量 邢志武 2015-03-26 (按任务)
	 * 
	 */

	public int getSinStusSizeByGroupId(String group_id) {
		return signDao.getSinStusSizeByGroupId(group_id);
	}

	/**
	 * 
	 * @param org_id
	 * @param grade
	 * @return 查询学院本周签到学生的数量 邢志武 2015年9月10日 (按班级)
	 */
	public int getNewCollegeSignStusSize(String org_id, String grade) {
		return signDao.getNewCollegeSignStusSize(org_id, grade);
	}

	/**
	 * 
	 * @param org_id
	 * @param grade
	 * @return 查询某系本周签到学生的数量 邢志武 2015年9月10日 (按班级)
	 */
	public int getNewDepartmentSignStusSize(String org_id, String grade) {
		return signDao.getNewDepartmentSignStusSize(org_id, grade);
	}

	/**
	 * 
	 * @param org_id
	 * @param grade
	 * @return 查询商职学院本周签到学生的数量
	 */
	public int getNewSchoolSignStusSize(String grade) {
		return signDao.getNewSchoolSignStusSize(grade);
	}

	/**
	 * 
	 * @param org_id
	 * @param grade
	 * @return 获取系校外实习人数（根据班级）
	 */
	public int getNewDepartmentStusSize(String org_id, String grade) {
		return signDao.getNewDepartmentStusSize(org_id, grade);
	}

	/**
	 * 查询学院 某年的签到使用情况
	 * 
	 * @param grade
	 * @return
	 */
	public List<Map<String, String>> getCollegeSignstuUsePro(String grade,
			String year, String org_id) {
		return signDao.getCollegeSignstuUsePro(grade, year, org_id);
	}

	/**
	 * 根据选中年份查找一共有多少个月提交了月总结 李泽 2016/04/21
	 */
	public List<String> getMonthByGrade(String year) {
		return signDao.getMonthByGrade(year);
	}

	/**
	 * 查找每个学院每个月提交月总结的人数 李泽 2016/04/21
	 */
	public List<String> getCountByYearAndDpt(String grade, String departmentId,
			String year) {
		// 学院人数
		int collegeCount = practiceTaskService.getCollegeStusSize(departmentId,
				grade);
		System.out.println("*******************学院人数:" + departmentId+","+collegeCount);
		List<String> counts = new ArrayList<String>();
		List<Object> list = signDao.getCountByYearAndDpt(grade, departmentId,
				year);
		double stuCount;
		double usePro;
		for (int i = 0; i < list.size(); i++) {
			String count = list.get(i).toString();
			stuCount = Double.parseDouble(count);
			System.out.println("*******************stuCount:" + stuCount);
			if (collegeCount != 0) {
				usePro = (stuCount / collegeCount) * 100;
				counts.add(Common.getDoubetoString(usePro));
			}
		}
		return counts;
	}
}
