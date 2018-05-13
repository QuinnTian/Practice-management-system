package com.sict.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.PracticeTaskDao;
import com.sict.entity.BMapEntity;
import com.sict.entity.Org;
import com.sict.entity.Param;
import com.sict.entity.PracticeTask;
import com.sict.entity.RegionalDistribution;
import com.sict.entity.ShortTime;
import com.sict.entity.Student;
import com.sict.util.Common;
import com.sict.util.jsonUtil;

/**
 * 功能：..相关的service 使用 @Repository 注释 PracticeRecordDao by吴敬国20140927 *
 */
@Repository(value = "practiceTaskService")
@Transactional
public class PracticeTaskService implements BasicService {
	/**
	 * 注入shorttimeService by杨梦肖20160603 *
	 * 
	 * */
	@Resource(name = "shortTimeService")
	private ShortTimeService shortTimeService;
	/**
	 * 注入practiceTaskService by邢志武20150401 *
	 * 
	 * */
	@Resource(name = "practiceTaskService")
	private PracticeTaskService practiceTaskService;
	@Resource
	OrgService OrgService;
	@Resource
	GroupsService GroupsService;
	@Resource
	GroupMembersService GroupMembersService;
	@Resource
	SignService SignService;
	@Resource
	StudentService studentService;
	@Resource
	RegionalDistributionService regionalDistributionService;
	@Resource
	FilesService filesService;
	@Autowired
	PracticeTaskDao practiceTaskDao;
	@Resource
	private ParamService paramService;
	@Resource
	private OrgService orgService;

	public List selectList(Object o) {
		// TODO Auto-generated method stub
		return practiceTaskDao.selectList(o);
	}

	public Object insert(Object o) {
		int a = 0;
		PracticeTask p = (PracticeTask) o;
		// p.setId(Common.returnUUID());
		p.setState("1");
		a = practiceTaskDao.insert(p);
		DictionaryService.updatePracticeTask(p);
		DictionaryService.updatePracticeTaskNameByName(p);
		return a;
	}

	public int update(Object o) {
		int a = 0;
		PracticeTask p = (PracticeTask) o;
		a = practiceTaskDao.update(p);
		DictionaryService.updatePracticeTask(p);
		DictionaryService.updatePracticeTaskNameByName(p);
		return a;
	}

	public int delete(Object o) {
		int a = 0;
		PracticeTask p = (PracticeTask) o;
		a = practiceTaskDao.delete(p);
		DictionaryService.deletePracticeTask(p.getId());
		DictionaryService.deletePracticeTaskNameByName(p.getTask_name());
		return a;
	}

	public PracticeTask selectByID(String id) {
		PracticeTask practiceTask = (PracticeTask) practiceTaskDao
				.selectByID(id);
		return practiceTask;
	}

	public Object insertOrUpdate(Object o) {
		return null;
	}

	public int selectCount(Object o) {
		return 0;
	}

	/**
	 * 方法功能不详 微信端调用
	 * 
	 */
	public List<PracticeTask> selectAllPracticeTasks() {
		return this.practiceTaskDao.selectAllPracticeTasks();
	}

	/**
	 * 分数统计 吕付豹 吴敬国2015年5月26日
	 * */
	public List<Map<String, String>> getPracticeScoreList(String practice_id) {
		return practiceTaskDao.getPracticeScoreList(practice_id);
	}

	/**
	 * 管理员 根据年份和部门id(包括学院和系) 任务类型 (实习，实训)获得实践任务 by吴敬国 2015-03-13
	 * 
	 * @param String
	 *            dept_id, String grade, String task_type
	 * @return List<PracticeTask>
	 */
	public List<PracticeTask> selectPracticeTasksByDeptIdAndGrade(
			String dept_id, String grade, String task_type) {
		return practiceTaskDao.selectPracticeTasksByDeptIdAndGrade(dept_id,
				grade, task_type);
	}

	/**
	 * 查询实践任务中已经有的年级 by邢志武 2015-03-13
	 * 
	 * @param
	 * @return List<PracticeTask>
	 */
	public List<PracticeTask> getPracticeTasksGrade() {
		return this.practiceTaskDao.getPracticeTasksGrade();
	}

	/**
	 * 查询实践任务 by邢志武 2015-03-13
	 * 
	 * @param String
	 *            grade, String dept_id
	 * @return List<PracticeTask>
	 */
	public List<PracticeTask> getPracticeTasksGradeByGradeAndDept_id(
			String grade, String dept_id) {
		return this.practiceTaskDao.getPracticeTasksGradeByGradeAndDept_id(
				grade, dept_id);
	}

	/**
	 * 该老师负责的实训任务
	 * 
	 * @param grade
	 * @param tea_id
	 * @return 邢志武 2015年5月10日 14:13:36
	 */
	public List<PracticeTask> getPracticeTasksGradeByGradeAndTea_id(
			String grade, String tea_id) {
		return this.practiceTaskDao.getPracticeTasksGradeByGradeAndTea_id(
				grade, tea_id);
	}

	/**
	 * 根据任务编号查询任务名称 by楚晨晨 20141105
	 * 
	 * @param String
	 *            practice_id
	 * @return List<PracticeTask>
	 */
	public List<PracticeTask> selectTask_name(String practice_id) {
		// TODO Auto-generated method stub
		return this.practiceTaskDao.selectTask_name(practice_id);
	}

	/**
	 * 根据本人的多个实训任务选出集合 byccc 2015-03-13
	 * 
	 * @param String
	 *            praid
	 * @return List<PracticeTask>
	 */
	public List<PracticeTask> selectPracticeTasks(String praid) {
		return this.practiceTaskDao.selectPracticeTasksPd(praid);
	}

	/**
	 * 根据本人的实践任务id选出实践任务 byccc 2015-03-13
	 * 
	 * @param String
	 *            praid
	 * @return PracticeTask
	 */
	public PracticeTask selectonlyMe(String praid) {
		return practiceTaskDao.selectonlyMe(praid);
	}

