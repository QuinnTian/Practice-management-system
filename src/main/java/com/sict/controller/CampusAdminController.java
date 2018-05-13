package com.sict.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.sict.entity.Association;
import com.sict.entity.AssociationMembers;
import com.sict.entity.Courses;
import com.sict.entity.Duties;
import com.sict.entity.Org;
import com.sict.entity.Role;
import com.sict.entity.StuLeaders;
import com.sict.entity.Student;
import com.sict.entity.Teacher;
import com.sict.entity.TeachingClass;
import com.sict.entity.TeachingClassMembers;
import com.sict.entity.TeachingTask;
import com.sict.service.CompanyService;
import com.sict.service.DictionaryService;
import com.sict.service.DutiesService;
import com.sict.service.ExcelService;
import com.sict.service.OrgService;
import com.sict.service.PositionService;
import com.sict.service.PracticeTaskService;
import com.sict.service.RecruitInfoService;
import com.sict.service.RoleService;
import com.sict.service.StuLeadersService;
import com.sict.service.StudentService;
import com.sict.service.TeaCoursesService;
import com.sict.service.TeacherService;
import com.sict.service.TrainDetailService;
import com.sict.service.UserRoleService;
import com.sict.service.campus.AssociationMembersService;
import com.sict.service.campus.AssociationService;
import com.sict.service.campus.TeachingClassMembersService;
import com.sict.service.campus.TeachingClassService;
import com.sict.service.campus.TeachingTaskService;
import com.sict.util.Common;
import com.sict.util.Constants;

@Controller
public class CampusAdminController {
	/**
	 * 注入recruitInfoService by宋浩 2015-12-20 *
	 * 
	 * */
	@Resource(name = "recruitInfoService")
	private RecruitInfoService recruitInfoService;

	/**
	 * 注入companyService by宋浩20151226 *
	 * 
	 * */
	@Resource(name = "companyService")
	private CompanyService companyService;

	/**
	 * 注入positionService by宋浩20151226 *
	 * 
	 * */
	@Resource(name = "positionService")
	private PositionService positionService;
	/**
	 * 注入orgService by丁乐晓20160527 *
	 * 
	 * */
	@Resource(name = "orgService")
	private OrgService orgService;
	/**
	 * 注入teachingClassService by丁乐晓20160527 *
	 * 
	 * */
	@Resource(name = "teachingClassService")
	private TeachingClassService teachingClassService;
	/*
	 * 注入：userRoleService 时间：2016-05-27 作者：丁乐晓
	 */
	@Resource(name = "userRoleService")
	private UserRoleService userRoleService;
	String ret = "";// 定义全局变量：返回类型 zcg 20141020
	/**
	 * 注入studentService by丁乐晓20160527 *
	 */
	@Resource(name = "studentService")
	private StudentService studentService;
	/**
	 * 注入teacherService by丁乐晓20160528 *
	 * 
	 * */
	@Resource(name = "teacherService")
	private TeacherService teacherService;
	/**
	 * 注入trainDetailService by丁乐晓20160528 *
	 * 
	 * */
	@Resource(name = "trainDetailService")
	private TrainDetailService trainDetailService;
	/**
	 * 注入practiceTaskService by丁乐晓20160528 *
	 * 
	 * */
	@Resource(name = "practiceTaskService")
	private PracticeTaskService practiceTaskService;
	/**
	 * 注入TeaCoursesService by 丁乐晓2016-05-28 *
	 * 
	 * */
	@Resource(name = "teaCoursesService")
	private TeaCoursesService teaCoursesService;
	/**
	 * 注入teachingTaskService by 丁乐晓2016-05-31 *
	 * 
	 * */
	@Resource(name = "teachingTaskService")
	private TeachingTaskService teachingTaskService;

	@Resource(name = "associationService")
	private AssociationService associationService;

	@Resource(name = "teachingClassMembersService")
	private TeachingClassMembersService teachingClassMembersService;

	/**
	 * 注入roleService bywtt2014 1130 *
	 * 
	 * */
	@Resource(name = "roleService")
	private RoleService roleService;

	/**
	 * 注入：AssociationService 2016-4-5 lql
	 */
	@Resource
	private AssociationMembersService associationMembersService;
	/**
	 * 注入StuLeadersService
	 * 
	 * @author丁乐晓
	 * @time 创建时间：2016年6月4日 上午10:35:26
	 */
	@Resource(name = "stuLeadersService")
	private StuLeadersService stuLeadersService;
	/**
	 * 说明 DutiesService
	 * 
	 * @author丁乐晓
	 * @time 创建时间：2016年6月4日 上午11:09:12
	 */
	@Resource(name = "dutiesService")
	private DutiesService dutiesService;

	@RequestMapping("CampusAdmin/index.do")
	public String toIndex(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		return "/campusViews/campusAdmin/index";
	}

	/**
	 * 功能：显示本学院的所有教学班信息 author:丁乐晓 time:2016-05-27
	 * 
	 * */
	@RequestMapping("CampusAdmin/web/teaClassList.do")
	public ModelAndView teaClassList(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 得到当前用户
		Teacher tea = (Teacher) session.getAttribute("current_user");
		// 得到当前用户的部门id
		String dept_id = tea.getDept_id();
		// 根据部门id查询到部门的 级别（水平 ）
		String dept_level = DictionaryService.findOrg(dept_id).getOrg_level();// 得到该管理员是的组织id在系级别还是学院级别

		String xy_id;
		// 判断得到的当前用户的 部门水平
		if (dept_level.equals("2")) {
			xy_id = dept_id;// 如果组织的等级为2，说明是学院级别，直接把改id传给xy_id
		} else {
			xy_id = DictionaryService.findOrg(dept_id).getParent_id();// 如果级别不为2，说明是系级别，查询该系的parent_id得到学院id
		}
		// 显示出该用户所在的学院及系部
		List<Org> o = this.orgService.getCollegeAndAllDeptByCollegeID(xy_id);
		// 显示出学年
		ArrayList smsyears = new ArrayList();
		Calendar nowTime = Calendar.getInstance();
		int year = nowTime.get(Calendar.YEAR)+1;// 得到当前年份
		int years = year - 1;
		int yearss = year + 1;
		String smsyear = Integer.toString(years) + "-" + year;
		smsyears.add(smsyear);// 当前学年
		smsyears.add(year + "-" + Integer.toString(yearss));// 后面推一个学年
		// 根据当前的时间判断学期，
		String smster = "";
		int month = nowTime.get(Calendar.MONTH) + 1;
		if ((month >= 9 && month <= 12) || (month < 2 && month > 0)) {
			smster = "1";// 第一学期
		} else if (month > 2 && month < 9) {
			smster = "2";// 第二学期
		}
		// 查询出所有的教学班信息
		List<TeachingClass> teaclass = teachingClassService.getTeachingClass(smsyear, smster, xy_id);
		for (TeachingClass a : teaclass) {
			String teaid = a.getTea_id();
			String teaname = DictionaryService.findTeacher(teaid).getTrue_name();
			a.setTemp1(teaname);
			if (a.getCourses_type().equals("1")) {
				a.setCourses_type("校选修");
			} else if (a.getCourses_type().equals("2")) {
				a.setCourses_type("院选修");
			} else if (a.getCourses_type().equals("3")) {
				a.setCourses_type("必修课");
			} else if (a.getCourses_type().equals("4")) {
				a.setCourses_type("限选课");
			} else if (a.getCourses_type().equals("5")) {
				a.setCourses_type("公共必修课");
			}
		}
		map.put("orgs", o);
		map.put("smsyears", smsyears);
		map.put("teaclass", teaclass);
		return new ModelAndView("campusViews/campusAdmin/teaClassList", map);
	}

