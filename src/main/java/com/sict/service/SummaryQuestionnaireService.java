package com.sict.service;

import java.text.ParseException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.SummaryQuestionnaireDao;
import com.sict.entity.Org;
import com.sict.entity.Param;
import com.sict.entity.SummaryOption;
import com.sict.entity.SummaryQuestion;
import com.sict.entity.SummaryQuestionnaire;
import com.sict.util.Common;
import com.sict.util.CommonUtil;

@Repository(value = "summaryQuestionnaireService")
@Transactional
public class SummaryQuestionnaireService implements
		BasicService<SummaryQuestionnaire> {
	@Autowired
	private SummaryQuestionnaireDao summaryQuestionnaireDao;

	@Resource(name = "summaryQnAnswerService")
	private SummaryQnAnswerService summaryQnAnswerService;
	@Resource(name = "summaryQuestionService")
	private SummaryQuestionService summaryQuestionService;
	@Resource(name = "summaryOptionService")
	private SummaryOptionService summaryOptionService;
	@Resource(name = "paramService")
	private ParamService paramService;

	public List<SummaryQuestionnaire> selectList(SummaryQuestionnaire t) {

		List<SummaryQuestionnaire> questionnaires = summaryQuestionnaireDao
				.selectList(t);
		for (SummaryQuestionnaire summaryQuestionnaire : questionnaires) {
			summaryQuestionnaire.setQuestionNum(summaryQuestionService
					.selectCountBySummaryID(summaryQuestionnaire.getId()));
		}
		return questionnaires;

	}

	public SummaryQuestionnaire insert(SummaryQuestionnaire t) {

		t.setId(Common.returnUUID());
		t.setState("0");
		t.setCreateDate(Common.getNowTime());
		int num = summaryQuestionnaireDao.insert(t);
		if (num > 0) {
			return t;
		} else {
			return null;
		}
	}

	public SummaryQuestionnaire insertManualID(SummaryQuestionnaire t) {

		t.setState("0");
		t.setCreateDate(Common.getNowTime());
		int num = summaryQuestionnaireDao.insert(t);
		if (num > 0) {
			return t;
		} else {
			return null;
		}
	}

	public int update(SummaryQuestionnaire t) {
		// TODO Auto-generated method stub
		return summaryQuestionnaireDao.update(t);
	}

	public int delete(SummaryQuestionnaire t) {
		if (t == null) {
			return 0;
		} else {
			return summaryQuestionnaireDao.delete(t);
		}
	}

	public int deleteByID(String id) {

		SummaryQuestionnaire sq = new SummaryQuestionnaire();
		sq.setId(id);
		summaryQuestionService.deleteByQuestionnaireID(id);
		return delete(sq);

	}

	public int closeByID(String id) {

		SummaryQuestionnaire sq = new SummaryQuestionnaire();
		sq.setId(id);
		sq.setState("0");
		return summaryQuestionnaireDao.update(sq);

	}

	public SummaryQuestionnaire selectByID(String id) {
		// TODO Auto-generated method stub
		if (id == null || "".equals(id)) {
			return null;
		} else {
			SummaryQuestionnaire summaryQuestionnaire = summaryQuestionnaireDao
					.selectByID(id);
			summaryQuestionnaire.setQuestionNum(summaryQuestionService
					.selectCountBySummaryID(id));
			return summaryQuestionnaire;
		}
	}

	/**
	 * 根据问题ID获取总结，和一个问题
	 * 
	 * @param questionID
	 * @return
	 */
	public SummaryQuestionnaire selectSummaryAndQuestionByQuestionID(
			String questionID) {
		// TODO Auto-generated method stub
		if (questionID == null || "".equals(questionID)) {
			return null;
		} else {
			SummaryQuestion summaryQuestion = summaryQuestionService
					.selectByID(questionID);
			SummaryQuestionnaire summaryQuestionnaire = summaryQuestionnaireDao
					.selectByID(summaryQuestion.getQuestionnaire_id());
			summaryQuestionnaire.setSummaryQuestion(summaryQuestion);
			return summaryQuestionnaire;
		}
	}

	public List<SummaryQuestionnaire> selectByUserID(String user_id) {
		// TODO Auto-generated method stub
		SummaryQuestionnaire sq = new SummaryQuestionnaire();
		sq.setUser_id(user_id);
		return this.selectList(sq);
	}

	public SummaryQuestionnaire insertOrUpdate(SummaryQuestionnaire t) {
		// TODO Auto-generated method stub
		if (t == null || "".equals(t.getId())) {
			return insert(t);
		} else {
			if (update(t) > 0) {
				return t;
			} else {
				return null;
			}
		}
	}

	public int selectCount(SummaryQuestionnaire t) {
		// TODO Auto-generated method stub
		return summaryQuestionnaireDao.selectCount(t);
	}

	public int selectCountByID(String id) {
		// TODO Auto-generated method stub
		SummaryQuestionnaire sq = new SummaryQuestionnaire();
		sq.setId(id);
		return summaryQuestionnaireDao.selectCount(sq);
	}

	public SummaryQuestionnaire getSummaryQuestionnaireAndQuestions(
			String summaryID) {

		SummaryQuestionnaire summaryQuestionnaire = selectByID(summaryID);
		summaryQuestionnaire.setSummaryQuestions(summaryQuestionService
				.selectBySummaryQuestionnaireID(summaryID));
		return summaryQuestionnaire;
	}

	/**
	 * 获取总结的所有问题和问题选项
	 * 
	 * @param summaryID
	 * @return
	 */
	public SummaryQuestionnaire getSummaryQuestionnaireAndQuestionAndOptionBySummaryID(
			String summaryID) {

		SummaryQuestionnaire summaryQuestionnaire = getSummaryQuestionnaireAndQuestions(summaryID);
		List<SummaryQuestion> summaryQuestions = summaryQuestionnaire
				.getSummaryQuestions();

		for (SummaryQuestion summaryQuestion : summaryQuestions) {
			List<SummaryOption> summaryOptions = summaryOptionService
					.selectByQuestionID(summaryQuestion.getId());
			summaryQuestion.setSummaryOptions(summaryOptions);

		}
		return summaryQuestionnaire;
	}

	/**
	 * 获取总结的所有问题和问题选项
	 * 
	 * @param summaryID
	 * @return
	 */
	public SummaryQuestionnaire getSummaryQuestionnaireAndQuestionAndOptionBySummaryIDAndStuState(
			String summaryID, String state) {
		String questionState = Common.getQuestionState(state);// 根据学生的状态得到应该做的对应的题目
		SummaryQuestionnaire summaryQuestionnaire = getSummaryQuestionnaireAndQuestionsBySummaryId(
				summaryID, questionState);

		List<SummaryQuestion> summaryQuestions = summaryQuestionnaire
				.getSummaryQuestions();
		/*
		 * List<SummaryQuestion> summaryQuestions
		 * =summaryQuestionService.selectBySummaryQuestionnaireIDAndTypeStudent
		 * (SummaryQuestionnaireID, type_student)
		 */

		for (SummaryQuestion summaryQuestion : summaryQuestions) {
			List<SummaryOption> summaryOptions = summaryOptionService
					.selectByQuestionID(summaryQuestion.getId());
			summaryQuestion.setSummaryOptions(summaryOptions);

		}
		return summaryQuestionnaire;
	}

	public SummaryQuestionnaire getSummaryQuestionnaireAndQuestionsBySummaryId(
			String summaryID, String type_student) {

		SummaryQuestionnaire summaryQuestionnaire = selectByID(summaryID);
		List<SummaryQuestion> summaryQuestionList = summaryQuestionService
				.selectBySummaryQuestionnaireIDAndStuType(summaryID,
						type_student);
		summaryQuestionnaire.setQuestionNum(summaryQuestionList.size());
		summaryQuestionnaire.setSummaryQuestions(summaryQuestionList);
		return summaryQuestionnaire;
	}

	public List<SummaryQuestionnaire> selectListAndAddCommitNum(
			SummaryQuestionnaire t, String practiceId) {

		List<SummaryQuestionnaire> questionnaires = summaryQuestionnaireDao
				.selectList(t);
		for (SummaryQuestionnaire summaryQuestionnaire : questionnaires) {
			summaryQuestionnaire.setCommitNum(summaryQnAnswerService
					.selectCommitCountBySummaryID(summaryQuestionnaire.getId(),
							practiceId));
			/*
			 * summaryQuestionnaire.setQuestionNum(summaryQuestionService.
			 * selectCountBySummaryID(summaryQuestionnaire.getId()));
			 */
		}
		// 过滤状态为无效的记录
		for (SummaryQuestionnaire summaryQuestionnaire : questionnaires) {
			if (summaryQuestionnaire.getState().equalsIgnoreCase("0")) {
				questionnaires.remove(summaryQuestionnaire);
			}
		}
		return questionnaires;
	}

	/**
	 * 查询规定时间内的总结的数量 by吴敬国 2015-10-104 修改 by李泽2016-03-17
	 * 
	 * @param 学院ID
	 *            ，班级ID
	 * @return 方法优化，添加了学年与学期以取得相应的实习任务的起始时间与结束时间 张文琪 20160906
	 * @throws ParseException
	 */
	public int getSummaryCount(String dpt, String class_id, String stuyear,
			String term) throws ParseException {
		String year = new String();
		String defYear = Common.getNewYear();
		int b = Integer.parseInt(defYear);
		int c = b + 1;
		String secondyear = String.valueOf(c);
		Org org = DictionaryService.findOrg(class_id); // 通过班级ID得到班级
		String org_code = org.getOrg_code(); // 得到班级组织编码
		// 如果班级没有自己的开始时间期限，则依次向上取系，系没有，则取学院
		Param paramset = new Param();
		Param paramget; // 用来存储取出的Paramget对象
		paramset.setDept_id(org_code);
		paramset.setParam_name("开始月份");
		paramset.setYear(stuyear);
		paramset.setTerm(term);
		paramget = paramService
				.selectParambyIdAndParam_nameAndYearAndTerm(paramset);
		System.out.println("是否通过班级取出：" + paramget);
		if (paramget == null) {
			String department = org.getParent_id();// 得到系ID
			String xiorg_code = DictionaryService.findOrg(department)
					.getOrg_code(); // 通过系ID取出系，然后得到系组织编码
			paramset = new Param();
			paramset.setDept_id(xiorg_code);
			paramset.setParam_name("开始月份");
			paramset.setYear(stuyear);
			paramset.setTerm(term);
			paramget = paramService
					.selectParambyIdAndParam_nameAndYearAndTerm(paramset);
			System.out.println("是否通过系别取出：" + paramget);
			if (paramget == null) {
				paramset = new Param();
				paramset.setDept_id(dpt);
				paramset.setParam_name("开始月份");
				paramset.setYear(stuyear);
				paramset.setTerm(term);
				System.out.println("paramset===" + paramset.toString());
				paramget = paramService
						.selectParambyIdAndParam_nameAndYearAndTerm(paramset);
				System.out.println("是否通过学院取出：" + paramget);
				if (paramget == null) {
					return -1;
				}

				year = new String();
				year = paramget.getParam_value();
				paramset = new Param();
				paramset.setDept_id(dpt);
				paramset.setParam_name("结束月份");

				// 第二学期的话，结束月份就默认为下一年
				if (Integer.parseInt(term) == 2) {
					paramset.setYear((Integer.parseInt(stuyear) + 1) + "");
				} else {
					paramset.setYear(stuyear);
				}

				paramset.setTerm(term);
				paramget = paramService
						.selectParambyIdAndParam_nameAndYearAndTerm(paramset);
				System.out.println("是否通过学院取出：" + paramget);
				secondyear = new String();
				secondyear = paramget.getParam_value();

			} else {
				year = new String();
				year = paramget.getParam_value();
				paramset = new Param();
				paramset.setDept_id(xiorg_code);
				paramset.setParam_name("结束月份");
				paramget = paramService.selectParambyIdAndParam_name(paramset);
				System.out.println("是否通过系别取出：" + paramget);
				secondyear = new String();
				secondyear = paramget.getParam_value();
			}
		} else {
			year = new String();
			year = paramget.getParam_value();
			paramset = new Param();
			paramset.setDept_id(org_code);
			paramset.setParam_name("结束月份");
			paramget = paramService.selectParambyIdAndParam_name(paramset);
			System.out.println("是否通过班级取出：" + paramget);
			secondyear = new String();
			secondyear = paramget.getParam_value();
		}
		// 功能：求结束月份与开始月份的月份差——张文琪
		return CommonUtil.countMonths(year, secondyear, "yyyy-MM");
	}

	/**
	 * by桑博
	 ** 
	 * 根据id获取一个问卷，附带问卷的问题与问题的选项
	 * 
	 * @param id
	 * @return
	 */
	public SummaryQuestionnaire getByQuestionAndOption(String id) {
		SummaryQuestionnaire qn = getByQuestion(id);
		SummaryQuestion q = new SummaryQuestion();
		q.setQuestionnaire_id(qn.getId());
		List<SummaryQuestion> qlist = this.summaryQuestionService
				.getSelectQuestion(q);
		for (int i = 0; i < qlist.size(); i++) {
			SummaryOption o = new SummaryOption();
			q = new SummaryQuestion();
			q = (SummaryQuestion) qlist.get(i);
			o.setQuestion_id(q.getId());
			q.setSummaryOptions(this.summaryOptionService.selectList(o));
			qlist.set(i, q);
		}
		qn.setSummaryQuestions(qlist);
		qn.setQuestionNum(qlist.size());
		return qn;

	}

	/**
	 * 
	 * by桑博
	 ** 
	 * 根据id获取一个问卷并附带问题
	 * 
	 * @param id
	 * @return
	 */
	public SummaryQuestionnaire getByQuestion(String id) {

		SummaryQuestionnaire qn = (SummaryQuestionnaire) this.selectByID(id);
		SummaryQuestion q = new SummaryQuestion();
		q.setQuestionnaire_id(qn.getId());
		List<SummaryQuestion> qlist = this.summaryQuestionService
				.getSelectQuestion(q);
		qn.setSummaryQuestions(qlist);
		qn.setQuestionNum(qlist.size());
		return qn;
	}

	/**
	 * @function 通过老师所在部门id查询该学院和学校的所有实习总结
	 * @param dept_id
	 * @edit syj @date 2016-08-31
	 * @return
	 */
	public List<SummaryQuestionnaire> selectSummaryByTeaDeptId(String dept_id) {
		List<SummaryQuestionnaire> questionnaires = summaryQuestionnaireDao
				.selectSummaryByTeaDeptId(dept_id);
		return questionnaires;
	}

	/**
	 * @funcion 通过老师所在部门id和输入的年级查询该学院（包括学校）的实习总结
	 * @param dept_id
	 *            、year
	 * @edit syj @date 2016-08-31
	 * 
	 */
	public List<SummaryQuestionnaire> selectSummaryByTeaDeptIdAndYear(
			String dept_id, String year) {
		List<SummaryQuestionnaire> questionnaires2 = summaryQuestionnaireDao
				.selectSummaryByTeaDeptIdAndYear(dept_id, year);
		return questionnaires2;
	}

}