	/**
	 * 教师 根据教师id和入学年份获得实习任务 by吴敬国 2015-03-13 2015-6-11
	 * 
	 * @param String
	 *            tea_id,String grade
	 * @return List<PracticeTask>
	 */
	public List<PracticeTask> getPracticeTasksByGradeAndTea_id(String tea_id,
			String grade) {
		PracticeTask pra = new PracticeTask();
		pra.setState("1");
		pra.setTea_id(tea_id);
		pra.setTask_type("1");
		pra.setGrade(grade);
		return practiceTaskDao.selectList(pra);
	}

	/**
	 * 教师 根据教师id和入学年份，任务类型（实习 实训）获得实习实训任务 by吴敬国 2015-03-13
	 * 
	 * @param String
	 *            tea_id,String grade,String task_type
	 * @return List<PracticeTask>
	 */
	public List<PracticeTask> getPracticeTasksByGradeAndTea_idAndTasktype(
			String tea_id, String grade, String task_type) {
		PracticeTask p = new PracticeTask();
		p.setGrade(grade);
		p.setTask_type(task_type);
		p.setTea_id(tea_id);
		p.setState("1");
		List<PracticeTask> ptList = practiceTaskDao.selectList(p);
		return ptList;
	}

	/**
	 * 查询实践任务 by邢志武 2015-03-13 没有调用方法 吴敬国2015年6月16日检查
	 * 
	 * @param String
	 *            tea_id,String year
	 * @return List<PracticeTask>
	 */
	public List<PracticeTask> getPracticeTasksBytea_id(String tea_id,
			String year) {
		return this.practiceTaskDao.getPracticeTasksBytea_id(tea_id, year);
	}

	/**
	 * 查询校外实践任务 by邢志武 2015年6月3日
	 * 
	 * @param String
	 *            tea_id,String year
	 * @return List<PracticeTask>
	 */
	public List<PracticeTask> getOutPracticeTasksBytea_id(String tea_id,
			String year) {
		return this.practiceTaskDao.getOutPracticeTasksBytea_id(tea_id, year);
	}

	/**
	 * 根据实践任务id 查询小组成员id（学生） 邢志武 2015-01-24
	 * 
	 * @param String
	 *            id,String year
	 * @return List<String>
	 */
	public List<String> getGroupMembersBypId(String id, String year) {
		return this.practiceTaskDao.getGroupMembersBypId(id, year);
	}

	/**
	 * 查出编号最大的一条信息核对记录 吴敬国 2015-6-16 检查 没有调用方法 byccc 2015-03-13
	 * 
	 * @param
	 * @return
	 */
	public String getMaxpracticeCode() {
		return this.practiceTaskDao.getMaxpracticeCode();
	}

	/**
	 * 根据教师id查询校外实习 by邢志武 2015-03-13 到排序
	 * 
	 * @param String
	 *            tea_id
	 * @return
	 */
	public List<PracticeTask> selectOutSchoolPracticeTasks(String tea_id) {
		return practiceTaskDao.selectOutSchoolPracticeTasks(tea_id);
	}

	/**
	 * 根据实践任务id 查询学生id by邢志武 2015-03-13
	 * 
	 * @param
	 * @return
	 */
	public List<String> selectStusId(String practice_id) {
		return practiceTaskDao.selectStusId(practice_id);
	}

	/**
	 * 根据实践任务id 查询学生id bywjg 2016-2-4
	 * 
	 * @param
	 * @return
	 */
	public List<String> selectStusIdByPractice(String practice_id) {
		return practiceTaskDao.selectStusIdByPractice(practice_id);
	}

	/**
	 * 通过教师id和入学年份查出对应的老师所带有效的的实习任务 by王磊 2015-03-13
	 * 
	 * @param
	 * @return
	 */
	public List<PracticeTask> getPracticeTaskByGradeAndTeaId(String tea_id,
			String grade) {
		PracticeTask pra = new PracticeTask();
		pra.setState("1");
		pra.setTea_id(tea_id);
		pra.setGrade(grade);
		pra.setTask_type("1");
		return practiceTaskDao.selectList(pra);
	}

	/**
	 * 根据实践任务id 查询该组学生从未签到过的学生 by邢志武 2015-03-12
	 * 
	 * @param practice_id
	 * @return String (学生id)
	 */
	public List<String> getUnSinStusIdByPk_id(String pk_id) {
		return this.practiceTaskDao.getUnSinStusIdByPk_id(pk_id);
	}

	/**
	 * 
	 * @param org_id
	 * @param grade
	 * @return 查询各系校外实习任务id 参数（系id,年级 ) 邢志武 2015-03-26
	 */
	public List<String> getPracTaskIdByOrgIdAndGrade(String grade, String org_id) {
		return this.practiceTaskDao.getPracTaskIdByOrgIdAndGrade(org_id, grade);
	}

	/**
	 * @param grade
	 * @param college_id
	 * @return 获取全院校外实习人数 邢志武 2015-03-26
	 */
	public int getCollegeStusSize(String college_id, String grade) {
		int CollegeStusSize = 0;// 学院校外实习人数
		List<Org> departments = OrgService.getOrgDeptByCollegeId(college_id);
		for (int i = 0; i < departments.size(); i++) {
			String org_id = departments.get(i).getId();
			int Department = getDepartmentStusSize(org_id, grade);
			CollegeStusSize = CollegeStusSize + Department;
		}
		return CollegeStusSize;
	}

