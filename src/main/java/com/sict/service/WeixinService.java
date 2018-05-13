package com.sict.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sict.biz.RegionService;
import com.sict.biz.StuBind;
import com.sict.entity.Courses;
import com.sict.entity.Knowledge;
import com.sict.entity.Notice;
import com.sict.entity.Org;
import com.sict.entity.Company;
import com.sict.entity.InfoCheckRecord;
import com.sict.entity.Position;
import com.sict.entity.PracticeRecord;
import com.sict.entity.PracticeTask;
import com.sict.entity.Region;
import com.sict.entity.StuGraStateCount;
import com.sict.entity.Student;
import com.sict.entity.Teacher;
import com.sict.entity.TrainDetail;

/*
 * 功能：管理员相关的service
 * 使用 @Repository 注释 TeacherDao
 * by郑春光20140910	 * 
 * 
 * */
@Service
public class WeixinService {
	@Resource
	PracticeRecordService practiceRecordService;
	@Resource
	CompanyService companyService;
	@Resource
	PositionService PositionService;
	@Resource
	PracticeTaskService practiceTaskService;
	@Resource
	RegionService regionService;
	@Resource
	InfoCheckRecordService infoCheckRecordService;
	@Resource
	TrainDetailService trainDetailService;
	@Resource
	GroupsService userGroupsService;
	@Resource
	StudentService studentService;
	@Resource
	OrgService orgService;
	@Resource
	TeacherService teacherService;
	@Resource
	CourseService courseService;
	@Resource
	NoticeService noticeService;
	@Resource
	StuBind stuBind;
	@Resource
	KnowledgeService knowledgeService;
	@Resource(name = "ScoreService")
	private ScoreService scoreService;
	
	public int insertPracticeRecord(PracticeRecord practiceRecord) {
		return this.practiceRecordService.insertPracticeRecord(practiceRecord);
	}

	public List<Company> selectAllCompanys() {
		return this.companyService.selectAllCompanys();
	}

	public List<Position> selectAllPositions() {
		return this.PositionService.selectAllPositions();
	}

	public List<PracticeTask> selectAllPracticeTasks() {
		return this.practiceTaskService.selectAllPracticeTasks();
	}

	public List<Region> selectAllRegions() {
		return this.regionService.selectAllRegions();
	}

	public int insertCompany(Company company) {
		return this.companyService.insertCompany(company);
	}

	public int updateInfo(InfoCheckRecord info) {

		return this.infoCheckRecordService.updateInfo(info);
	}

	public List<TrainDetail> searchTrain(String task_id, Timestamp ts,Timestamp time) {
		// TODO Auto-generated method stub
		return this.trainDetailService.searchTrain(task_id, ts,time);
	}

	public String getStu_id(String stu_id) {
		// TODO Auto-generated method stub
		return this.studentService.getStu_id(stu_id);
	}

	public int updatePr(PracticeRecord practicerecord) {
		// TODO Auto-generated method stub
		DictionaryService.updatePracticeRecord(practicerecord);
		return this.practiceRecordService.updatePr(practicerecord);
	}

	public PracticeRecord selectByStu_id(String stu_id) {
		// TODO Auto-generated method stub
		return this.practiceRecordService.selectByStu_id(stu_id);
	}
	/**
	 * 
	 * @param stu_id
	 * @return
	 * 查询未结束的实习申请 
	 * 邢志武 2015年6月30日 11:35:26
	 */
	public PracticeRecord getPrecordUndimission_time(String stu_id) {
		// TODO Auto-generated method stub
		return this.practiceRecordService.getPrecordUndimission_time(stu_id);
	}

	// 选出学生个人信息
	public Student selectStuByStu_id(String id) {
		// TODO Auto-generated method stub
		return this.studentService.selectStuByStu_id(id);
	}

	// 更新人信息
	public int updatePersonal(Student stu) {
		// TODO Auto-generated method stub
		DictionaryService.updateStudent(stu);
		return this.studentService.updatePersonal(stu);
	}

	// 根据id选出实习编号
	/*
	 * public List<Groups> selectPractice_code(String id) { // TODO
	 * Auto-generated method stub return
	 * this.userGroupsService.selectPractice_code(id); }
	 */
	// 根据学生id选出实习申请记录同时判断离职时间是否为空
	public List<PracticeRecord> selectPractice_record(String stu_id) {
		// TODO Auto-generated method stub
		return this.practiceRecordService.selectPrecord(stu_id);
	}

	// 根据学生id选出实习申请记录同时判断审核时间是否为空
	public List<PracticeRecord> selectPrecordByCheck_time(String stu_id,
			String practice_id) {
		// TODO Auto-generated method stub
		return this.practiceRecordService.selectPrecordByCheck_time(stu_id,
				practice_id);
	}