	/**
	 * 功能：导入教学班信息 author:丁乐晓 time:2016-05-27
	 * 
	 * */
	@RequestMapping("CampusAdmin/web/teachingclassImport.do")
	public String teachingclassImport(String smsyear, String semester, String partId, HttpSession session) {
		session.setAttribute("smsyear", smsyear);
		session.setAttribute("semester", semester);
		session.setAttribute("partId", partId);
		return "campusViews/campusAdmin/teaClassImport";
	}

	/**
	 * 功能：提交导入 教学班表/授课任务表/课程信息表 解析表格 author:丁乐晓 time:2016-05-27
	 */
	@RequestMapping(value = "CampusAdmin/web/doGuidenceTeaClassImport.do", method = RequestMethod.POST)
	public String teaclassImport1(MultipartHttpServletRequest request, ModelMap modelMap, HttpSession se)
			throws Exception {
		// 导入类型
		String type = Common.NulltoBlank(request.getParameter("type"));
		String smsyear = se.getAttribute("smsyear").toString();
		String smster = se.getAttribute("semester").toString();
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession()
				.getServletContext());
		if (multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest = request;
			Iterator iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				MultipartFile file = multiRequest.getFile(iter.next().toString());

				if (file != null) {
					String file_type = "";
					if (type.equals("excelGuidenceTeacher")) {
						file_type = "excelGuidenceTeacher";
					} else if (type.equals("excelTeachingClass")) {
						file_type = "excelTeachingClass";
					}

					String project_path = request.getSession().getServletContext().getRealPath("/");
					String fileName = file.getOriginalFilename();
					/*
					 * String filePosition = "WEB-INF/uploadedfiles/Import/" +
					 * fileName;
					 */
					String filepos = "Import" + "/" + file_type + "_";
					String filePosition = "Import" + "/" + file_type + "_" + fileName;
					String real_path = Constants.FILE_ROUTE;
					String file_path = project_path + real_path + filePosition;
					/*
					 * String file_pa = real_path +
					 * "WEB-INF/uploadedfiles/Import/";
					 */
					String file_pa = project_path + real_path + filepos;
					// 使用getSize()方法获得文件长度，以此决定允许上传的文件大小。
					file.transferTo(new File(file_path));// 使用transferTo（dest）方法将上传文件写到服务器上指定的文件
					// 文件的属性
					File f = new File(file_pa + fileName);
					// 判断导入数据表类型
					List<TeachingClass> teaclists = ExcelService.AnalysisTeachingClass(f);

					HttpSession session = request.getSession();
					session.setAttribute("teaclists", teaclists);
					String infor = "";
					int b;
					int i = 0;// 记录验证成功的条数
					for (TeachingClass tec : teaclists) {
						// 避免出现null的问题
						if (tec.getTemp1() == null)
							tec.setTemp1("");
						// 教学班名称
						if (tec.getTc_name() == null || tec.getTc_name().equals("")) {
							infor = infor + "教学班名称不能为空！";
						} else {
							TeachingClass tc = new TeachingClass();
							tc.setTc_name(tec.getTc_name());
							tc.setSemester(smster);
							tc.setYear(smsyear);
							int num = teachingClassService.selectCount(tc);
							if (num > 0) {
								infor = infor + "教学班已存在！";
							}
						}
						// 课程类型
						if (tec.getCourses_type() == null || tec.getCourses_type().equals("")) {
							infor = infor + "课程类型不能为空！";
						} else {
							// 课程类型的名称不正确
						}
						if (tec.getWeek_desc() == null || tec.getWeek_desc().equals("")) {
							tec.setWeek_desc("无");
						}
						// 学分
						if (tec.getCredit() == null || tec.getCredit().equals("")) {
							infor = infor + "学分不能为空！";
						}
						// 学时
						if (tec.getHours() == null || tec.getHours().equals("")) {
							infor = infor + "学时不能为空";
						}
						// 任课教师
						if (tec.getTea_id() == null || tec.getTea_id().equals("")) {
							infor = infor + "教工号不存在！";
						} else {
							String tecname = DictionaryService.findTeacher(tec.getTea_id()).getTrue_name();
							String tecname1 = tec.getTemp2();
							if (!tecname1.equals(tecname)) {
								infor = infor + "教工号与该教师不匹配！";
							}
						}
						// 课程信息
						if (tec.getCourses_id() == null || tec.getCourses_id().equals("")) {
							infor = infor + "课程编码不存在！";
						} else {
							String corname = DictionaryService.findCourses(tec.getCourses_id()).getCourse_name();
							String corname1 = tec.getTemp3();
							if (!corname1.equals(corname)) {
								infor = infor + "课程编码与该课程不匹配！";
							}
						}
						// 开始时间
						if (tec.getBegin_time() == null || tec.getBegin_time().equals("")) {
							infor = infor + "开始时间不能为空！";
						}
						// 验证成功
						if (infor.trim().equals("")) {
							infor = "无";
							i++;
						}
						tec.setTemp5(infor.trim());
						infor = "";
					}
					modelMap.put("successCheck", "您辛苦了，共有 " + i + " 条记录被成功验证通过");
					modelMap.put("teachingClass", teaclists);
				}
			}
		}
		return "/campusViews/campusAdmin/teaClassImport";
	}

	/**
	 * 功能：导入excel表格,保存教学班信息,教学任务信息 author:丁乐晓 time:2016-05-31
	 * 
	 */
	@RequestMapping("CampusAdmin/web/doSaveTeaClass.do")
	public String doSaveClassroom(ModelMap modelMap, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		// 得到当前用户
		Teacher teacher = (Teacher) session.getAttribute("current_user");
		List<TeachingClass> tcList = (List<TeachingClass>) session.getAttribute("teaclists");
		for (TeachingClass teachingClass : tcList) {
			String semester = session.getAttribute("semester").toString();
			String smsyear = session.getAttribute("smsyear").toString();
			TeachingClass teaClassadd = new TeachingClass();
			String tcid = Common.returnUUID16();
			teaClassadd.setId(tcid);// 存id
			teaClassadd.setSemester(semester);// 学期
			teaClassadd.setYear(smsyear);// 学年
			teaClassadd.setTc_name(teachingClass.getTc_name());// 教学班名称
			teaClassadd.setCourses_type(teachingClass.getCourses_type());// 课程类型
			teaClassadd.setWeek_desc(teachingClass.getWeek_desc());// 周数描述
			teaClassadd.setCredit(teachingClass.getCredit());// 学分
			teaClassadd.setHours(teachingClass.getHours());// 学时
			Courses cour = DictionaryService.findCoursesByCode(teachingClass.getTemp4());
			teaClassadd.setCourses_id(cour.getId());// 课程id
			teaClassadd.setCreate_people(teacher.getId());// 创建人
			teaClassadd.setCreate_time(Timestamp.valueOf(df.format(new Date())));// 创建时间
			teachingClassService.insert(teaClassadd);
			/* 教学任务表 */
			Teacher tea = DictionaryService.findTeacherByCode(teachingClass.getTemp1());
			TeachingTask teachingTask = new TeachingTask();
			teachingTask.setTea_id(tea.getId());// 任课教师ID
			teachingTask.setId(Common.returnUUID16());
			teachingTask.setTeaching_class_id(tcid);
			teachingTask.setBegin_time(teachingClass.getBegin_time());
			teachingTaskService.insert(teachingTask);
		}
		return "redirect:teaClassImportSuccess.do";
	}

	/**
	 * 导入教学班成功列表
	 * 
	 * @author 丁乐晓
	 * @time：2016年6月2日 下午1:54:15
	 */
	@RequestMapping("CampusAdmin/web/teaClassImportSuccess.do")
	public ModelAndView teaClassImportSuccess(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<TeachingClass> tcLists = (List<TeachingClass>) session.getAttribute("teaclists");
		map.put("tcLists", tcLists);
		return new ModelAndView("/campusViews/campusAdmin/teaClassImportSuccess", map);
	}

	/**
	 * 功能：导入教学班成员信息 author:丁乐晓 time:2016-05-31
	 * 
	 * */
	@RequestMapping("CampusAdmin/web/teachingclassmemberImport.do")
	public ModelAndView teachingclassmemberImport(ModelMap modelMap, HttpSession session, String id) {
		session.setAttribute("tcmid", id);// 教学班的ID
		return new ModelAndView("campusViews/campusAdmin/teaClassMemberImport");
	}

	/**
	 * 功能：提交导入 教学班成员表 解析表格 author:丁乐晓 time:2016-05-31
	 */
	@RequestMapping(value = "CampusAdmin/web/doGuidenceTeaClassMemberImport.do", method = RequestMethod.POST)
	public String teaClassMemberImport(MultipartHttpServletRequest request, ModelMap modelMap, HttpSession se)
			throws Exception {
		// 导入类型
		String type = Common.NulltoBlank(request.getParameter("type"));

		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession()
				.getServletContext());
		if (multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest = request;
			Iterator iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				MultipartFile file = multiRequest.getFile(iter.next().toString());

				if (file != null) {
					String file_type = "";
					if (type.equals("excelTeachingClassMember")) {
						file_type = "excelTeachingClassMember";
					} else if (type.equals("excelTeachingClass")) {
						file_type = "excelTeachingClass";
					}

					String project_path = request.getSession().getServletContext().getRealPath("/");
					String fileName = file.getOriginalFilename();
					/*
					 * String filePosition = "WEB-INF/uploadedfiles/Import/" +
					 * fileName;
					 */
					String filepos = "Import" + "/" + file_type + "_";
					String filePosition = "Import" + "/" + file_type + "_" + fileName;
					String real_path = Constants.FILE_ROUTE;
					String file_path = project_path + real_path + filePosition;
					/*
					 * String file_pa = real_path +
					 * "WEB-INF/uploadedfiles/Import/";
					 */
					String file_pa = project_path + real_path + filepos;
					// 使用getSize()方法获得文件长度，以此决定允许上传的文件大小。
					file.transferTo(new File(file_path));// 使用transferTo（dest）方法将上传文件写到服务器上指定的文件
					// 文件的属性
					File f = new File(file_pa + fileName);
					// 判断导入数据表类型
					List<TeachingClassMembers> tcmlists = ExcelService.AnalysisTeaClassMember(f);
					HttpSession session = request.getSession();
					session.setAttribute("tcmlists", tcmlists);
					String infor = "";
					int b;
					int i = 0;// 记录验证成功的条数
					for (TeachingClassMembers tec : tcmlists) {
						// 学号 姓名
						if (tec.getStudent_id() == null || tec.getStudent_id().equals("")) {
							infor = infor + "学号不存在！";
						} else {
							String tcmname = DictionaryService.findStudent(tec.getStudent_id()).getTrue_name();
							String tcmname1 = tec.getTemp2();
							if (!tcmname1.equals(tcmname)) {
								infor = infor + "学生姓名与学号不匹配！";
							}
						}
						// 验证成功
						if (infor.trim().equals("")) {
							infor = "无";
							i++;
						}
						tec.setTemp5(infor.trim());
						infor = "";
					}
					modelMap.put("successCheck", "您辛苦了，共有 " + i + " 条记录被成功验证通过");
					modelMap.put("tcmemberlist", tcmlists);
				}
			}
		}
		return "/campusViews/campusAdmin/teaClassMemberImport";
	}

	/**
	 * 功能：导入excel表格,保存教学班成员信息 author:丁乐晓 time:2016-05-31
	 * 
	 */
	@RequestMapping("CampusAdmin/web/doSaveTeaClassMember.do")
	public ModelAndView doSaveTeaClassMember(ModelMap modelMap, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		// 得到当前用户
		Teacher teacher = (Teacher) session.getAttribute("current_user");
		List<TeachingClassMembers> tcmlists = (List<TeachingClassMembers>) session.getAttribute("tcmlists");
		for (TeachingClassMembers tcmber : tcmlists) {
			String teachingclassid = session.getAttribute("tcmid").toString();
			TeachingClassMembers teaClassMemberadd = new TeachingClassMembers();
			String tcmbid = Common.returnUUID16();
			teaClassMemberadd.setId(tcmbid);// 存id
			teaClassMemberadd.setTeaching_class_id(teachingclassid);// 教学班ID
			teaClassMemberadd.setStudent_id(tcmber.getStudent_id());// 存学生ID
			teachingClassMembersService.insert(teaClassMemberadd);
		}
		modelMap.put("tcmlists", tcmlists);
		return new ModelAndView("/campusViews/campusAdmin/teaClassMemberImportSuccess", modelMap);
	}

	// -------------------学生会社团 start 2016-06-02---------------------
	/**
	 * 学生会社团管理 列表 李秋林 师杰 2016-3-12
	 */
	@RequestMapping("CampusAdmin/web/associationList.do")
	public ModelAndView associationList(HttpSession session, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		return new ModelAndView("/campusViews/campusAdmin/associationList", map);
	}

	/**
	 * 功能：ajax查询所有的学生会社团列表 by 师杰 李秋林 2016-3-12
	 * */
	@RequestMapping("CampusAdmin/web/ajaxGetAssociation.do")
	public String associationAjaxGet(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {

		response.setCharacterEncoding("UTF-8");// 设置编码格式为utf-8
		String dept = request.getParameter("dept");// 选择部门 社团或者学生会
		String xueyuan_id = (String) session.getAttribute("college_id");// 获取当前学院id
		session.setAttribute("Ass_association", dept);
		List<Association> associationlist = null;// 初始化列表为空
		Association asso = new Association();
		asso.setSa_category(dept);// 将社团或者学生会赋值给数据库中的部门信息
		asso.setSa_college_id(xueyuan_id);// 将学院id赋值给数据库中的学院id
		if (dept != null) {// 如果部门信息不为空
			if (dept.equalsIgnoreCase("1"))
				associationlist = associationService.SelectBySaCategory(asso);// 如果部门信息为//
																				// 1//
																				// 查出所有学生会信息
			if (dept.equalsIgnoreCase("2"))
				associationlist = associationService.SelectBySaCategory(asso);// 如果部门信息为//
																				// 2//
																				// 查出所有社团信息
			StringBuffer sb = new StringBuffer();// 数据缓冲池
			if (associationlist != null) {// 如果列表不为空
				for (Association ass : associationlist) {// 循环遍历学生会列表
					sb.append("<tr>");// 赋值
					sb.append("<td>" + ass.getSa_code() + "</td>");
					sb.append("<td>" + ass.getSa_name() + "</td>");
					if (ass.getSa_level().equalsIgnoreCase("1")) {
						sb.append("	<td>" + "校级" + "</td>");
					} else if (ass.getSa_level().equalsIgnoreCase("2")) {
						sb.append("	<td>" + "院级" + "</td>");
					} else {
						sb.append("	<td>" + "系级" + "</td>");
					}
					try {
						sb.append("	<td>" + DictionaryService.findTeacher(ass.getSa_tea_id()).getTrue_name() + "</td>");
					} catch (Exception e) {
						// TODO: handle exception
						sb.append("	<td>" + "无" + "</td>");
					}
					try {
						sb.append("	<td>" + DictionaryService.findStudent(ass.getSa_stu_id()).getTrue_name() + "</td>");
					} catch (Exception e) {
						// TODO: handle exception
						sb.append("	<td>" + "无" + "</td>");
					}
					sb.append("<td>" + ass.getSa_describe() + "</td>");
					try {
						sb.append("	<td>" + DictionaryService.findOrg(ass.getSa_parent_id()).getOrg_name() + "</td>");
					} catch (Exception e) {
						// TODO: handle exception
						sb.append("	<td>" + "无" + "</td>");
					}
					sb.append("<td><input id='" + ass.getId()
							+ "' type='button' onclick='seeStuUnionMemberDetail(this)' value='查看成员'/></td>");
					sb.append("<td><input id='" + ass.getId() + "' type='button' onclick='editAss(this)' value='修改'/>"
							+ "<input id='" + ass.getId()
							+ "' type='button' onclick='deleteAss(this)' value='删除'/></td>");
				}
			}
			try {
				response.getWriter().println(sb.toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
		return null;
	}

	/**
	 * 功能：管理员添加组织 添加页面sql 2016-3-12 李秋林、师杰
	 * */
	@RequestMapping("CampusAdmin/web/addAssociation.do")
	public String associationAdd(HttpSession session, ModelMap modelMap) {
		String college_id = (String) session.getAttribute("college_id");
		List<Org> Org_NameList = orgService.getCollegeAndAllDeptByCollegeID(college_id);
		List<Org> departmentlist = orgService.getAllDeptByParentId(college_id);
		Association a = associationService.selectMaxCode(college_id);
		String sa_code = "";
		if (a == null) {
			sa_code = college_id + "0001";
		} else {
			String s = a.getSa_code();
			String num = s.substring(s.length() - 4, s.length());
			int i = Integer.parseInt(num) + 1;
			DecimalFormat decimalFormat = new DecimalFormat("0000");
			String l = decimalFormat.format(i);
			sa_code = college_id + l;
		}
		departmentlist = orgService.getAllDeptByParentId(college_id);// 只获取系的id
		List<Role> roleList = roleService.selectByCollegeId(college_id, "ROLE_TEACHER");
		modelMap.put("roleList", roleList);
		modelMap.put("sa_code", sa_code);
		modelMap.put("Org_Name", Org_NameList);
		modelMap.put("departmentlist", departmentlist);
		return "/campusViews/campusAdmin/associationAdd";
	}

	/**
	 * 添加学生会社团 师杰 李秋林 2016-03-15
	 */
	@RequestMapping("CampusAdmin/web/doAddAss.do")
	public String assSave(HttpServletRequest request, HttpSession session) throws IOException {
		// 本学院的id
		String college_id = (String) session.getAttribute("college_id");
		// 获得前台参数
		String sa_code = request.getParameter("sa_code").trim();
		String sa_name = request.getParameter("sa_name");
		String sa_category = request.getParameter("sa_category").trim();
		String contacts = request.getParameter("contacts");
		String description = request.getParameter("desc");
		String sa_level = request.getParameter("sa_level");
		String system = request.getParameter("system");
		String role_id = request.getParameter("role_id");
		// String college_id = Common.getCollegeId(Common.getOneTeaId(session));
		if (sa_level == null || sa_level.equals("")) {
			sa_level = "1";
		} else if (sa_level.equals("2")) {
			system = null;
		}

		if (contacts == null) {
			contacts = "无";
		}
		Teacher teacher = (Teacher) session.getAttribute("current_user");// 获取当前用户
		String sa_create_user = teacher.getId();
		Timestamp sa_create_time = new Timestamp(System.currentTimeMillis());
		Association ass = new Association();
		if (system == null)
			ass.setSa_parent_id(college_id);
		else
			ass.setSa_parent_id(system);
		ass.setId(Common.returnUUID());
		ass.setSa_create_time(sa_create_time);
		ass.setSa_code(sa_code);
		ass.setSa_name(sa_name);
		ass.setSa_level(sa_level);
		ass.setSa_category(sa_category);
		ass.setSa_college_id(college_id);
		ass.setSa_tea_id(contacts);
		ass.setSa_describe(description);
		ass.setSa_create_user(sa_create_user);
		ass.setState(Constants.STATE_USERD);
		ass.setSa_last_edit_user(sa_create_user);
		associationService.insert(ass);

		userRoleService.saveUserRole(contacts, role_id);

		return "redirect:associationList.do";
	}

	/**
	 * 功能：管理员修改学生会社团
	 * 
	 * @author 师杰 李秋林
	 * @since 2016-03-16
	 * */
	@RequestMapping("CampusAdmin/web/editAsso.do")
	public String editAsso(ModelMap modelMap, HttpServletRequest request, HttpSession session) {
		String id = request.getParameter("id");
		String college_id1 = (String) session.getAttribute("college_id");

		Association ass = associationService.selectById1(id);
		String dept_id = DictionaryService.findTeacher(ass.getSa_tea_id()).getDept_id();
		Teacher t = (Teacher) teacherService.selectByID(ass.getSa_tea_id());
		String tea_name = t.getTrue_name();
		List<Org> Org_NameList = orgService.getCollegeAndAllDeptByCollegeID(college_id1);

		modelMap.put("dept_id", dept_id);
		modelMap.put("id", id);
		modelMap.put("Org_Name", Org_NameList);
		modelMap.put("tea_name", tea_name);
		modelMap.put("ass", ass);
		return "/campusViews/campusAdmin/associationEdit";
	}

	/**
	 * 功能：管理员修改学生会社团
	 * 
	 * @author 师杰 李秋林
	 * @since 2016-03-16
	 * */
	@RequestMapping("CampusAdmin/web/doEditSubmit.do")
	public String doEditSubmit(HttpServletRequest request, HttpSession session) throws IOException {
		String id = request.getParameter("id").trim();
		String sa_name = request.getParameter("sa_name");
		String sa_category = request.getParameter("sa_category");
		String contacts = request.getParameter("contacts");
		String description = request.getParameter("description");
		String sa_level = request.getParameter("sa_level");
		if (contacts == null) {
			contacts = "无";
		}
		Teacher teacher = (Teacher) session.getAttribute("current_user");// 获取当前用户
		String Sa_last_edit_user = teacher.getId();

		Timestamp sa_last_edit_time = new Timestamp(System.currentTimeMillis());
		Association ass = associationService.selectById1(id);
		ass.setSa_level(sa_level);
		ass.setSa_category(sa_category);
		ass.setSa_tea_id(contacts);
		ass.setSa_describe(description);
		ass.setSa_last_edit_user(Sa_last_edit_user);
		ass.setSa_last_edit_time(sa_last_edit_time);
		ass.setSa_name(sa_name);
		associationService.update(ass);

		return "redirect:associationList.do";
	}

	/**
	 * 查看学生会具体部门的成员信息.
	 * 
	 * @author lql
	 * @createDate 2016-4-5
	 * @since 3.0
	 * 
	 */
	@RequestMapping("CampusAdmin/web/seeStuUnionMemberDetail.do")
	public String seeStuUnionMemberDetail(ModelMap modelMap, String id) {
		// 定义变量 接受id ---为以后维护知道id是什么id
		String sam_association_id = null;
		// id不为空执行以下代码
		if (id != null) {
			sam_association_id = id;
			AssociationMembers associationMembers = new AssociationMembers();
			associationMembers.setSam_association_id(sam_association_id);
			associationMembers.setState("1");
			List<AssociationMembers> associationMembersList = associationMembersService.selectList(associationMembers);
			if (associationMembersList != null) {
				modelMap.put("associationMembersList", associationMembersList);
			}
		}
		modelMap.put("id", sam_association_id);
		return "/campusViews/campusAdmin/seeStuUnionMemberDetail";
		// return "student/showStuUnionOrAssNumber";
	}

	/**
	 * 添加学生会干部,成员.
	 * 
	 * @author lql
	 * @createDate 2016-4-6
	 * @since 3.0
	 * 
	 */
	@RequestMapping("CampusAdmin/web/stuUnionMemberAdd.do")
	public String stuUnionNumberAdd(ModelMap modelMap, String id, HttpSession session) {
		Teacher tea = (Teacher) session.getAttribute("current_user");
		// 初始化变量
		String college_id = null;
		List<Role> roleList = null;
		if (tea != null) {
			college_id = Common.getCollegeId(tea.getDept_id());
			if (college_id != null)
				roleList = roleService.selectByCollegeId(college_id, "ROLE_STUDENT");
		}
		modelMap.put("roleList", roleList);
		modelMap.put("id", id);
		return "/campusViews/campusAdmin/stuUnionMemberAdd";
		// return "admin/stuUnionOrAssAdd";
	}

	/**
	 * 导入学生会的成员信息.
	 * 
	 * @author lql
	 * @createDate lql
	 * @since 3.0
	 * 
	 */
	@RequestMapping("CampusAdmin/web/importStuUnionMember.do")
	public String importStuUnionNumber(ModelMap modelMap, String id, HttpSession session) {
		// 定义变量记录导入的是学生会成员
		String type = null;
		// id不为空
		if (id != null) {
			Association association = associationService.selectByID(id);
			if (association != null) {
				// 通过查询得到导入的type类型---是导入的学生会还是社团 成员
				if (association.getSa_category().equals("1")) {
					type = "StudentUnionExcel";
				} else if (association.getSa_category().equals("2")) {
					type = "AssociationExcel";
				} else {// 没有该类型 返回null
					return null;
				}
				session.setAttribute("StuUnionOrAsso_id", id);
				modelMap.put("id", id);
				modelMap.put("type", type);
			}
		}
		return "/campusViews/campusAdmin/importStuUnionMember";
	}

	/**
	 * 功能： ajax验证单个添加的学生会或者社团成员是否在我们的系统中、是否已经存在该社团中
	 * 
	 * @throws IOException
	 * @throws JsonMappingException
	 * @throws JsonGenerationException
	 * 
	 * @Author lql 2016-4-6
	 */
	@RequestMapping("CampusAdmin/web/checkStuCode.do")
	public String checkStuCode(String stu_code, String assication_id, HttpServletResponse response)
			throws JsonGenerationException, JsonMappingException, IOException {
		response.setCharacterEncoding("UTF-8");
		StringBuilder stringBuilder = new StringBuilder();
		String info = "";
		Student stu = new Student();
		// 根据学生的学号 得到学生的id
		String stu_id = studentService.getStudentIdByCode(stu_code);
		// 判断该学生 是否在数据库中
		if (stu_id != null) {
			stu = DictionaryService.findStudent(stu_id);
			AssociationMembers associationMembers = new AssociationMembers();
			associationMembers.setSam_stu_id(stu_id);
			associationMembers.setSam_association_id(assication_id);
			// 判断学生还没有添加 该学生
			if (associationMembersService.selectList(associationMembers).size() == 0) {
				info = "学号可以使用";
			} else {
				info = "学号已经在该组织内";
			}
		} else {
			info = "系统没有该学号";
		}
		stringBuilder.append(info);
		stu.setTemp1(info);
		ObjectMapper objectMapper = new ObjectMapper();
		String ajaxData = objectMapper.writeValueAsString(stu);
		stringBuilder.append(info);
		try {
			response.getWriter().println(ajaxData);
			response.getWriter().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		return null;
	}

	/*
	 * 功能： 保存添加的学生会人员 时间：　2016-4-6 修改：丁乐晓 2016-06-04
	 * 
	 * @Author lql
	 */
	@RequestMapping("CampusAdmin/web/doSaveStuUnionMember.do")
	public String doSaveStuUnionMember(HttpServletRequest request, HttpSession session) {
		// 得到当前用户
		Teacher tea = (Teacher) session.getAttribute("current_user");
		// 得到当前用户的部门id
		String dept_id = tea.getDept_id();
		// 获得前台表单数据
		String stu_code = request.getParameter("stu_code");
		// 性别暂时没有用到
		String sex = request.getParameter("sex");
		String duties = request.getParameter("duties");
		String association_id = request.getParameter("id");
		String role_id = request.getParameter("role_id");
		String stu_id = studentService.getStudentIdByCode(stu_code);
		if (role_id != null && (!"0".equals(role_id))) {
			userRoleService.saveUserRole(stu_id, role_id);
			/* 存任职表 */
			StuLeaders sld = new StuLeaders();
			sld.setSsl_stu_id(stu_id);// 学生ID
			sld.setSsl_org_id(association_id);// 学生会或者社团ID
			sld.setSsl_role_id(role_id);// 角色ID
			sld.setSsl_create_user(tea.getId());// 创建人ID
			stuLeadersService.insert(sld);
		}
		// 获得当天系统时间
		Timestamp nousedate = Common.getNowTime();
		// 新建对象 用于插入数据库
		AssociationMembers associationMembers = new AssociationMembers();
		associationMembers.setSam_duty(duties);
		associationMembers.setBegin_time(nousedate);
		associationMembers.setSam_stu_id(stu_id);
		associationMembers.setSam_association_id(association_id);
		// 插入到数据库
		associationMembersService.insert(associationMembers);
		return "redirect:seeStuUnionMemberDetail.do?id=" + association_id;
	}

	/**
	 * 验证导入的学生会 或者社团干部的成员信息. 导入学生会 社团通用
	 * 
	 * @author 李秋林
	 * @createDate 2016-4-6
	 * @since 3.0
	 * 
	 */

	@RequestMapping(value = "CampusAdmin/web/checkStuUnionOrAssMembe.do", method = RequestMethod.POST)
	public String checkStuUnionOrAssMembe(MultipartHttpServletRequest request, ModelMap modelMap, HttpSession session)
			throws Exception {

		String type = Common.NulltoBlank(request.getParameter("type"));

		// 取到用户提交来的excel文件
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession()
				.getServletContext());
		// 不为空就要操作文件、
		if (multipartResolver.isMultipart(request)) {

			MultipartHttpServletRequest multiRequest = request;
			// 遍历得到用户提交的文件名
			Iterator<String> iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				MultipartFile file = multiRequest.getFile(iter.next().toString());
				if (file != null) {

					String file_type = "";
					if (type.equals("StudentUnionExcel")) {
						file_type = "StudentUnionExcel";
					} else if (type.equals("AssociationExcel")) {
						file_type = "AssociationExcel";
					}

					String project_path = request.getSession().getServletContext().getRealPath("/");

					String fileName = file.getOriginalFilename();
					String filepos = "Import" + "/" + file_type + "_";
					String filePosition = "Import" + "/" + file_type + "_" + fileName;
					String real_path = Constants.FILE_ROUTE;
					String file_path = project_path + real_path + filePosition;
					String file_pa = project_path + real_path + filepos;
					// float filesize = file.getSize();//
					// 使用getSize()方法获得文件长度，以此决定允许上传的文件大小。
					file.transferTo(new File(file_path));// 使用transferTo（dest）方法将上传文件写到服务器上指定的文件
					// 文件的属性
					File f = new File(file_pa + fileName);
					// 判断导入数据表类型

					// String StuUnionOrAsso_id =
					// request.getParameter("StuUnionOrAsso_id");
					String StuUnionOrAsso_id = (String) session.getAttribute("StuUnionOrAsso_id");

					// 获得excel文件中的数据封装成java对象放进集合
					List<Student> stuList = ExcelService.analysisStrUnionOrAssciationSutdent(f);

					session.setAttribute("students", stuList);
					// 对学生表的数据验证编号是否重复
					List<String> codeList = new ArrayList<String>();// 声明集合，存储学生编号，为了验证表格中的学生编号是否重复。
					List<String> classidList = new ArrayList<String>();// 声明集合，存储表格中班级编号，为得到每个班级的人数。
					String infor = "";// 声明变量，存储表格中未按要求的信息存储。
					String information = "";// 声明information，得到各班级个数。
					int b;
					int c;
					// 表格的数据验证
					// Student类中的temp2 暂时存放的是 ----学生会成员的职责
					// 定义变量 记录导入的人数
					int num = 0;
					for (Student student : stuList) {
						num++;
						b = this.studentService.selectByStuCode(student.getStu_code());
						// 验证学号 不能为空、不能为空字符串、必须在本数据库中
						if (student.getStu_code() == null) {
							infor = infor + "学号不能为空,";
						} else if (b == 0) {
							infor = "请检查您的学号 数据库没有该学生学号,";
						} else if (student.getStu_code().substring(0, 4).equals(student.getEntry_year())) {
							// 判断入学年份和学号的前四位是否相同---这里用不到
						} else if (b > 0) {
							AssociationMembers associationMembers = new AssociationMembers();
							associationMembers.setSam_association_id(StuUnionOrAsso_id);
							associationMembers.setSam_stu_id(DictionaryService.findStudentByCode(student.getStu_code())
									.getId());

							List<AssociationMembers> AssociationMembersList = associationMembersService
									.selectList(associationMembers);

							if (AssociationMembersList.size() > 0)
								infor = student.getTrue_name() + "已经在该组织中,";

						}

						Student stu = DictionaryService.findStudentByCode(student.getStu_code());
						// 验证姓名 必须不能为空、 不能为空字符串、必须和数据中的姓名一致
						if (stu != null) {
							if (student.getTrue_name() == null || student.getTrue_name().equals(""))
								infor = infor + "姓名不能为空";
							else if (!stu.getTrue_name().equals(student.getTrue_name().trim()))
								infor = infor + "姓名和数据库中的名字不一致";
						}
						// 验证性别---暂时没有用
						if (student.getSex() == null) {
							infor = infor + "性别不能为空,";
						} else if (student.getSex().equals("男") || student.getSex().equals("女")) {

						} else {
							infor = infor + "亲，人只有男女之分奥！,";
						}
						// 验证是否有管理权限

						if (student.getTemp3() == null || "".equals(student.getTemp3().trim())) {

						} else if (student.getTemp3().trim() != null && student.getTemp3().trim().equals("是")) {

						} else if (student.getTemp3().trim() != null && student.getTemp3().trim().equals("否")) {

						} else if (!student.getTemp3().trim().equalsIgnoreCase("是")
								|| !student.getTemp3().trim().equalsIgnoreCase("否")) {
							infor = infor + "指定请填 是 否则填 否或者不填,";
						}

						if (codeList.size() != 0) {
							infor = infor + isCodeExist(student.getStu_code(), codeList, "学生编号");
						}

						if (infor.trim().equals("")) {
							infor = "无";
						}
						student.setTemp1(infor.trim());
						infor = "";
						// 将学生的编号添加到集合中
						if (student.getStu_code() != null) {
							codeList.add(student.getStu_code());
						}

						// 判断学生编号是否在excel中重复
						String[] co = new String[codeList.size()];
						for (int a = 0; a < codeList.size(); a++) {
							co[a] = codeList.get(a);
						}
					}

					information = "您共有 " + num + " 条记录被成功认证";
					modelMap.put("information", information);
					modelMap.put("ss", stuList);
					modelMap.put("type", type);
					modelMap.put("fileName", fileName);
				}
			}
		}

		if ("StudentUnionExcel".equals(type))
			ret = "/campusViews/campusAdmin/importStuUnionMember";
		else if ("AssociationExcel".equals(type))
			ret = "/campusViews/campusAdmin/importAssociationMember";

		return ret;
	}

	/**
	 * 保存 导入的学生会成员、社团成员 修改：丁乐晓 2016-06-04
	 * 
	 * @author 张向杨 鲁雪艳
	 * @createDate 2016-03-14
	 * @since 3.0
	 * 
	 */
	@RequestMapping("CampusAdmin/web/saveStuUnionOrAssMember.do")
	public String saveStuUnionOrAss(HttpSession session, ModelMap modelMap, String id, String fileName, String type) {

		String project_path = session.getServletContext().getRealPath("/");
		String real_path = Constants.FILE_ROUTE;
		String filepos = "Import" + "/" + type + "_";
		// 所要保存至数据库的excel的名称
		/*
		 * String file_pa = real_path + "WEB-INF/uploadedfiles/Import/" +
		 * fileName;
		 */
		String file_pa = project_path + real_path + filepos + fileName;
		File f = new File(file_pa);
		// 获得验证方法里面的放进session的集合
		List<Student> stuList = (List<Student>) session.getAttribute("students");
		// 获得系统当前时间
		Timestamp nousedate = Common.getNowTime();
		// 获得用户导入的类型的id 学生会 或者 社团的id
		String StuUnionOrAsso_id = (String) session.getAttribute("StuUnionOrAsso_id");
		AssociationMembers associationMembers = null;
		String sa_category = DictionaryService.findAssociation(StuUnionOrAsso_id).getSa_category();
		// 得到当前用户
		Teacher tea = (Teacher) session.getAttribute("current_user");
		// 得到当前用户的部门id
		String tea_dept_id = tea.getDept_id();
		String stu_college_id = Common.getCollegeId(tea_dept_id);
		for (Student student : stuList) {
			Student student2 = (Student) studentService.selectByCode(student.getStu_code());

			if (student2 != null) {
				if (sa_category != null && "1".equals(sa_category)) {// 导入的为学生会
					Role managerRole = roleService.getRoleByColegeIdAndRoleTemplateId(stu_college_id,
							"ROLE_STUDENT_PE_MANAGER");
					Role memberRole = roleService.getRoleByColegeIdAndRoleTemplateId(stu_college_id,
							"ROLE_STUDENT_PE_MEMBER");
					// 给用户指定的成员添加用户角色
					if (student.getTemp3() == null || student.getTemp3().equals("")) {

					} else if (student.getTemp3().trim() != null) {
						if (student.getTemp3().trim().equals("是")) {// 如果导入表格中显示是管理的角色，则保存管理角色，否则保存成员角色
							userRoleService.saveUserRole(student2.getId(), managerRole.getId());
							/* 存任职表 */
							StuLeaders stuld = new StuLeaders();
							stuld.setSsl_stu_id(student2.getId());// 学生ID
							stuld.setSsl_org_id(StuUnionOrAsso_id);// 学生会或者社团ID
							stuld.setSsl_role_id(managerRole.getId());// 角色ID
							stuld.setSsl_create_user(tea.getId());// 创建人ID
							stuLeadersService.insert(stuld);
						} else {
							userRoleService.saveUserRole(student2.getId(), memberRole.getId());
						}
					}

				} else if (sa_category != null && "2".equals(sa_category)) {// 导入的社团

					// 给用户指定的成员添加用户角色
					if (student.getTemp3() == null || student.getTemp3().equals("")) {

					} else if (student.getTemp3().trim() != null) {
						if (student.getTemp3().trim().equals("是"))
							userRoleService.saveUserRole(student2.getId(), "ROLE_STUDENT_ASSOCIATION_MANAGER");
						/* 存职务表 */
						Duties dut = new Duties();
						if (student.getTemp3().trim().equals("社长")) {
							dut.setName("社长");
						} else if (student.getTemp3().trim().equals("副社长")) {
							dut.setName("社长");
						}
						dut.setType("3");
						dut.setCreator(tea.getId());
						dut.setId(Common.returnUUID());
						dutiesService.insert(dut);
						/* 存任职表 */
						StuLeaders stuld = new StuLeaders();
						stuld.setSsl_stu_id(student2.getId());// 学生ID
						stuld.setSsl_org_id(StuUnionOrAsso_id);// 学生会或者社团ID
						stuld.setSsl_role_id("ROLE_STUDENT_ASSOCIATION_MANAGER");// 角色ID
						stuld.setSsl_create_user(tea.getId());// 创建人ID
						stuLeadersService.insert(stuld);
					}
				}
			}
			if (student2 != null) {
				String duty = student.getTemp2();
				if (StuUnionOrAsso_id != null) {
					Association association = associationService.selectByID(StuUnionOrAsso_id);
					if (association != null) {
						// 判断转存数据库
						if (association.getSa_category().equals("1")) {
							if (duty.trim().equals("学生会主席"))
								duty = "1";
							else if (duty.trim().equals("学生会副主席"))
								duty = "2";
							else if (duty.trim().equals("部长"))
								duty = "3";
							else if (duty.trim().equals("副部长"))
								duty = "4";
							else if (duty.trim().equals("普通干事"))
								duty = "5";
							else
								duty = "5";
						} else if (association.getSa_category().equals("2")) {

							if (duty.trim().equals("会长"))
								duty = "1";
							else if (duty.trim().equals("副会长"))
								duty = "2";
							else if (duty.trim().equals("会员"))
								duty = "3";
							else
								duty = "3";

						} else {// 没有该类型 返回nullq
							return null;
						}
					}

				}

				associationMembers = new AssociationMembers();

				associationMembers.setSam_stu_id(student2.getId());
				associationMembers.setSam_duty(duty);
				associationMembers.setBegin_time(nousedate);
				associationMembers.setSam_association_id(StuUnionOrAsso_id);
				// 循环插入到数据库
				associationMembersService.insert(associationMembers);

			}
		}
		modelMap.put("s", stuList);
		modelMap.put("id", StuUnionOrAsso_id);
		Association ass = associationService.selectByID(StuUnionOrAsso_id);
		if (ass != null) {
			if ("1".equals(ass.getSa_category()))
				ret = "/campusViews/campusAdmin/importStuUnionSuccess";
			else if ("2".equals(ass.getSa_category()))
				ret = "/campusViews/campusAdmin/importAssociationSuccess";
		}

		return ret;
		// return "student/importStuUnionOrAssSuccess";
	}

	/*
	 * 功能：检验编号是否在表格中是否重复 by王磊 2014/1/6
	 */
	public static String isCodeExist(String currentCode, List d, String souce) {
		int count = 0;
		String temp = "";
		for (int i = 0; i < d.size(); i++) {
			temp = (String) d.get(i);
			if (temp.equals(currentCode)) {
				count++;
			}
		}
		if (count > 0) {
			return "表格中" + souce + "列不能重复。";
		} else {
			return "";
		}
	}

	// ajax 查询系老师 20150119

	@RequestMapping("CampusAdmin/web/ajaxPk_teacher.do")
	public String ajaxPk_teacher(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		String c = request.getParameter("xibu");
		StringBuffer s = new StringBuffer();
		s.append("<option  selected='selected'>请选择</option>");
		if (c != null) {
			List<Teacher> t = teacherService.getTeachersByDeptId(c);
			for (Teacher teacher : t) {
				s.append("<option " + "value=" + teacher.getId() + ">" + teacher.getTrue_name() + "</option>");
			}
			try {
				response.getWriter().println(s.toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
		return null;
	}

	// -------------学生会社团 end ---2016-06-02------------------------

	/**
	 * 删除学生会 社团
	 * 
	 * @author 丁乐晓
	 * @time：2016年6月3日 上午11:38:21
	 */
	@RequestMapping("CampusAdmin/web/deleteAsso.do")
	public String deleteAsso(String id, HttpServletRequest request, HttpSession session) {
		Association aa = associationService.selectByID(id);
		List<AssociationMembers> members = associationMembersService.selectStusByAssId(id);
		associationService.delete(aa);
		for (AssociationMembers m : members) {
			associationMembersService.delete(m);
		}
		return "/campusViews/campusAdmin/associationList";
	}

}