	/**
	 * 
	 * @param org_id
	 * @param grade
	 * @return 获取系校外实习人数（根据任务思路） 邢志武 2015-03-26
	 */
	public int getDepartmentStusSize(String org_id, String grade) {
		int Department = 0;// 系人数
		List<String> prac_id = getPracTaskIdByOrgIdAndGrade(grade, org_id);
		for (int i = 0; i < prac_id.size(); i++) {
			// 根据实践任务id获取小组id
			String practick_id = prac_id.get(i);
			List<String> group_id = GroupsService.getGroupId(practick_id);
			for (int j = 0; j < group_id.size(); j++) {
				int groupStus = GroupMembersService.getStudentsSize(group_id
						.get(j));
				Department = Department + groupStus;
			}
		}
		return Department;
	}

	/**
	 * 
	 * @param org_id
	 * @param grade
	 * @return 获取系校外实习人数（根据班级） 邢志武 2015-03-26
	 */
	public int getNewDepartmentStusSize(String org_id, String grade) {
		int Department = SignService.getNewDepartmentStusSize(org_id, grade);
		return Department;
	}

	/**
	 * @param grade
	 * @param college_id
	 * @return 获取全院校外实习本周签到的人数 邢志武 2015-03-26
	 */
	public int getCollegeSignStusSize(String college_id, String grade) {
		int CollegeStusSize = this.SignService.getNewCollegeSignStusSize(
				college_id, grade);// 学院校外实习人数
		/*
		 * List<Org> departments = OrgService.getOrgDeptByCollegeId(college_id);
		 * for (int i = 0; i < departments.size(); i++) { String org_id =
		 * departments.get(i).getId(); int DepartmentSignStus =
		 * getNewDepartmentSignStusSize(org_id, grade); CollegeStusSize =
		 * CollegeStusSize + DepartmentSignStus; }
		 */
		return CollegeStusSize;
	}

	/**
	 * 
	 * @param org_id
	 * @param grade
	 * @return 查询某系本周签到人数 (按任务，效率慢) 邢志武 2015-03-30
	 */
	public int getDepartmentSignStusSize(String org_id, String grade) {
		int DepartmentSignStus = 0;
		// 查询各系校外实习任务id
		List<String> prac_id = getPracTaskIdByOrgIdAndGrade(grade, org_id);
		for (int i = 0; i < prac_id.size(); i++) {
			// 根据实践任务id获取小组id
			String practick_id = prac_id.get(i);
			List<String> group_id = GroupsService.getGroupId(practick_id);
			for (int j = 0; j < group_id.size(); j++) {
				// 查询本周签到人数
				int SignGroupStus = SignService
						.getSinStusSizeByGroupId(group_id.get(j));
				DepartmentSignStus = DepartmentSignStus + SignGroupStus;
			}
		}
		return DepartmentSignStus;

	}

	/**
	 * 
	 * @param org_id
	 * @param grade
	 * @return 查询某系本周签到人数 (按班级，速度快) 邢志武 2015年9月10日
	 */
	public int getNewDepartmentSignStusSize(String org_id, String grade) {
		int DepartmentSignStus = SignService.getNewDepartmentSignStusSize(
				org_id, grade);
		return DepartmentSignStus;
	}

	/**
	 * 
	 * @param college_id
	 * @param grade
	 * @return 查询全院当天未签到的人数 邢志武 2015-03-30
	 */
	public int getDepartmentUnSignStusSize(String college_id, String grade) {
		int UnSignStus = 0;
		int DepartmentSignStusSize = this.getCollegeSignStusSize(college_id,
				grade);
		int DepartmentStusSize = this.getCollegeStusSize(college_id, grade);
		UnSignStus = DepartmentStusSize - DepartmentSignStusSize;
		return UnSignStus;
	}

	/**
	 * 
	 * @param org_id
	 * @param grade
	 * @return 查询某系当天未签到的人数 邢志武 2015-03-30
	 */
	public int getCollegeUnSignStusSize(String org_id, String grade) {
		int UnSignStus = 0;
		int CollegeSignStusSize = this.getDepartmentSignStusSize(org_id, grade);
		int CollegeStusSize = this.getDepartmentStusSize(org_id, grade);
		UnSignStus = CollegeStusSize - CollegeSignStusSize;
		return UnSignStus;
	}

	/**
	 * 
	 * @param dept_id
	 * @param grade
	 * @return 获取本周某学院签到人数的比例 邢志武 2015-03-30
	 */
	public double getCollegeDaySignPro(String dept_id, String grade) {
		double rate = 0;
		// 获取全院校外实习的人数
		int CollegeStusSize = getCollegeStusSize(dept_id, grade);
		// 获取当天全院校外实习签到的人数
		int CollegeSignStusSize = getCollegeSignStusSize(dept_id, grade);
		double CollegeStusSize1 = (double) CollegeStusSize;
		double CollegeSignStusSize1 = (double) CollegeSignStusSize;
		// 得出当天签到率
		if (CollegeStusSize1 == 0.0) {
			rate = 0;
			return rate;
		}
		rate = CollegeSignStusSize1 / CollegeStusSize1;
		return rate;
	}

	/**
	 * 
	 * @param dept_id
	 * @param grade
	 * @return 获取本周某系签到人数的比例 邢志武 2015-03-30
	 */
	public double getDepartmentDaySignPro(String dept_id, String grade) {
		double rate = 0;
		// 获取某系校外实习的人数
		int DepartmentStusSize = getNewDepartmentStusSize(dept_id, grade);
		// 获取本周某系校外实习签到的人数
		int DepartmentSignStusSize = getNewDepartmentSignStusSize(dept_id,
				grade);
		double DepartmentStusSize1 = (double) DepartmentStusSize;
		double DepartmentSignStusSize1 = (double) DepartmentSignStusSize;
		// 得出当天签到率
		if (DepartmentStusSize1 == 0.0) {
			rate = 0;
			return rate;
		}
		rate = (DepartmentSignStusSize1 / DepartmentStusSize1) * 100;
		// 处理小数点保留位数问题
		String falseRate = new java.text.DecimalFormat("#.00").format(rate);
		rate = Double.parseDouble(falseRate);
		return rate;
	}