	// 更新实习申请记录
	public int updatePracticeRecord(PracticeRecord practiceRecord) {
		// TODO Auto-generated method stub
		return this.practiceRecordService.updatePracticeRecord(practiceRecord);
	}
	// 根据实践任务id选出本人的实践任务 此时的实践任务id就是这个学生的
	public PracticeTask selectonlyMe(String praid) {
		// TODO Auto-generated method stub
		return this.practiceTaskService.selectonlyMe(praid);
	}

	// 根据学生id选出实习申请记录同时判断离职时间是否为空
	public List<PracticeRecord> selectByStu_idDisstime(String stu_id) {
		// TODO Auto-generated method stub
		return this.practiceRecordService.selectByStu_idDisstime(stu_id);
	}

	public List<Company> selectAllCompanysCheck() {
		return this.companyService.selectAllCompanysCheck();
	}
	/**
	 * 
	 * @return
	 * 模糊查询查出前五十条信息
	 */
	public List<Company> getSomeCompanys(String companyName) {
		List<Company> c=companyService.getSomeCompany(companyName);
		return c;
	}
	

	public List<Company> getCompany(String applicable_scope, String industry) {
		// TODO Auto-generated method stub
		return this.companyService.getCompany(applicable_scope, industry);
	}

	@SuppressWarnings("unchecked")
	public List<Org> selectCollege() {
		// TODO Auto-generated method stub
		Org org = new Org();
		org.setOrg_level("2");
		return this.orgService.selectList(org);
	}

	public String selectCollegeBystu_id(String stu_id) {
		// TODO Auto-generated method stub
		return this.orgService.getCollegeIdByClassId(stu_id);
	}

	public PracticeRecord selectPrecordBypraid(String id, String praid) {
		// TODO Auto-generated method stub
		return this.practiceRecordService.selectPrecordBypraid(id, praid);
	}
	/**
	 * 
	 * @param college_id
	 * @return
	 * 根据学院id查询课程专业
	 * 邢志武
	 * 2015年5月27日 09:45:50
	 */
	public List<Courses> getCourseBycollege(String college_id) {
		// TODO Auto-generated method stub
		 List<Courses> courses=this.courseService.getCourseBycollege(college_id);
		return courses;
	}
	/**
	 * 
	 * @param college_id
	 * @return
	 * 根据学院id查询教师特长
	 * 邢志武
	 * 2015年5月27日 09:45:50
	 */
	public List<String> getSpecialityBycollege(String college_id) {
		// TODO Auto-generated method stub
		List<String> speciality=this.teacherService.getSpecialityBycollege(college_id);
		return speciality;
	}
	/**
	 * 
	 * @param college_id
	 * @return
	 * 根据学院查询本学院的系
	 * 邢志武
	 * 2015年5月27日 09:45:50
	 */
	public List<Org> getDepartmentBycollege(String college_id) {
		// TODO Auto-generated method stub
		 List<Org> department=this.orgService.getCollegeAndAllDeptByCollegeID(college_id);
		return department;
	}
	/**
	 * 
	 * @param course
	 * @return
	 * 根据课程查询相关的专家
	 * 邢志武
	 * 2015年5月27日 20:10:27
	 * 
	 */
	public List<Teacher> getTeachersByCourse(String course) {
		// TODO Auto-generated method stub
		 List<Teacher> teachers=this.teacherService.getTeachersByCourse(course);
		return teachers;
	}
	/**
	 * 
	 * @param expertise
	 * @return
	 * 根据专家特长查询老师
	 * 2015年6月7日 15:28:28
	 * 邢志武
	 */
	public List<Teacher> getTeachersByExpertise(String expertise) {
			// TODO Auto-generated method stub
			 List<Teacher> teachers=this.teacherService.getTeachersByExpertise(expertise);
			return teachers;
		}
	/**
	 * 
	 * @param expertKnowledge
	 * @return
	 * 保存学生提出的问题，专家指导
	 */
	public Integer saveExpertQuiz(Knowledge expertKnowledge) {
		return (Integer) this.knowledgeService.insert(expertKnowledge);
		
	}
	/**
	 * 
	 * @param kn_id
	 * @return
	 * 查询问题
	 */
	public Knowledge getQustionAnswerByID(String kn_id) {
		// TODO Auto-generated method stub
		Knowledge knwoledge= this.knowledgeService.getQustionAnswerByID(kn_id);
		return knwoledge;
	}
	/**
	 * 
	 * @param k
	 * @return
	 * 更新问题表
	 * 2015年6月12日 14:22
	 * 邢志武
	 */
	public int  updateQustionAnswerByID(Knowledge k) {
		int a=knowledgeService.update(k);
		return a;
	}
	/*
	 * 根据企业id 查询企业老师
	 */
	public List<Teacher> getTeachersByCom_id(Teacher t) {
		// TODO Auto-generated method stub
		 List<Teacher> teachers=this.teacherService.selectList(t);
		return teachers;
	}
	
