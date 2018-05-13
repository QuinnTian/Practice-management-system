package com.sict.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.ScoreDao;
import com.sict.entity.Org;
import com.sict.entity.Param;
import com.sict.entity.PracticeTask;
import com.sict.entity.Score;
import com.sict.entity.Student;
import com.sict.entity.Teacher;
import com.sict.entity.TemporaryComplish;
import com.sict.util.Common;
import com.sict.util.CommonUtil;
import com.sict.util.Constants;
import com.sict.util.HttpRequest;

@Repository(value = "ScoreService")
@Transactional
public class ScoreService implements BasicService {
	@Resource
	OrgService OrgService;
	@Resource
	GroupsService GroupsService;
	@Resource
	GroupMembersService GroupMembersService;
	@Resource
	SignService SignService;
	@Resource
	TeacherService teacherService;
	@Resource
	PracticeTaskService practiceTaskService;
	@Resource(name = "summaryQuestionnaireService")
	private SummaryQuestionnaireService summaryQuestionnaireService;
	@Autowired
	ScoreDao ScoreDao;
	@Resource
	ParamService paramService;
	@Resource
	StudentService studentService;

	public List selectList(Object o) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object insert(Score o) {
		// TODO Auto-generated method stub
		Score Score = (Score) o;
		Score.setId(Common.returnUUID());
		return ScoreDao.insert(Score);
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

	public Object insert(Object o) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 
	 * @param practice_id
	 * @param weight_month
	 * @param weight_thesis
	 * @param weight_evaluate
	 * @return
	 * @author 吕付豹
	 */
	public List<Map<String, Object>> ScoreList(String practice_id,
			String weight_month, String weight_thesis, String weight_evaluate) {
		// TODO Auto-generated method stub
		return ScoreDao.ScoreList(practice_id, weight_month, weight_thesis,
				weight_evaluate);
	}

	/**
	 * 
	 * @param
	 * @return
	 * @author 吕付豹
	 */
	public Object insertMap(Map m) {
		{
			// TODO Auto-generated method stub
			return ScoreDao.insertMap(m);
		}
	}

	/**
	 * 获取该实践任务下该学生的的奖惩开始时间 2015-01-27 邢志武
	 * 
	 * @param pract_id
	 * @param stu_id
	 * @return
	 */
	public String getStartThesisTime(String pract_id, String stu_id) {
		return ScoreDao.getStartThesisTime(pract_id, stu_id);
	}

	/**
	 * 获取该实践任务下该学生的的月总结分数 2015-01-27 邢志武 二次修改 周睿20160603
	 * 三次修改：方法优化，添加了学年与学期以取得相应的实习任务的起始时间 张文琪 20160903
	 * 新增容错：如果没有取到数据，则返回-1 张文琪 20160907
	 * @param pract_id
	 * @param stu_id
	 * @return
	 */
	public double getMothScore(String pract_id, String stu_id, String stuyear,
			String term) {
		Student s = studentService.selectByID(stu_id);
		Org org = DictionaryService.findOrg(s.getClass_id()); // 通过班级ID得到班级
		String org_code = org.getOrg_code();
		Param paramset = new Param();
		String year = "";
		Param paramget; // 用来存储取出的Paramget对象
		paramset.setDept_id(org_code);
		paramset.setYear(stuyear);
		paramset.setTerm(term);
		paramset.setParam_name("开始月份");
		paramget = paramService
				.selectParambyIdAndParam_nameAndYearAndTerm(paramset);
		System.out.println("是否通过班级取出：" + paramget);
		if (paramget == null) {
			String department = org.getParent_id();// 得到系ID
			String xiorg_code = DictionaryService.findOrg(department)
					.getOrg_code(); // 通过系ID取出系，然后得到系组织编码
			paramset = new Param();
			paramset.setDept_id(xiorg_code);
			paramset.setYear(stuyear);
			paramset.setTerm(term);
			paramset.setParam_name("开始月份");
			paramget = paramService
					.selectParambyIdAndParam_nameAndYearAndTerm(paramset);
			System.out.println("是否通过系别取出：" + paramget);
			if (paramget == null) {
				Org dept = OrgService.selectByID(department);
				paramset = new Param();
				String dpt = dept.getParent_id();
				paramset.setDept_id(dpt);
				paramset.setYear(stuyear);
				paramset.setTerm(term);
				paramset.setParam_name("开始月份");
				paramget = paramService
						.selectParambyIdAndParam_nameAndYearAndTerm(paramset);
				System.out.println("是否通过学院取出：" + paramget);
			}
			// 怎么着也获取不到数据返回-1 张文琪 20160907
			if (paramget == null) {
				return -1;
			}
			year = paramget.getParam_value();
		}

		return ScoreDao.getMothScore(pract_id, stu_id, year);
	}

	/**
	 * 该方法暂时不用 张文琪 2016年9月6日 获取该实践任务下该学生的月总结的完成度 邢志武 2015年7月19日 09:52:31
	 * 由于对getMothScore方法的优化，两个参数的getMothScore暂时不用
	 * 
	 * @param pract_id
	 * @param stu_id
	 * @return
	 */
	public double getMothScoreAccomplish(String pract_id, String stu_id) {
		// double sumMothScore = this.getMothScore(pract_id, stu_id);
		double sumMothScore = 0;
		int mouth1 = Calendar.getInstance().get(Calendar.MONTH) + 1;
		int c = 0;
		double mScore;
		mScore = 0;
		// 常量设置实习开始的月份，月总结分为平均分
		int mouth2 = Integer.parseInt(Constants.PRACTICT_START_MORTH);
		if (mouth1 >= mouth2) {
			c = mouth1 - mouth2 + 1;
		} else {
			c = (12 - mouth2) + mouth1 + 1;
		}
		mScore = sumMothScore / c;
		double mothScoreAccomplish = 0;
		if (mScore > 5) {
			mothScoreAccomplish = mScore / 100;
		} else {
			mothScoreAccomplish = mScore / 5;
		}

		return mothScoreAccomplish;
	}

	/**
	 * 获取该实践任务下该学生的的论文分数 2015-01-27 邢志武
	 * 
	 * @param pract_id
	 * @param stu_id
	 * @return
	 */
	public double getThesisScore(String pract_id, String stu_id) {
		return ScoreDao.getThesisScore(pract_id, stu_id);
	}

	/**
	 * 获取该实践任务下该学生的的论文的完成度 邢志武 2015年7月19日 09:48:06
	 * 
	 * @param pract_id
	 * @param stu_id
	 * @return
	 */
	public double getThesisScoreAccomplish(String pract_id, String stu_id) {
		double thesisScore = ScoreDao.getThesisScore(pract_id, stu_id);
		double thesisScoreAccomplish = 0;
		if (thesisScore > 5) {
			thesisScoreAccomplish = thesisScore / 100;
		} else {
			thesisScoreAccomplish = thesisScore / 5;
		}
		return thesisScoreAccomplish;
	}

	/**
	 * 获取该实践任务下该学生的的奖惩分数 2015-01-27 邢志武
	 * 
	 * @param pract_id
	 * @param stu_id
	 * @return
	 */
	public double getEvaScore(String pract_id, String stu_id) {
		return ScoreDao.getEvaScore(pract_id, stu_id);
	}

	/**
	 * 获取一个同学的分数
	 * 
	 * @param String
	 *            pract_id, String stu_id 2015-01-28 邢志武
	 * @return Score
	 * 
	 *         添加上半年或下半年的筛选 2016-09-05 张文琪 月总结成绩算法优化，把当前月与开始月的月数差并与结束月与开始月的月数差比较
	 *         根据月查不同月总结成绩不同 2016-09-06 张文琪
	 *         方法新增了两个参数（学年与学期）对获取系统参数方法进行了升级
	 * @throws ParseException
	 */
	public Score getStuScore(String pract_id, String stu_id, String stuyear,
			String term) throws ParseException {
		Score stuScore = new Score();
		double thesis = this.getThesisScore(pract_id, stu_id);
		double eva = this.getEvaScore(pract_id, stu_id);

		double sumMothScore = this
				.getMothScore(pract_id, stu_id, stuyear, term);
		// 现在的月份
		int mouth1 = Calendar.getInstance().get(Calendar.MONTH) + 1;
		// 与开始月份的差距
		int c = 0;
		double mScore;
		mScore = 0;
		String class_id = DictionaryService.findStudent(stu_id).getClass_id();// 班级ID
		List<Org> olist = OrgService.selectCollegeByclassId(class_id);
		String dpt = olist.get(0).getId();// 学院ID
		// 获取结束时间与开始时间的月份差
		c = summaryQuestionnaireService.getSummaryCount(dpt, class_id, stuyear,
				term);
		System.out.println("结束月份与开始月份的差：" + c);
		int mouth_num = 0;

		// 获取任务开始时间 张文琪 20160907
		Student s = studentService.selectByID(stu_id);
		Org org = DictionaryService.findOrg(s.getClass_id()); // 通过班级ID得到班级
		String org_code = org.getOrg_code();
		Param paramset = new Param();
		Param paramget; // 用来存储取出的Paramget对象
		paramset.setDept_id(org_code);
		paramset.setYear(stuyear);
		paramset.setTerm(term);
		paramset.setParam_name("开始月份");
		paramget = paramService
				.selectParambyIdAndParam_nameAndYearAndTerm(paramset);
		System.out.println("是否通过班级取出：" + paramget);
		if (paramget == null) {
			String department = org.getParent_id();// 得到系ID
			String xiorg_code = DictionaryService.findOrg(department)
					.getOrg_code(); // 通过系ID取出系，然后得到系组织编码
			paramset = new Param();
			paramset.setDept_id(xiorg_code);
			paramset.setYear(stuyear);
			paramset.setTerm(term);
			paramset.setParam_name("开始月份");
			paramget = paramService
					.selectParambyIdAndParam_nameAndYearAndTerm(paramset);
			System.out.println("是否通过系别取出：" + paramget);
			if (paramget == null) {
				Org dept = OrgService.selectByID(department);
				paramset = new Param();
				String dpt_ = dept.getParent_id();
				paramset.setDept_id(dpt_);
				paramset.setYear(stuyear);
				paramset.setTerm(term);
				paramset.setParam_name("开始月份");
				paramget = paramService
						.selectParambyIdAndParam_nameAndYearAndTerm(paramset);
				System.out.println("是否通过学院取出：" + paramget);
			}

		}

		String begin_time;
		// 求当前的年和月
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
		String now_time = format.format(new Date());
		// 如果paramget不为空，则从数据库中获取到相应数据
		if (paramget != null) {
			begin_time = paramget.getParam_value();
			mouth_num = CommonUtil.countMonths(begin_time, now_time, "yyyy-MM");
		} else {
			//paramget等于空，表示没有获取到数据
			mouth_num = -1;
		}

		// 判断当前时间是否超过结束时间
		if (mouth_num < c && mouth_num != (-1)) {
			c = mouth_num;
			mScore = sumMothScore / c;
		}
		if (mouth_num > c) {
			mScore = sumMothScore / c;
		}
		if (mouth_num == (-1)) {
			//没有获取到数据，设置mScore标量，在控制层进行判断
			mScore = -1;
		}

		System.out.println("月总结==" + sumMothScore + "/" + c);
		double mouth = DictionaryService.findPracticeTask(pract_id)
				.getWeight_summary();
		double thesi = DictionaryService.findPracticeTask(pract_id)
				.getWeight_thesis();
		double evaluate = DictionaryService.findPracticeTask(pract_id)
				.getWeight_evaluate();
		double score = mScore * mouth + thesis * thesi + eva * evaluate;
		stuScore.setScore(score);
		// 如果mScore小于零，则证明数据库中没有该数据,并设置标量
		if (mScore < 0) {
			stuScore.setMouthScore(-1);
		} else {
			stuScore.setMouthScore(mScore);
		}
		// 月份差如果为-1，说明数据不存在或不正确,并设置标量
		if (c == (-1)) {
			stuScore.setMouthScore(-1);
		} else {
			stuScore.setMouthScore(mScore);
		}

		stuScore.setTheScore(thesis);
		stuScore.setEvaScore(eva);
		stuScore.setStu_id(stu_id);

		return stuScore;
	}

	/**
	 * 
	 * @param pract_id
	 * @param org_id
	 * @param grade
	 * @return 查询某系学生校外实习的实习成绩 2015年4月20日 邢志武
	 * @throws ParseException
	 *             该方法暂时不能使用，getStuScore方法后两个null参数（学年和学期）暂时没有获取 张文琪 20160907
	 */
	public List<Double> getDepartmentStuScores(String org_id, String grade)
			throws ParseException {
		// 查询系校外实习任务id 参数（系id,年级 )
		List<String> prac_id = this.practiceTaskService
				.getPracTaskIdByOrgIdAndGrade(grade, org_id);
		List<Double> departmentStuScores = new ArrayList<Double>();
		for (int i = 0; i < prac_id.size(); i++) {
			// 根据实践任务id获取小组id
			String practick_id = prac_id.get(i);
			// 根据实践任务查询该实践任务下的小组id
			List<String> group_id = GroupsService.getGroupId(practick_id);
			for (int j = 0; j < group_id.size(); j++) {
				// 根据小组id获取每位成员的成绩
				String groupId = group_id.get(j);
				List<String> groupMemberId = this.GroupMembersService
						.selectGroupMembersIdByGroupId(groupId);
				for (int k = 0; k < groupMemberId.size(); k++) {
					// 获取小组成员id
					String groupMemberStuId = groupMemberId.get(k);
					// 根据学生id,获取该学生的实习成绩总分
					Score score = this.getStuScore(practick_id,
							groupMemberStuId, null, null);
					double oneStutotalScore = score.getScore();
					// 存放成员成绩
					departmentStuScores.add(oneStutotalScore);
				}
			}
		}
		return departmentStuScores;
	}

	/**
	 * @param org_id
	 * @param grade
	 * @return 计算某系校外实习成绩优秀率 2015年4月20日 邢志武
	 * @throws ParseException
	 */
	public Map<String, Double> getDepartmentStuScoreProportion(String org_id,
			String grade) throws ParseException {
		// 查询某系学生校外实习的实习成绩
		List<Double> departmentStuScores = this.getDepartmentStuScores(org_id,
				grade);
		// 声明map,存放成绩优秀率
		Map<String, Double> departmentStuScoreProportion = new HashMap<String, Double>();
		// 及格人数/不及格人数/良好人数/优秀人数
		int pass = 0, notPass = 0, well = 0, excellent = 0;
		// 统计各成绩段人数
		for (int i = 0; i < departmentStuScores.size(); i++) {
			double score = departmentStuScores.get(i);
			if (score < 60) {
				notPass = notPass + 1;
			} else if (score > 60 && score < 80) {
				pass = pass + 1;

			} else if (score > 80 && score < 95) {
				well = well + 1;

			} else {
				excellent = excellent + 1;
			}
		}
		// 获取某系校外实习的总人数
		int departmentStusSize = this.practiceTaskService
				.getDepartmentStusSize(org_id, grade);
		if (departmentStusSize != 0) {
			// 计算比例
			double notPassProportion = notPass / departmentStusSize;
			double passProportion = pass / departmentStusSize;
			double wellProportion = well / departmentStusSize;
			double excellentProportion = excellent / departmentStusSize;
			// 存放比例
			departmentStuScoreProportion.put("notPassProportion",
					notPassProportion);
			departmentStuScoreProportion.put("passProportion", passProportion);
			departmentStuScoreProportion.put("wellProportion", wellProportion);
			departmentStuScoreProportion.put("excellentProportion",
					excellentProportion);
		} else {
			departmentStuScoreProportion.put("notPassProportion", 0.0);
			departmentStuScoreProportion.put("passProportion", 0.0);
			departmentStuScoreProportion.put("wellProportion", 0.0);
			departmentStuScoreProportion.put("excellentProportion", 0.0);
		}

		return departmentStuScoreProportion;

	}

	/**
	 * 
	 * @param college_id
	 * @param grade
	 * @return 计算某学院校外实习成绩优秀率 2015年4月20日
	 * @throws ParseException
	 */
	public Map<String, Double> getCollegeStusSizeStuScoreProportion(
			String college_id, String grade) throws ParseException {
		// 获取系及学院自身
		List<Org> departments = OrgService.getOrgDeptByCollegeId(college_id);
		Map<String, Double> collegeStuScoreProportion = new HashMap<String, Double>();
		double notPassProportion = 0, passProportion = 0, wellProportion = 0, excellentProportion = 0;
		for (int i = 0; i < departments.size(); i++) {
			String org_id = departments.get(i).getId();
			Map<String, Double> departmentStuScoreProportion = this
					.getDepartmentStuScoreProportion(org_id, grade);
			double notPassPro = departmentStuScoreProportion
					.get("notPassProportion");
			double passPro = departmentStuScoreProportion.get("passProportion");
			double wellPro = departmentStuScoreProportion.get("wellProportion");
			double excellentPro = departmentStuScoreProportion
					.get("excellentProportion");

			notPassProportion = notPassPro + notPassProportion;
			passProportion = passPro + passProportion;
			wellProportion = wellPro + wellProportion;
			excellentProportion = excellentPro + excellentProportion;
		}
		notPassProportion = notPassProportion / departments.size();
		passProportion = passProportion / departments.size();
		wellProportion = wellProportion / departments.size();
		excellentProportion = excellentProportion / departments.size();

		collegeStuScoreProportion.put("notPassProportion", notPassProportion);
		collegeStuScoreProportion.put("passProportion", passProportion);
		collegeStuScoreProportion.put("wellProportion", wellProportion);
		collegeStuScoreProportion.put("excellentProportion",
				excellentProportion);

		return collegeStuScoreProportion;

	}

	/**
	 * 2015年7月19日 10:26:47 邢志武
	 * 
	 * @param tea_id
	 * @param year
	 * @return 查看一个教师所带组的任务完成率（效率低）
	 */
	public Map<String, Double> getTeacherTaskAccomplish(String tea_id,
			String year) {
		// 声明map,存放小组成员的完成率
		Map<String, Double> teacherTaskAccomplish = new HashMap<String, Double>();
		List<PracticeTask> practiceTask = this.practiceTaskService
				.getOutPracticeTasksBytea_id(tea_id, year);
		if (practiceTask.size() > 0) {
			String pra_id = practiceTask.get(0).getId();
			List<String> groupMembersId = this.practiceTaskService
					.selectStusId(pra_id);
			// 月总结完成度/论文完成度
			double mothScoreAccomplish = 0, thesisScoreAccomplish = 0;
			int allStuCount = groupMembersId.size();
			// 汇总各个学生的完成度
			for (int i = 0; i < allStuCount; i++) {
				String stu_id = groupMembersId.get(i);
				double mothscoreacc = this.getMothScoreAccomplish(pra_id,
						stu_id);
				double thesiscoreacc = this.getThesisScoreAccomplish(pra_id,
						stu_id);
				mothScoreAccomplish = mothscoreacc + mothScoreAccomplish;
				thesisScoreAccomplish = thesisScoreAccomplish + thesiscoreacc;
			}
			mothScoreAccomplish = mothScoreAccomplish / allStuCount;
			thesisScoreAccomplish = thesisScoreAccomplish / allStuCount;
			teacherTaskAccomplish.put("mothScoreAccomplish",
					mothScoreAccomplish);
			teacherTaskAccomplish.put("thesisScoreAccomplish",
					thesisScoreAccomplish);
			return teacherTaskAccomplish;
		} else {
			teacherTaskAccomplish.put("mothScoreAccomplish", (double) 0);
			teacherTaskAccomplish.put("thesisScoreAccomplish", (double) 0);
			return teacherTaskAccomplish;
		}
	}

	/**
	 * 2015年7月19日 10:26:47 邢志武
	 * 
	 * @param tea_id
	 * @param year
	 * @return 查看一个教师所带组的任务完成率（临时表）
	 */
	public Map<String, Double> getTeacherTaskAccomplish2(String tea_id,
			String year) {
		// 声明map,存放小组成员的完成率
		Map<String, Double> teacherTaskAccomplish = new HashMap<String, Double>();

		List<TemporaryComplish> temlist = getTeacherComplish(tea_id);
		if (temlist.size() > 0) {
			TemporaryComplish tem = temlist.get(0);
			double mothScoreAccomplish = tem.getMothscoreaccomplish();
			double thesisScoreAccomplish = tem.getThesisscoreaccomplish();
			teacherTaskAccomplish.put("mothScoreAccomplish",
					mothScoreAccomplish);
			teacherTaskAccomplish.put("thesisScoreAccomplish",
					thesisScoreAccomplish);
		} else {
			double mothScoreAccomplish = 0.0;
			double thesisScoreAccomplish = 0.0;
			teacherTaskAccomplish.put("mothScoreAccomplish",
					mothScoreAccomplish);
			teacherTaskAccomplish.put("thesisScoreAccomplish",
					thesisScoreAccomplish);
		}
		return teacherTaskAccomplish;

	}

	/**
	 * 该方法暂时不用 张文琪 2016年9月6日
	 * 
	 * @param org_id
	 * @param grade
	 * @return 查看一个系的任务完成率 2015年7月19日 10:44:42 邢志武
	 */
	public Map<String, Double> getDepartementTaskAccomplish(String org_id,
			String grade) {
		Map<String, Double> departementTaskAccomplish = new HashMap<String, Double>();
		// 获取某系的老师
		List<String> teacherlist = this.practiceTaskService
				.selectTeaIdbyDempartId(org_id, grade);
		int allTeaCount = teacherlist.size();
		// 月总结完成度/论文完成度
		double mothScoreAccomplish = 0, thesisScoreAccomplish = 0;
		for (int i = 0; i < allTeaCount; i++) {
			String tea_id = teacherlist.get(i);
			Map<String, Double> teacherTaskAccomplish = this
					.getTeacherTaskAccomplish2(tea_id, grade);
			double mothscoreacc = teacherTaskAccomplish
					.get("mothScoreAccomplish");
			double thesiscoreacc = teacherTaskAccomplish
					.get("thesisScoreAccomplish");
			mothScoreAccomplish = mothscoreacc + mothScoreAccomplish;
			thesisScoreAccomplish = thesisScoreAccomplish + thesiscoreacc;
		}
		mothScoreAccomplish = mothScoreAccomplish / allTeaCount;
		thesisScoreAccomplish = thesisScoreAccomplish / allTeaCount;

		departementTaskAccomplish.put("mothScoreAccomplish",
				mothScoreAccomplish);
		departementTaskAccomplish.put("thesisScoreAccomplish",
				thesisScoreAccomplish);
		return departementTaskAccomplish;

	}

	/**
	 * 
	 * @param college_id
	 * @param grade
	 * @return 查看一个学院的任务完成率 2015年7月19日 10:44:42 邢志武
	 */
	public Map<String, Double> getCollegeTaskAccomplish(String college_id,
			String grade) {
		// 获取系及学院自身
		List<Org> departments = OrgService.getAllDeptByParentId(college_id);
		Map<String, Double> collegeTaskAccomplish = new HashMap<String, Double>();
		int allDeptCount = departments.size();
		// 月总结完成度/论文完成度
		double mothScoreAccomplish = 0, thesisScoreAccomplish = 0;

		for (int i = 0; i < allDeptCount; i++) {
			String dept_id = departments.get(i).getId();
			Map<String, Double> deptTaskAccomplish = this
					.getDepartementTaskAccomplish(dept_id, grade);
			double mothscoreacc = deptTaskAccomplish.get("mothScoreAccomplish");
			double thesiscoreacc = deptTaskAccomplish
					.get("thesisScoreAccomplish");
			mothScoreAccomplish = mothscoreacc + mothScoreAccomplish;
			thesisScoreAccomplish = thesisScoreAccomplish + thesiscoreacc;
		}
		mothScoreAccomplish = (mothScoreAccomplish / allDeptCount);
		thesisScoreAccomplish = (thesisScoreAccomplish / allDeptCount);
		collegeTaskAccomplish.put("mothScoreAccomplish", mothScoreAccomplish);
		collegeTaskAccomplish.put("thesisScoreAccomplish",
				thesisScoreAccomplish);
		return collegeTaskAccomplish;

	}

	/**
	 * 删除所有数据 2015年8月9日 12:04:18
	 * 
	 * @author WuGee
	 */
	public void deleteAll() {
		this.ScoreDao.deleteAll();
	}

	public void insertTeaComplish(TemporaryComplish tem) {
		this.ScoreDao.insertTeaComplish(tem);
	}

	public List<TemporaryComplish> getTeacherComplish(String tea_id) {
		return this.ScoreDao.getTeacherComplish(tea_id);
	}

	/**
	 * 每天一点用于储存临时数据（任务完成度） 2015年8月9日 11:26:37 邢志武
	 */
	public void temporaryAccomplish() {
		// 默认年份
		String grade = Common.getDefaultYear();
		Org org = new Org();
		org.setOrg_level("2");
		// 删除原有数据，插入新的数据
		this.deleteAll();
		// 查询所有学院
		List<Org> orgList = OrgService.selectList(org);
		for (int i = 0; i < orgList.size(); i++) {
			String org_id = orgList.get(i).getId();
			// 查询某个学院和该学院所有系
			List<Org> orgList2 = OrgService
					.getCollegeAndAllDeptByCollegeID(org_id);
			for (int j = 0; j < orgList2.size(); j++) {
				String org_id2 = orgList2.get(j).getId();
				// 查询某个系下所有的老师
				List<Teacher> teacherlist = teacherService
						.getTeachersByDeptId(org_id2);
				// 循环插入数据
				for (int k = 0; k < teacherlist.size(); k++) {
					String tea_id = teacherlist.get(k).getId();
					Map<String, Double> teacherTaskAccomplish = this
							.getTeacherTaskAccomplish(tea_id, grade);
					double mothscoreacc = teacherTaskAccomplish
							.get("mothScoreAccomplish");
					double thesiscoreacc = teacherTaskAccomplish
							.get("thesisScoreAccomplish");
					// 插入新的数据
					TemporaryComplish temCom = new TemporaryComplish();
					temCom.setId(Common.returnUUID());
					temCom.setTea_id(tea_id);
					temCom.setMothscoreaccomplish(mothscoreacc);
					temCom.setThesisscoreaccomplish(thesiscoreacc);
					this.insertTeaComplish(temCom);
				}
			}
		}
	}

	/**
	 * 每天十二点用于储存临时数据（二级学院签到） 2016年5月31日 杨梦肖
	 */
	public void temporaryAccomplish1() {
		// 默认年份
		String grade = Common.getDefaultYear();
		Org org = new Org();
		org.setOrg_level("2");
		// 删除原有数据，插入新的数据
		this.deleteAll();
		// 查询所有学院
		List<Org> orgList = OrgService.selectList(org);
		for (int i = 0; i < orgList.size(); i++) {
			String org_id = orgList.get(i).getId();
			// 查询某个学院和该学院所有系
			List<Org> orgList2 = OrgService
					.getCollegeAndAllDeptByCollegeID(org_id);
			for (int j = 0; j < orgList2.size(); j++) {
				String org_id2 = orgList2.get(j).getId();
				// 查询某个系下所有的老师
				List<Teacher> teacherlist = teacherService
						.getTeachersByDeptId(org_id2);
				// 循环插入数据
				for (int k = 0; k < teacherlist.size(); k++) {
					String tea_id = teacherlist.get(k).getId();
					Map<String, Double> teacherTaskAccomplish = this
							.getTeacherTaskAccomplish(tea_id, grade);
					double mothscoreacc = teacherTaskAccomplish
							.get("mothScoreAccomplish");
					double thesiscoreacc = teacherTaskAccomplish
							.get("thesisScoreAccomplish");
					// 插入新的数据
					TemporaryComplish temCom = new TemporaryComplish();
					temCom.setId(Common.returnUUID());
					temCom.setTea_id(tea_id);
					temCom.setMothscoreaccomplish(mothscoreacc);
					temCom.setThesisscoreaccomplish(thesiscoreacc);
					this.insertTeaComplish(temCom);
				}
			}
		}
	}

}