	/**
	 * 
	 * @param dept_id
	 * @param grade
	 * @return 获取学校校外实习人数 邢志武 2015-03-30
	 */
	public int getSchoolStus(String grade) {
		int SchoolStusSize = this.GroupMembersService.getSchoolStudentsSize(grade);// 学院校外实习人数
		/*
		 * List<String> departments = OrgService.getColleges(); for (int i = 0;
		 * i < departments.size(); i++) { String org_id=departments.get(i); int
		 * CollegeStus = getCollegeStusSize(org_id, grade); SchoolStusSize
		 * =SchoolStusSize + CollegeStus; }
		 */

		return SchoolStusSize;

	}

	/**
	 * @param grade
	 * @param college_id
	 * @return 获取全校校外实习本周签到的人数 邢志武 2015-03-26
	 */
	public int getSchoolSignStusSize(String grade) {
		int SchoolSignStusSize = this.SignService
				.getNewSchoolSignStusSize(grade);// 学校校外实习签到人数
		return SchoolSignStusSize;
	}

	/**
	 * 
	 * @param dept_id
	 * @param grade
	 * @return 获取本周学校签到人数的比例 邢志武 2015-03-30
	 */
	public double getSchoolDaySignPro(String grade) {
		double rate = 0;
		// 获取全校校外实习的人数
		int SchoolStusSize = getSchoolStus(grade);
		// 获取当天全校校外实习签到的人数
		int SchoolSignStusSize = getSchoolSignStusSize(grade);
		double SchoolStusSize1 = (double) SchoolStusSize;
		double SchooleSignStusSize1 = (double) SchoolSignStusSize;
		// 得出当天签到率
		if (SchoolStusSize1 == 0.0) {
			rate = 0;
			return rate;
		}
		rate = SchooleSignStusSize1 / SchoolStusSize1;
		return rate;
	}

	/**
	 * 根据Task_name判断任务名称是否存在 by吴敬国 2015-03-25
	 * 
	 * @param String
	 *            task_name
	 * @return int
	 */
	public int selectByTaskName(String task_name) {
		PracticeTask pra = new PracticeTask();
		pra.setTask_name(task_name);
		int a = practiceTaskDao.selectCount(pra);
		return a;
	}

	/**
	 * 查出编号最大的一条实践任务 by吴敬国 2015-03-25
	 * 
	 * @param practice_id
	 * @return String (学生id)
	 */
	public String maxPraCode(String pra_code) {
		return this.practiceTaskDao.maxPraCode(pra_code);
	}

	/**
	 * 根据学生的id得到这个学生有多少的实习任务 bywjg 2015-04-6
	 * 
	 * @param String
	 *            stu_id,String task_type
	 * @return List<PracticeTask>
	 */
	public List<PracticeTask> getTaskByStuIdAndType(String stu_id,
			String task_type) {
		return practiceTaskDao.getTaskByStuIdAndType(stu_id, task_type);
	}

	/**
	 * 根据实践任务id 查询该老师负责的所有校外实习的学生id by邢志武 2015年5月7日
	 * 
	 * @param
	 * @return
	 */
	public List<String> selectAllOutSchoolStusId(String tea_id) {
		return practiceTaskDao.selectAllOutSchoolStusId(tea_id);
	}

	/**
	 * 通过教师id和实践id判断是否存在 by王磊 2015年5月14日
	 * 
	 * @param
	 * @return
	 */
	public int getCounts(String practice_id, String tea_id) {
		PracticeTask pra = new PracticeTask();
		pra.setId(practice_id);
		pra.setTea_id(tea_id);
		return practiceTaskDao.selectCount(pra);
	}

	/**
	 * 教师所对应的任务年级集合
	 * 
	 * @author 王磊 2015年5月14日
	 * @param String
	 *            tea_id
	 * @return List<String>
	 */
	public List<String> getGrades(String tea_id) {
		return practiceTaskDao.getGrades(tea_id);

	}

	/**
	 * 根据教师的id 获得实习任务id by sl
	 */
	public List<PracticeTask> SelectPracticetaskByTeaid(String tea_id) {
		PracticeTask pra = new PracticeTask();
		pra.setState("1");
		pra.setTask_type("1");
		pra.setTea_id(tea_id);
		return practiceTaskDao.selectList(pra);
	}

	/**
	 * 根据实习任务id 获得实习学生id by sl
	 */
	public List<String> SelectStuidByPracticetaskid(String id) {
		// TODO Auto-generated method stub
		return practiceTaskDao.SelectStuidByPracticetaskid(id);
	}

	/**
	 * 根据学生id判断该学生是否已有实习任务 by王磊 日期 ：2015年6月20日
	 */
	public int getCount(String stuId) {
		return practiceTaskDao.getCount(stuId);

	}

	public PracticeTask selectonlyMeById(String praid, String stu_id) {
		// TODO Auto-generated method stub
		return practiceTaskDao.selectonlyMeById(praid, stu_id);
	}

	/**
	 * 
	 * @param org_id
	 * @param grade
	 * @return
	 * @author WuGee 通过系id查询老师id（以学生为本，用于考核系指标）
	 */
	public List<String> selectTeaIdbyDempartId(String org_id, String grade) {
		// TODO Auto-generated method stub
		return practiceTaskDao.selectTeaIdbyDempartId(org_id, grade);
	}