	/**
	 * 
	 * @param t
	 * 创建新的企业教师 
	 * 2015年6月14日 14:53:27
	 * 邢志武
	 */
	public void  insertComTeacher(Teacher t) {
		 this.teacherService.insert(t);
	}

	/**
	 * 
	 * @param praid,  id
	 * 查询学生实习任务
	 * 2015年6月14日 14:53:27
	 * ccc
	 */
	public PracticeTask selectonlyMeById(String praid, String id) {
		// TODO Auto-generated method stub
		return this.practiceTaskService.selectonlyMeById(praid,id);
	}
	
	/**
	 * 查询通知
	 * 2015年6月30日19:07:52
	 * 邢志武
	 * @return
	 */
	public List<Notice> getNoticesList(Notice n) {
		// TODO Auto-generated method stub
		 List<Notice> noticeList=this.noticeService.selectList(n);
		return noticeList;
	}
	
	public Notice getNotice(String notice_id) {
		// TODO Auto-generated method stub
		 Notice notice=(Notice) this.noticeService.selectByID(notice_id);
		 return notice;
	}
	/**
	 * 根据老师id查询该老师的问题
	 * @param tea_id
	 * @return
	 */
	public List<Knowledge> getKnowledgeList(String tea_id) {
		// TODO Auto-generated method stub
		List<Knowledge> knowledges = this.knowledgeService
				.getUnAnswerQuestion(tea_id);
		return knowledges;
	}
	public Knowledge getKnowledge(String Knowledge_id) {
		// TODO Auto-generated method stub
		Knowledge Knowledge=this.knowledgeService.getQustionAnswerByID(Knowledge_id);
		 return Knowledge;
	}
	
	public Knowledge selectById(String question_id) {
		// TODO Auto-generated method stub
		Knowledge Knowledge=(Knowledge) this.knowledgeService.selectById(question_id);
		 return Knowledge;
	}
	public List<Org> selectByXueYuanId(String dept_id) {
		// TODO Auto-generated method stub
		List<Org> departments = orgService.getCollegeAndAllDeptByCollegeID(dept_id);
		return departments;
	}
	/**
	 * 根据教师id 查询所管理的学院id
	 * @param tea_id
	 * @return
	 */
	public String selectOrgByTeaId(String tea_id) {
		// TODO Auto-generated method stub
		String college_id = orgService.selectOrgByTeaId(tea_id);
		return college_id;
	}
	/**
	 * 得到学院或系的实习任务学生各实习状态的人数
	 * @param mapParam
	 * @return
	 */
	public List<StuGraStateCount> getStuStateCountByGradeAndOrg(Map<String, Object> mapParam) {
		// TODO Auto-generated method stub
		List<StuGraStateCount> listStuStateCount = studentService.getStuStateCountByGradeAndOrg(mapParam);
		return listStuStateCount;
	}
	/**
	 * 获取系及学院自身 by郑春光 2015-2-9
	 * @param college_id
	 * @return
	 */
	public List<Org> getOrgDeptByCollegeId(String college_id) {
		// TODO Auto-generated method stub
		List<Org> orgList = orgService.getOrgDeptByCollegeId(college_id);
		return orgList;
	}
	/**
	 * 
	 * @param college_id
	 * @param grade
	 * @return 查看一个学院的任务完成率 2015年7月19日 10:44:42 邢志武
	 */
	public Map<String, Double> getCollegeTaskAccomplish(String college_id,
			String grade) {
		return this.scoreService.getCollegeTaskAccomplish(college_id,grade);
	}
	
	public List<Org> selectByXyId(String XuId) {
		return this.orgService.getAllDeptByCollegeId(XuId);
	}
	public Map<String, Double> getDepartementTaskAccomplish(String org_id,
			String grade) {
		return this.scoreService.getDepartementTaskAccomplish(org_id, grade);
	}
	
	
	/*
	 * 通过opId查询相应学生
	 */
	public List<Student> getStudentByWX(String wxId){
		return (List<Student>) this.studentService.selectByWx(wxId);
	}
	/*
	 * 通过opId查询相应学生
	 */
	public List<Teacher> getTeacherByWX(String wxId){
		return (List<Teacher>) this.teacherService.selectByWx(wxId);
	}
	
	/**
	 * 
	 * @param t
	 * 更新学生 插入头像
	 * 2015年6月14日 14:53:27
	 * 邢志武
	 */
	public void  updateStudentPhoto(Student s) {
		 this.studentService.update(s);
	}
	
	/**
	 *微信绑定
	 */
	public String bdUser(HashMap<String, String> map) {
		 String type=map.get("type");
		 String wx_code=map.get("wx_code");
		 if(type.equals("1")){
			return stuBind.studentBind(wx_code,  map.get("stu_code"), map.get("stu_name"), map.get("stu_id"), map.get("stu_password"));
		 }else{
			return stuBind.TeacherBind(wx_code,  map.get("tea_code"), map.get("tea_name"), map.get("tea_password"));
		 }
	}
}