	/**
	 * 获取某老师的学生所在地区分布 2015年9月21日
	 * 
	 * @author WuGee
	 * @throws Exception
	 */
	public Map<String, Integer> getMapStudent(String tea_id, String grade)
			throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		// 获取该老师管理的学生中签到学生的所有信息
		List<BMapEntity> allSinStuMes = new ArrayList<BMapEntity>();
		List<PracticeTask> pks = getPracticeTaskByGradeAndTeaId(tea_id, grade);
		if (pks.size() > 0) {
			String pk_id = pks.get(0).getId();
			// 获取该老师管理的学生的stu_id
			List<String> allSinStuId = selectStusId(pk_id);
			for (int i = 0; i < allSinStuId.size(); i++) {
				String stu_id = allSinStuId.get(i);
				// 根据stu_code查询所需要的学生信息
				allSinStuMes = SignService.selectAllStuByStuID(stu_id);
				if (allSinStuMes.size() > 0) {
					double latDouble = allSinStuMes.get(0).getLatitude();
					double lonDouble = allSinStuMes.get(0).getLongitude();
					String lat = String.valueOf(latDouble);
					String lon = String.valueOf(lonDouble);
					String city = jsonUtil.getCityNameByLocation(lat, lon);
					boolean contains = map.containsKey(city);
					if (contains == true) {
						Integer a = map.get(city) + 1;
						map.put(city, a);
					} else {
						if (city.equals("")) {
							city = "其他";
						}
						map.put(city, 1);
					}
				}
			}
		}
		return map;
	}

	/**
	 * 获取某个系的学生分布地区//临时表查询，速度快
	 * 
	 * @param tea_id
	 * @param grade
	 * @author WuGee
	 * @throws Exception
	 */
	public Map<String, Integer> getMapDeptementStudentDistribution(
			String dept_id, String grade) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		RegionalDistribution r = new RegionalDistribution();
		r.setGrade(grade);
		r.setOrg_id(dept_id);
		List<RegionalDistribution> reglist = this.regionalDistributionService
				.selectList(r);
		for (int i = 0; i < reglist.size(); i++) {
			r = reglist.get(i);
			map.put(r.getDistribution_name(), r.getStucount());
		}
		return map;
	}

	/**
	 * 每天一点用于储存临时数据（某系学生分布）
	 * 
	 * @throws Exception
	 */
	public void insertMapDeptementStudentDistribution() throws Exception {
		// 一次存入三个年级的统计结果
		String grade = Common.getDefaultYear();
		String preGrade = String.valueOf(Integer.parseInt(grade) - 1);
		String nextGrade = String.valueOf(Integer.parseInt(grade) + 1);
		List<String> grades = new ArrayList<String>();
		grades.add(preGrade);
		grades.add(grade);
		grades.add(nextGrade);
		Map<String, Integer> map = new HashMap<String, Integer>();
		List<Org> departmentlist = this.OrgService.getAllCollege();
		for (int k = 0; k < departmentlist.size(); k++) {
			Org department = departmentlist.get(k);
			List<Org> facultyList = this.OrgService.getAllDeptByParentId(department
					.getId());
			for (int j = 0; j < facultyList.size(); j++) {
				String faculty = facultyList.get(j).getId();
				for (int i = 0; i < grades.size(); i++) {
					String year = grades.get(i);
					map = getMapDeptementStudent(faculty, year);
					RegionalDistribution reg = new RegionalDistribution();
					reg.setOrg_id(faculty);
					reg.setGrade(year);
					this.regionalDistributionService.delete(reg);
					for (String key : map.keySet()) {
						System.out.println("key= " + key + " and value= "
								+ map.get(key));
						RegionalDistribution r = new RegionalDistribution();
						r.setGrade(year);
						r.setDistribution_name(key);
						r.setOrg_id(faculty);
						r.setState("1");
						r.setStucount(map.get(key));
						regionalDistributionService.insert(r);
					}
				}
			}
		}
	}

	/**
	 * 用于统计学生地区分布
	 * 
	 * @param tea_id
	 * @param grade
	 * @author WuGee
	 * @throws Exception
	 */
	public Map<String, Integer> getMapDeptementStudent(String dept_id,
			String grade) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		List<Student> studentlist = studentService.getDepartmentStus(dept_id,
				grade);
		// 获取该老师管理的学生中签到学生的所有信息
		List<BMapEntity> allSinStuMes = new ArrayList<BMapEntity>();
		for (int i = 0; i < studentlist.size(); i++) {
			String stu_id = studentlist.get(i).getId();
			// 根据stu_code查询所需要的学生信息
			allSinStuMes = SignService.selectAllStuByStuID(stu_id);
			if (allSinStuMes.size() > 0) {
				double latDouble = allSinStuMes.get(0).getLatitude();
				double lonDouble = allSinStuMes.get(0).getLongitude();
				String lat = String.valueOf(latDouble);
				String lon = String.valueOf(lonDouble);
				String city = jsonUtil.getCityNameByLocation(lat, lon);
				boolean contains = map.containsKey(city);
				if (contains == true) {
					Integer a = map.get(city) + 1;
					map.put(city, a);
				} else {
					if (city.equals("")) {
						city = "其他";
					}
					map.put(city, 1);
				}
			}
		}

		return map;
	}

	/**
	 * 获取某个学院的学生地区分布 Wugee
	 * 
	 * @param tea_id
	 * @param grade
	 * @return
	 * @throws Exception
	 */
	public Map<String, Integer> getCollegeStudent(String dept_id, String grade)
			throws Exception {
		Map<String, Integer> collegeMap = new HashMap<String, Integer>();
		List<Org> department = this.OrgService.getAllDeptByCollegeId(dept_id);
		for (int i = 0; i < department.size(); i++) {
			String org_id = department.get(i).getId();
			Map<String, Integer> map = getMapDeptementStudentDistribution(
					org_id, grade);
			// 遍历map
			for (Entry<String, Integer> entry : map.entrySet()) {
				String city = entry.getKey();
				boolean contains = collegeMap.containsKey(city);
				if (contains == true) {
					Integer a = collegeMap.get(city) + entry.getValue();
					collegeMap.put(city, a);
				}
				// map集合中没有此省份
				else {
					// 百度地图未查询到省份标记为其他
					if (city.equals("")) {
						city = "其他";
					}
					collegeMap.put(city, entry.getValue());
				}
			}
		}
		return collegeMap;
	}

	/**
	 * 获取整个学校的学生地区分布 Wugee
	 * 
	 * @param tea_id
	 * @param grade
	 * @return
	 * @throws Exception
	 */
	public Map<String, Integer> getSchoolStudent(String dept_id, String grade)
			throws Exception {
		Map<String, Integer> schoolMap = new HashMap<String, Integer>();
		List<Org> department = this.OrgService.getAllCollege();
		for (int i = 0; i < department.size(); i++) {
			String org_id = department.get(i).getId();
			Map<String, Integer> map = getCollegeStudent(org_id, grade);
			// 遍历map
			for (Entry<String, Integer> entry : map.entrySet()) {
				String city = entry.getKey();
				boolean contains = schoolMap.containsKey(city);
				if (contains == true) {
					Integer a = schoolMap.get(city) + entry.getValue();
					schoolMap.put(city, a);
				}
				// map集合中没有此省份
				else {
					// 百度地图未查询到省份标记为其他
					if (city.equals("")) {
						city = "其他";
					}
					schoolMap.put(city, entry.getValue());
				}
			}
		}
		return schoolMap;
	}

	/**
	 * 通过实践任务id，起，始时间，当前月份，查询出该老师当月合格实习人数 (合格实习人数以学生上传实习月总结并且老师已批阅的数量为准)
	 * 
	 * @param prc_id
	 * @param start_time
	 * @param end_time
	 * @param now_time
	 * @return
	 */
	public double getTeacherMouthCount(String prc_id, String start_time,
			String end_time, String now_time) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("prc_id", prc_id);
		map.put("start_time", start_time);
		map.put("end_time", end_time);
		map.put("now_time", now_time);
		return practiceTaskDao.getTeacherMouthCount(map);
	}

	/**
	 * 获取某个老师当月工作量成绩
	 * 
	 * @param time
	 * @param pric
	 * @return
	 */
	public Map<String, Double> getTeacherMouthApicData(String pric,
			String tea_id, String grade) {
		Map<String, Double> map = new HashMap<String, Double>();
		// 指导记录是否上传，决定工作质量系数的大小
		double guideCoefficient = 0.7;
		double score = 0;
		double theoryScore = 0;
		double c = 50;
		double stateCount = 0;// 特殊状态学生（征兵）
		Map<String, String> time = Common.getTimeForTeacherAplic();
		String start_time = time.get("startTime");
		String end_time = time.get("endTime");
		String now_time = time.get("nowTime");
		// 是否上传月总结
		int count = filesService.getTeacherGuideCount(start_time, end_time,
				pric);
		if (count > 0) {
			guideCoefficient = 1;
		}
		// 合格实习人数（合格实习人数以学生上传实习月总结并且老师已批阅的数量为准）
		double qualifiedCount = getTeacherMouthCount(pric, start_time,
				end_time, now_time);
		List<String> listStudent = getGroupMembersBypId(pric, grade);
		for (int i = 0; i < listStudent.size(); i++) {
			String stu_id = listStudent.get(i);
			Student stu = DictionaryService.findStudent(stu_id);
			if (stu.getPractice_state().equals("180")) {
				stateCount = stateCount + 1;
			}

		}
		qualifiedCount = qualifiedCount + stateCount;
		// 教师所带的实习人数
		double studentSize = listStudent.size();
		// 教师工作量分数 --(合格实习人数/50)*9*4*系数（1或0.7）
		double a = (qualifiedCount / c);
		// 教师理想工作量
		double b = (studentSize / c);
		// 教师实际工作量
		score = a * 9 * 4 * guideCoefficient;
		theoryScore = b * 9 * 4 * 1;
		// 教师完成度（实际工作量/理想工作量）
		double theoryApicScore = score / theoryScore;
		map.put("score", score);
		map.put("qualifiedCount", qualifiedCount);
		map.put("studentSize", studentSize);
		map.put("theoryApicScore", theoryApicScore);
		map.put("guideCoefficient", guideCoefficient);
		return map;
	}

	/**
	 * 动态获取某个老师某个月工作量成绩
	 * 
	 * @param time
	 * @param pric
	 * @return
	 */
	public Map<String, Double> getTeacherMouthApicData2(String pric,
			String tea_id, String mouth, String year, String grade,HttpSession session) {
		Map<String, Double> map = new HashMap<String, Double>();
		// 指导记录是否上传，决定工作质量系数的大小
		double guideCoefficient = 0.7;
		double score = 0;
		double theoryScore = 0;
		double c = 50;
		double stateCount = 0;// 特殊状态学生（征兵）
		Map<String, String> time = Common.getTimeForTeacherAplic2(mouth, year);
		String start_time = time.get("startTime");
		String end_time = time.get("endTime");
		String now_time = time.get("nowTime");
		String org_id = orgService.getCollegeIdByTeaId(session);
		Org org = orgService.selectByID(org_id);
		Param p1 = new Param();
		p1.setParam_name("教师总结");
		p1.setDept_id(org.getOrg_code());
		Param param = new Param();
		param = paramService.selectParambyIdAndParam_name(p1);// 取出学院是否有总结参数
		//判断学院是否有要求上传教师总结
		if (param != null) {
			if (param.getParam_code().equals("false")) {
				guideCoefficient = 1.0;
			} else {
				// 教师是否上传月总结
				// 是否上传月总结
				int count = filesService.getTeacherGuideCount(start_time, end_time,
						pric);
				if (count > 0) {
					guideCoefficient = 1;
				}
			}
		} else {
			// 教师是否上传月总结
			// 是否上传月总结
			int count = filesService.getTeacherGuideCount(start_time, end_time,
					pric);
			if (count > 0) {
				guideCoefficient = 1;
			}
		}
         
		// 合格实习人数（合格实习人数以学生上传实习月总结并且老师已批阅的数量为准）
		double qualifiedCount = getTeacherMouthCount(pric, start_time,
				end_time, now_time);
		List<String> listStudent = getGroupMembersBypId(pric, grade);
		for (int i = 0; i < listStudent.size(); i++) {
			String stu_id = listStudent.get(i);
			Student stu = DictionaryService.findStudent(stu_id);
			if (stu.getPractice_state().equals("180")) {
				stateCount = stateCount + 1;
			}
		}
		qualifiedCount = qualifiedCount + stateCount;
		// 教师所带的实习人数
		double studentSize = listStudent.size();
		// 教师工作量分数 --(合格实习人数/50)*9*4*系数（1或0.7）
		double a = (qualifiedCount / c);
		// 教师理想工作量
		double b = (studentSize / c);
		// 教师实际工作量
		score = a * 9 * 4 * guideCoefficient;
		theoryScore = b * 9 * 4 * 1;
		// 教师完成度（实际工作量/理想工作量）
		double theoryApicScore = score / theoryScore;
		map.put("score", score);
		map.put("qualifiedCount", qualifiedCount);
		map.put("studentSize", studentSize);
		map.put("theoryApicScore", theoryApicScore);
		map.put("guideCoefficient", guideCoefficient);
		return map;
	}

	/**
	 * 实践任务编码生成 2015-12-28 代码整理
	 * 
	 * @param
	 * @return
	 */
	public String getPracticeCode(String grade, String tea_id,
			String task_type, String tea_code1) {
		// 自动生成实践任务的编码
		String dept_id = DictionaryService.findTeacher(tea_id).getDept_id();
		String org_code = null;
		String orgcode1 = null;
		String orgcode2 = null;
		String orgcode3 = null;
		String org_level = DictionaryService.findOrg(dept_id).getOrg_level();
		// 获取老师院部编号
		if (org_level.equalsIgnoreCase("1") || org_level.equalsIgnoreCase("2")) {
			org_code = DictionaryService.findOrg(dept_id).getOrg_code();
		} else if (org_level.equalsIgnoreCase("3")) {
			orgcode1 = DictionaryService.findOrg(dept_id).getOrg_code();
			String parent_id = DictionaryService.findOrg(dept_id)
					.getParent_id();
			orgcode2 = DictionaryService.findOrg(parent_id).getOrg_code();
			org_code = orgcode2 + orgcode1;
		} else if (org_level.equalsIgnoreCase("4")) {
			orgcode1 = DictionaryService.findOrg(dept_id).getOrg_code();
			String parent_id = DictionaryService.findOrg(dept_id)
					.getParent_id();
			orgcode2 = DictionaryService.findOrg(parent_id).getOrg_code();
			String parent_id1 = DictionaryService.findOrg(parent_id)
					.getParent_id();
			orgcode3 = DictionaryService.findOrg(parent_id1).getOrg_code();
			org_code = orgcode3 + orgcode2 + orgcode1;
		}
		String practice_code;
		String new_practice_code;
		practice_code = grade + org_code + task_type + tea_code1;// 任务编码自动生成完成
		String pra_max_code = this.maxPraCode(practice_code);
		if (pra_max_code == null) {// 本任务的第一条通知
			new_practice_code = practice_code + "001";
		} else {// 不是第一条，取出最多通知编码的后三位，加2
			int maxCode = Integer.parseInt(pra_max_code) + 1;
			if (String.valueOf(maxCode).length() == 1) {// 如果是个位数
				new_practice_code = practice_code + "00" + maxCode;
			} else if (String.valueOf(maxCode).length() == 2) {// 如果是两位位数
				new_practice_code = practice_code + "0" + maxCode;
			} else {// 如果是三位数
				new_practice_code = practice_code + maxCode;
			}
		}
		return new_practice_code;
	}

	// 获取学院某年的签到使用率    用于向临时表中添加数据   ymx    2016/9/1
	
	public Map<String, List<String>> getSinStuSizePro(String grade,
			String org_id, String year, List<String> m) {
		Map<String, List<String>> result = new HashMap<String, List<String>>();
		// 学院人数
		int collegeCount = this.getCollegeStusSize(org_id, grade);
		// 所占比例
		List<String> spro = new ArrayList<String>();
		// 月份集合
		List<String> mouthList = new ArrayList<String>();
		double stuCount;
		double usePro;
		// 某年各月签到情况
		List<Map<String, String>> resultlist = SignService
				.getCollegeSignstuUsePro(grade, year, org_id);
		if (m != null) {
			int rcount = resultlist.size();
			int mcount = m.size();
			int co = 0;
			// 如果查询当前的学院月份和标准学院不相同添加默认为0
			if (mcount != rcount) {
				for (int c = 0; c < mcount; c++) {
					String date = "";
					if (rcount - co > 0) {
						date = String.valueOf(resultlist.get(co).get("YEARMOUTH"));
					}
					String rdate = m.get(c);
					if (date.equals(rdate)) {
						String cout = String.valueOf(resultlist.get(co).get(
								"SIGNNUM"));
						stuCount = Double.parseDouble(cout);
						usePro = (stuCount / collegeCount) * 100;
						spro.add(Common.getDoubetoString(usePro));
						if (co < mcount) {
							co = co + 1;
						}
					} else {
						usePro = 0;
						spro.add(Common.getDoubetoString(usePro));
					}
				}
			} else {
				for (Map<String, String> map : resultlist) {
					String cout = String.valueOf(map.get("SIGNNUM"));
					stuCount = Double.parseDouble(cout);
					usePro = (stuCount / collegeCount) * 100;
					spro.add(Common.getDoubetoString(usePro));
				}
			}
		}
		if (mouthList.size() > 0) {
		} else {
			for (Map<String, String> map : resultlist) {
				String mouth = String.valueOf(map.get("YEARMOUTH"));
				mouthList.add(mouth);
			}
		}
		result.put("spro", spro);
		result.put("mouthList", mouthList);
		return result;
	}

	
	  public List<String> getTeaIdByScope(String org_id) {
		 return practiceTaskDao.getTeaIdByScope(org_id);
	}
	/**
	 * 功能：任务名称查询id 
	 * 日期：2016年4月14日
	 * @param zhr
	 */
	public String getIdByName(String task_name) {
		// TODO Auto-generated method stub
		return this.practiceTaskDao.getIdByName(task_name);
	}

	/**
	 * 每天十二点用于储存临时数据（二级学院签到） 2016年5月31日 杨梦肖
	 */
	public void temporaryAccomplish1() {

		shortTimeService.deleteAll();
		List<Org> orgList = this.orgService.getAllCollege();
		String cout;//
		String date;// 年月
		double stuCount;// 实习人数

		String grade = "2012";
		int grade1 = Integer.parseInt(grade);// 年级
		String year = String.valueOf(grade1 + 2);// 年份
		int year1 = Integer.parseInt(year);
		
		
		for (Org o : orgList) {
			grade1 = Integer.parseInt(grade);
			String grade2 = String.valueOf(grade1);
			year = String.valueOf(grade1 + 2);
			year1 = Integer.parseInt(year);
			String year2 = String.valueOf(year1);
			String org_id = o.getId();// 组织id
			for (int j = 0; j < 3; j++) {
				 grade2 = String.valueOf(grade1);
				year = String.valueOf(grade1 + 2);
				year1 = Integer.parseInt(year);
				 year2 = String.valueOf(year1);
				for (int i = 0; i < 2; i++) {

					 year2 = String.valueOf(year1);

					int collegeCount = this.getCollegeStusSize(org_id, grade2);// 校外实习人数
					//获取不到签到人数和年-月
					List<Map<String, String>> resultlist = this.SignService
							.getCollegeSignstuUsePro(grade2, year2, org_id);
					Map<String, List<String>> result = this.getSinStuSizePro(
							grade2, "dzxxxy", year2, null);
					List<String> m = result.get("mouthList");
					if (m != null) {
						int co=0;
					//	String map2 = null;
						for (String map1 : m) {
							// for(int z=0;z<m.size();z++){
                              //  map2=map1;
							if (resultlist.size()  - co> 0) {
								date = String.valueOf(resultlist.get(co).get(
										"date"));//过不来这

								//if (date.equals(map1)) {
									cout = String.valueOf(resultlist.get(co).get("count"));
									//关键点   获取不到   获取不到    获取不到
								
									if (co < m.size()) {
										co = co + 1;
									}
							//	} else {
									//cout = "0";
							//	}
								
								if (cout.equals(0)) {
									stuCount = 0;
								} else {
									stuCount = Double.parseDouble(cout);
								}
								ShortTime shorttime = new ShortTime();
								shorttime.setAllnum(collegeCount);// 校外实习人数
								shorttime.setGrade(grade2);// 年级
								shorttime.setOrg_id(org_id);// 组织id
								shorttime.setSignnum(stuCount);// 签到的学生人数
								shorttime.setYear(year2);// 年份
								shorttime.setYearmouth(date);// 月份时间段
								shortTimeService.insert(shorttime);
							}
							
						}
						ShortTime shorttime = new ShortTime();
						shorttime.setAllnum(collegeCount);
						shorttime.setGrade(grade2);
						shorttime.setOrg_id(org_id);
						shorttime.setSignnum(0.0);
						shorttime.setYear(year2);
						shorttime.setYearmouth("");
						shortTimeService.insert(shorttime);
						
					}
					year1++;
				}
				grade1++;
			} /**/

		}
		shortTimeService.deleteYearMouth();
	}
	/**
	 * 功能：任务名称查询id 
	 * 日期：2016年4月14日
	 * @param ymx    2016/9/1     整理代码不要删啊。。。。。。
	 * 用于数据请求    从临时表中添加数据
	 */
	
	public Map<String, List<String>> getSinStuSizePro1(String grade,
			String org_id, String year, List<String> m) {
		Map<String, List<String>> result = new HashMap<String, List<String>>();
		// 学院人数
		int collegeCount = this.getCollegeStusSize(org_id, grade);
		// 所占比例
		List<String> spro = new ArrayList<String>();
		// 月份集合
		List<String> mouthList = new ArrayList<String>();
		double stuCount;
		double usePro;
		// 某年各月签到情况
		List<Map<String, String>> resultlist = shortTimeService
				.getCollegeSignstuUsePro(grade, year, org_id);
		if (m != null) {
			int rcount = resultlist.size();
			int mcount = m.size();
			int co = 0;
			// 如果查询当前的学院月份和标准学院不相同添加默认为0
			if (mcount != rcount) {
				for (int c = 0; c < mcount; c++) {
					String date = "";
					if (rcount - co > 0) {
						date = String.valueOf(resultlist.get(co).get("YEARMOUTH"));
					}
					String rdate = m.get(c);
					if (date.equals(rdate)) {
						String cout = String.valueOf(resultlist.get(co).get(
								"SIGNNUM"));
						stuCount = Double.parseDouble(cout);
						usePro = (stuCount / collegeCount) * 100;
						spro.add(Common.getDoubetoString(usePro));
						if (co < mcount) {
							co = co + 1;
						}
					} else {
						usePro = 0;
						spro.add(Common.getDoubetoString(usePro));
					}
				}
			} else {
				for (Map<String, String> map : resultlist) {
					String cout = String.valueOf(map.get("SIGNNUM"));
					stuCount = Double.parseDouble(cout);
					usePro = (stuCount / collegeCount) * 100;
					spro.add(Common.getDoubetoString(usePro));
				}
			}
		}
		if (mouthList.size() > 0) {
		} else {
			for (Map<String, String> map : resultlist) {
				String mouth = String.valueOf(map.get("YEARMOUTH"));
				mouthList.add(mouth);
			}
		}
		result.put("spro", spro);
		result.put("mouthList", mouthList);
		return result;
	}

}