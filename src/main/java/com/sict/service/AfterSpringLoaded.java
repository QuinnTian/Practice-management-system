package com.sict.service;

import java.util.HashMap;
import java.util.List;
import java.util.TreeMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import com.sict.dao.ApplicationDao;
import com.sict.dao.CompanyDao;
import com.sict.dao.CourseDao;
import com.sict.dao.EvalsIndexDao;
import com.sict.dao.EvaluateStandardDao;
import com.sict.dao.FilesDao;
import com.sict.dao.GraduationMaterialsDao;
import com.sict.dao.GraduationThesisDao;
import com.sict.dao.GroupMembersDao;
import com.sict.dao.GroupsDao;
import com.sict.dao.InfoCheckRecordDao;
import com.sict.dao.NoticeDao;
import com.sict.dao.OrgDao;
import com.sict.dao.PositionDao;
import com.sict.dao.PracticeRecordDao;
import com.sict.dao.PracticeTaskDao;
import com.sict.dao.RecruitInfoDao;
import com.sict.dao.RegionDao;
import com.sict.dao.RightRegionDao;
import com.sict.dao.RoleDao;
import com.sict.dao.SignDao;
import com.sict.dao.StudentDao;
import com.sict.dao.SysMenuDao;
import com.sict.dao.TeacherDao;
import com.sict.dao.UserRoleDao;
import com.sict.dao.campus.AssociationDao;
import com.sict.entity.Application;
import com.sict.entity.Association;
import com.sict.entity.Company;
import com.sict.entity.Courses;
import com.sict.entity.EvalsIndex;
import com.sict.entity.EvaluateStandard;
import com.sict.entity.Files;
import com.sict.entity.GraduationMaterials;
import com.sict.entity.GraduationThesis;
import com.sict.entity.GroupMembers;
import com.sict.entity.Groups;
import com.sict.entity.InfoCheckRecord;
import com.sict.entity.Notice;
import com.sict.entity.Org;
import com.sict.entity.Position;
import com.sict.entity.PracticeRecord;
import com.sict.entity.PracticeTask;
import com.sict.entity.RecruitInfo;
import com.sict.entity.Region;
import com.sict.entity.RightRegion;
import com.sict.entity.Role;
import com.sict.entity.Sign;
import com.sict.entity.StuGraState;
import com.sict.entity.Student;
import com.sict.entity.SysMenu;
import com.sict.entity.Teacher;
import com.sict.entity.UserRole;

@Component("AfterSpringLoaded")
public class AfterSpringLoaded implements ApplicationListener<ContextRefreshedEvent> {
	// ContextRefreshedEvent为容器初始化完毕事件，spring还有很多事件可以利用

	// 获取 log4j 对象，用于输出日志
	private static final Logger log = LoggerFactory.getLogger(CustomAuthenticationSuccessHandler.class);

	@Autowired
	@Qualifier("studentDao")
	StudentDao daoStudent;

	@Autowired
	TeacherDao daoTeacher;

	@Autowired
	OrgDao daoOrg;

	@Autowired
	RoleDao daoRole;

	@Autowired
	UserRoleDao daoUserRole;
	@Autowired
	InfoCheckRecordDao daoInfoCheckRecord;
	@Autowired
	PracticeTaskDao daoPracticeTask;

	@Autowired
	CompanyDao daoCompany;

	@Autowired
	NoticeDao daoNotice;

	@Autowired
	PositionDao daoPosition;

	@Autowired
	EvaluateStandardDao daoEvaluateStandard;

	@Autowired
	FilesDao daoFiles;
	@Autowired
	SignDao daoSign;
	@Autowired
	RegionDao daoRegion;

	@Autowired
	CourseDao daoCourses;
	@Autowired
	RightRegionDao daoRightRegion;
	@Autowired
	GroupMembersDao groupMembersDao;
	@Autowired
	GroupsDao groupsDao;
	@Autowired
	GraduationThesisDao graduationThesisDao;
	@Autowired
	GraduationMaterialsDao graduationMaterialsDao;
	@Autowired
	RecruitInfoDao recruitInfoDao;
	@Autowired
	EvalsIndexDao evalsIndexDao;
	@Autowired
	PracticeRecordDao practiceRecordDao;
	@Autowired
	SysMenuDao sysMenuDao;
	@Autowired
	ApplicationDao applicationDao;
	@Autowired
	AssociationDao associationDao;

	public AfterSpringLoaded() {
	}

	// 当一个ApplicationContext被初始化或刷新后触发
	public void onApplicationEvent(ContextRefreshedEvent event) {
		if (event.getApplicationContext().getParent() == null) {
			// 可能有多个容器，为避免多次调用，只在顶级容器初始化或刷新后调用
			initDictionaryService();
		}
	}

	private void initDictionaryService() {
		log.info("dictionary loading:----");
		if (daoStudent != null) {
			HashMap<String, Student> mapStudents = new HashMap<String, Student>();
			HashMap<String, Student> mapStudentsBycode = new HashMap<String, Student>();
			Student stu = new Student();
			List<Student> students = daoStudent.selectList(stu);
			for (Student s : students) {
				mapStudents.put(s.getId(), s);
				mapStudentsBycode.put(s.getStu_code(), s);
			}
			DictionaryService.setMapStudents(mapStudents);
			DictionaryService.setMapStudentsBycode(mapStudentsBycode);
		}

		if (daoTeacher != null) {
			HashMap<String, Teacher> mapTeachers = new HashMap<String, Teacher>();
			HashMap<String, Teacher> mapTeachersByCode = new HashMap<String, Teacher>();
			Teacher tea = new Teacher();
			List<Teacher> teachers = daoTeacher.selectList(tea);
			for (Teacher t : teachers) {
				mapTeachers.put(t.getId(), t);
				mapTeachersByCode.put(t.getTea_code(), t);
			}
			DictionaryService.setMapTeachers(mapTeachers);
			DictionaryService.setMapTeachersBycode(mapTeachersByCode);
		}
		if (daoUserRole != null) {
			HashMap<String, UserRole> mapUserRoles = new HashMap<String, UserRole>();
			UserRole userrole = new UserRole();
			List<UserRole> userroles = daoUserRole.selectList(userrole);
			for (UserRole r : userroles) {
				mapUserRoles.put(r.getId(), r);
			}
			DictionaryService.setMapUserRoles(mapUserRoles);
		}
		if (daoOrg != null) {
			HashMap<String, Org> mapOrgs = new HashMap<String, Org>();
			Org org = new Org();
			List<Org> orgs = daoOrg.selectList(org);
			for (Org o : orgs) {
				mapOrgs.put(o.getId(), o);
			}
			DictionaryService.setMapOrgs(mapOrgs);
		}
		if (daoOrg != null) {
			HashMap<String, Org> mapOrgsCode = new HashMap<String, Org>();
			Org org = new Org();
			List<Org> orgs = daoOrg.selectList(org);
			for (Org o : orgs) {
				mapOrgsCode.put(o.getOrg_code(), o);
			}
			DictionaryService.setMapOrgsCode(mapOrgsCode);
		}
		if (daoOrg != null) {
			HashMap<String, Org> mapOrgsName = new HashMap<String, Org>();
			Org org = new Org();
			List<Org> orgs = daoOrg.selectList(org);
			for (Org o : orgs) {
				mapOrgsName.put(o.getOrg_name(), o);
			}
			DictionaryService.setMapOrgsName(mapOrgsName);
		}
		if (graduationThesisDao != null) {
			HashMap<String, GraduationThesis> mapGraduationThesiss = new HashMap<String, GraduationThesis>();
			GraduationThesis graduationThesis = new GraduationThesis();
			List<GraduationThesis> Thesis = graduationThesisDao.selectList(graduationThesis);
			for (GraduationThesis g : Thesis) {
				mapGraduationThesiss.put(g.getId(), g);
			}
			DictionaryService.setMapGraduationThesiss(mapGraduationThesiss);
		}
		if (daoInfoCheckRecord != null) {
			HashMap<String, InfoCheckRecord> mapInfoCheckRecord = new HashMap<String, InfoCheckRecord>();
			HashMap<String, InfoCheckRecord> mapInfoCheckRecords = new HashMap<String, InfoCheckRecord>();
			InfoCheckRecord infoCheckRecord = new InfoCheckRecord();
			List<InfoCheckRecord> InfoCheckRecords = daoInfoCheckRecord.selectList(infoCheckRecord);
			for (InfoCheckRecord r : InfoCheckRecords) {
				mapInfoCheckRecord.put(r.getId(), r);
				mapInfoCheckRecords.put(r.getId(), r);
			}
			DictionaryService.setMapInfoCheckRecords(mapInfoCheckRecords);
			DictionaryService.setMapInfoCheckRecord(mapInfoCheckRecord);
		}
		if (daoRole != null) {
			HashMap<String, Role> mapRoles = new HashMap<String, Role>();
			Role role = new Role();
			List<Role> roles = daoRole.selectList(role);
			for (Role r : roles) {
				mapRoles.put(r.getId(), r);
			}
			DictionaryService.setMapRoles(mapRoles);
		}
		if (daoInfoCheckRecord != null) {
			HashMap<String, InfoCheckRecord> mapInfoCheckRecords = new HashMap<String, InfoCheckRecord>();
			InfoCheckRecord infoCheckRecord = new InfoCheckRecord();
			List<InfoCheckRecord> InfoCheckRecords = daoInfoCheckRecord.selectList(infoCheckRecord);
			for (InfoCheckRecord r : InfoCheckRecords) {
				mapInfoCheckRecords.put(r.getId(), r);
			}
			DictionaryService.setMapInfoCheckRecords(mapInfoCheckRecords);
		}
		if (daoNotice != null) {
			HashMap<String, Notice> mapNotices = new HashMap<String, Notice>();
			Notice notice = new Notice();
			List<Notice> notices = daoNotice.selectList(notice);
			for (Notice r : notices) {
				mapNotices.put(r.getId(), r);
			}
			DictionaryService.setMapNotices(mapNotices);
		}
		if (graduationMaterialsDao != null) {
			HashMap<String, GraduationMaterials> mapGraduationMaterialss = new HashMap<String, GraduationMaterials>();
			GraduationMaterials graduationMaterials = new GraduationMaterials();
			List<GraduationMaterials> Materials = graduationMaterialsDao.selectList(graduationMaterials);
			for (GraduationMaterials gm : Materials) {
				mapGraduationMaterialss.put(gm.getId(), gm);
			}
			DictionaryService.setMapGraduationMaterialss(mapGraduationMaterialss);
		}
		if (groupsDao != null) {
			HashMap<String, Groups> mapGroups = new HashMap<String, Groups>();
			HashMap<String, Groups> mapGroupsByName = new HashMap<String, Groups>();
			Groups group = new Groups();
			List<Groups> groups = groupsDao.selectList(group);
			for (Groups r : groups) {
				mapGroups.put(r.getId(), r);
				mapGroupsByName.put(r.getGroup_name().trim(), r);
			}
			DictionaryService.setMapGroups(mapGroups);
			DictionaryService.setMapGroupsByName(mapGroupsByName);
		}
		if (daoPracticeTask != null) {
			HashMap<String, PracticeTask> mapPracticeTasks = new HashMap<String, PracticeTask>();
			HashMap<String, PracticeTask> mapPracticeTasksByName = new HashMap<String, PracticeTask>();
			PracticeTask pra = new PracticeTask();
			List<PracticeTask> practiceTasks = daoPracticeTask.selectList(pra);
			for (PracticeTask p : practiceTasks) {
				mapPracticeTasks.put(p.getId(), p);
				mapPracticeTasksByName.put(p.getTask_name().trim(), p);
			}
			DictionaryService.setMapPracticeTasks(mapPracticeTasks);
			DictionaryService.setMapPracticeTasksByName(mapPracticeTasksByName);
		}
		if (daoCompany != null) {
			HashMap<String, Company> mapCompanys = new HashMap<String, Company>();
			Company company = new Company();
			List<Company> companys = daoCompany.selectList(company);
			for (Company c : companys) {
				mapCompanys.put(c.getId(), c);
			}
			DictionaryService.setMapCompanys(mapCompanys);
		}
		if (daoPosition != null) {
			HashMap<String, Position> mapPositions = new HashMap<String, Position>();
			Position position = new Position();
			List<Position> positions = daoPosition.selectList(position);
			for (Position p1 : positions) {
				mapPositions.put(p1.getId(), p1);
			}
			DictionaryService.setMapPositions(mapPositions);
		}
		if (daoEvaluateStandard != null) {
			HashMap<String, EvaluateStandard> mapEvaluateStandards = new HashMap<String, EvaluateStandard>();
			EvaluateStandard eva = new EvaluateStandard();
			List<EvaluateStandard> evaluateStandards = daoEvaluateStandard.selectList(eva);
			for (EvaluateStandard e : evaluateStandards) {
				mapEvaluateStandards.put(e.getId(), e);
			}
			DictionaryService.setMapEvaluateStandards(mapEvaluateStandards);
		}
		if (daoFiles != null) {
			HashMap<String, Files> mapFiles = new HashMap<String, Files>();
			Files file = new Files();
			List<Files> files = daoFiles.selectList(file);
			for (Files f : files) {
				mapFiles.put(f.getId(), f);
			}
			DictionaryService.setMapFiles(mapFiles);
		}
		if (daoRegion != null) {
			HashMap<String, Region> mapRegions = new HashMap<String, Region>();
			Region region = new Region();
			List<Region> regions = daoRegion.selectList(region);
			for (Region r1 : regions) {
				mapRegions.put(r1.getId(), r1);
			}
			DictionaryService.setMapRegions(mapRegions);
		}
		if (daoCourses != null) {
			HashMap<String, Courses> mapCourses = new HashMap<String, Courses>();
			HashMap<String, Courses> mapCoursesByCode = new HashMap<String, Courses>();
			Courses course = new Courses();
			List<Courses> courses = daoCourses.selectList(course);
			for (Courses c1 : courses) {
				mapCourses.put(c1.getId(), c1);
				mapCoursesByCode.put(c1.getCourse_code(), c1);
			}
			DictionaryService.setMapCourses(mapCourses);
			DictionaryService.setMapCoursesByCode(mapCoursesByCode);
		}
		if (groupMembersDao != null) {
			HashMap<String, GroupMembers> mapMapGroupMembers = new HashMap<String, GroupMembers>();
			GroupMembers groupMember = new GroupMembers();
			List<GroupMembers> GroupMembers = groupMembersDao.selectList(groupMember);
			for (GroupMembers gm1 : GroupMembers) {
				mapMapGroupMembers.put(gm1.getId(), gm1);
			}
			DictionaryService.setMapGroupMembers(mapMapGroupMembers);
		}
		if (practiceRecordDao != null) {
			HashMap<String, PracticeRecord> mapMapPracticeRecord = new HashMap<String, PracticeRecord>();
			HashMap<String, PracticeRecord> mapPracticeRecordBy = new HashMap<String, PracticeRecord>();
			PracticeRecord practiceRecord = new PracticeRecord();
			List<PracticeRecord> PracticeRecord = practiceRecordDao.selectList(practiceRecord);
			for (PracticeRecord gm1 : PracticeRecord) {
				mapMapPracticeRecord.put(gm1.getId(), gm1);
				mapPracticeRecordBy.put(gm1.getPractice_id(), gm1);
			}
			DictionaryService.setMapPracticeRecord(mapMapPracticeRecord);
			DictionaryService.setMapPracticeRecordByPrd(mapPracticeRecordBy);
		}
		if (recruitInfoDao != null) {
			HashMap<String, RecruitInfo> mapMapRecruitInfo = new HashMap<String, RecruitInfo>();
			RecruitInfo recruitInfo = new RecruitInfo();
			List<RecruitInfo> recruitInfos = recruitInfoDao.selectList(recruitInfo);
			for (RecruitInfo re1 : recruitInfos) {
				mapMapRecruitInfo.put(re1.getId(), re1);
			}
			DictionaryService.setMapRecruitInfos(mapMapRecruitInfo);
		}
		if (evalsIndexDao != null) {
			HashMap<String, EvalsIndex> mapMapEvalsIndex = new HashMap<String, EvalsIndex>();
			EvalsIndex evalsIndex = new EvalsIndex();
			List<EvalsIndex> evalsIndexs = evalsIndexDao.selectList(evalsIndex);
			for (EvalsIndex ei1 : evalsIndexs) {
				mapMapEvalsIndex.put(ei1.getId(), ei1);
			}
			DictionaryService.setMapEvalsIndexs(mapMapEvalsIndex);
		}
		if (evalsIndexDao != null) {
			HashMap<String, EvalsIndex> mapMapEvalsIndex = new HashMap<String, EvalsIndex>();
			EvalsIndex evalsIndex = new EvalsIndex();
			List<EvalsIndex> evalsIndexs = evalsIndexDao.selectList(evalsIndex);
			for (EvalsIndex ei1 : evalsIndexs) {
				mapMapEvalsIndex.put(ei1.getId(), ei1);
			}
			DictionaryService.setMapEvalsIndexs(mapMapEvalsIndex);
		}
		if (daoTeacher != null) {
			HashMap<String, Teacher> mapTeachers = new HashMap<String, Teacher>();
			HashMap<String, Teacher> mapTeachersByCode = new HashMap<String, Teacher>();
			Teacher tea = new Teacher();
			List<Teacher> teachers = daoTeacher.selectList(tea);
			for (Teacher t : teachers) {
				mapTeachers.put(t.getId(), t);
				mapTeachersByCode.put(t.getTea_code(), t);
			}
			DictionaryService.setMapTeachers(mapTeachers);
			DictionaryService.setMapTeachersBycode(mapTeachersByCode);
		}
		if (daoRightRegion != null) {// zcg
			HashMap<String, RightRegion> mapRightRegions = new HashMap<String, RightRegion>();
			RightRegion tea = new RightRegion();
			List<RightRegion> teachers = daoRightRegion.selectList(tea);
			for (RightRegion t : teachers) {
				mapRightRegions.put(t.getId(), t);
			}
			DictionaryService.setMapRightRegion(mapRightRegions);
		}

		if (daoSign != null) {// zcg
			HashMap<String, Sign> mapSigns = new HashMap<String, Sign>();
			Sign sign = new Sign();
			List<Sign> rr = daoSign.selectList(sign);
			for (Sign t : rr) {
				mapSigns.put(t.getId(), t);
			}
			DictionaryService.setMapSign(mapSigns);
		}

		if (sysMenuDao != null) {// wb
			HashMap<String, SysMenu> mapSysMenus = new HashMap<String, SysMenu>();
			SysMenu sysMenu = new SysMenu();
			List<SysMenu> list = sysMenuDao.selectList(sysMenu);
			for (SysMenu s : list) {
				mapSysMenus.put(s.getId(), s);
			}
			DictionaryService.setMapSysmenus(mapSysMenus);

		}
		// 2016-03-09 张向杨
		if (associationDao != null) {
			HashMap<String, Association> mapAssociation = new HashMap<String, Association>();
			Association association = new Association();
			List<Association> associationList = associationDao.selectList(association);
			for (Association ass : associationList) {
				mapAssociation.put(ass.getId(), ass);
			}
			DictionaryService.setMapAssociation(mapAssociation);
		}
		// 2016-04-23 张向杨
		if (applicationDao != null) {
			HashMap<String, Application> mapApplication = new HashMap<String, Application>();
			Application application = new Application();
			List<Application> associationList = applicationDao.selectList(application);
			for (Application app : associationList) {
				mapApplication.put(app.getId(), app);
			}
			DictionaryService.setMapApplication(mapApplication);
		}
		// 初始化学生就业状态码信息 by 郑春光 2015-2-6
		// TreeMap按顺序输出键值对
		/*
		 * TreeMap<String, String> mapStuGraState = new TreeMap<String,
		 * String>(); mapStuGraState.put("000", "初始状态");
		 * mapStuGraState.put("100", "需要推荐工作");// 没有实习单位
		 * mapStuGraState.put("110", "不需要推荐");// 没有实习单位
		 * mapStuGraState.put("120", "单位落实等待上班"); mapStuGraState.put("130",
		 * "正常实习中"); mapStuGraState.put("140", "实习中想换工作");
		 * mapStuGraState.put("150", "实习中新单位已落实"); mapStuGraState.put("160",
		 * "自考本（没有实习单位）"); mapStuGraState.put("170", "专升本");
		 * mapStuGraState.put("180", "征兵"); mapStuGraState.put("190", "创业");
		 * mapStuGraState.put("200", "出国"); mapStuGraState.put("210", "已网签");
		 * mapStuGraState.put("220", "已签劳动合同");
		 * DictionaryService.setMapStrGraStates(mapStuGraState);
		 */
		// 初始化学生就业状态码信息 by 郑春光 2015-2-6 end
		// TreeMap按顺序输出键值对
		TreeMap<String, StuGraState> mapStuGraState = new TreeMap<String, StuGraState>();
		StuGraState s = new StuGraState();
		s = new StuGraState("000", "初始状态", 0);
		mapStuGraState.put("000", s);
		s = new StuGraState("100", "没有实习单位需要推荐", 0);
		mapStuGraState.put("100", s);// 没有实习单位
		s = new StuGraState("110", "没有实习单位不需要推荐", 0);
		mapStuGraState.put("110", s);// 没有实习单位
		s = new StuGraState("120", "落实等待上班", 50);
		mapStuGraState.put("120", s);
		s = new StuGraState("130", "正在实习中", 70);
		mapStuGraState.put("130", s);
		s = new StuGraState("140", "实习中想换工作", 70);
		mapStuGraState.put("140", s);
		s = new StuGraState("150", "实习中新单位已落实", 70);
		mapStuGraState.put("150", s);
		s = new StuGraState("160", "自考本", 50);
		mapStuGraState.put("160", s);
		s = new StuGraState("170", "准备专升本", 50);
		mapStuGraState.put("170", s);
		s = new StuGraState("173", "专升本成功", 90);
		mapStuGraState.put("173", s);
		s = new StuGraState("176", "专升本确定入学", 100);
		mapStuGraState.put("176", s);
		s = new StuGraState("180", "征兵", 100);
		mapStuGraState.put("180", s);
		s = new StuGraState("190", "创业", 50);
		mapStuGraState.put("190", s);
		s = new StuGraState("195", "创业成功", 100);
		mapStuGraState.put("195", s);
		s = new StuGraState("200", "出国", 50);
		mapStuGraState.put("200", s);
		s = new StuGraState("205", "出国成功", 100);
		mapStuGraState.put("205", s);
		s = new StuGraState("210", "已网签", 100);
		mapStuGraState.put("210", s);
		s = new StuGraState("220", "已签劳动合同", 90);
		mapStuGraState.put("220", s);
		s = new StuGraState("230", "培训/学习", 90);
		mapStuGraState.put("230", s);
		DictionaryService.setMapStrGraStates(mapStuGraState);
		// 初始化学生就业状态码信息 by 郑春光 2015-2-6 end
		// 初始化行业分类信息 by 郑春光 2015-3-13
		HashMap<String, String> mapIndustryClassificationCode = new HashMap<String, String>();
		mapIndustryClassificationCode.put("110", "农、林、牧、渔业");
		mapIndustryClassificationCode.put("120", "采矿业");
		mapIndustryClassificationCode.put("130", "制造业");
		mapIndustryClassificationCode.put("140", "电力、燃气及水的生产和供应业");
		mapIndustryClassificationCode.put("150", "建筑业");
		mapIndustryClassificationCode.put("160", "交通运输、仓储和邮政业");
		mapIndustryClassificationCode.put("170", "信息传输、计算机服务和软件业");
		mapIndustryClassificationCode.put("180", "批发和零售业");
		mapIndustryClassificationCode.put("190", "住宿和餐饮业");
		mapIndustryClassificationCode.put("200", "教育业");
		mapIndustryClassificationCode.put("210", "金融业");
		mapIndustryClassificationCode.put("220", "房地产业");
		mapIndustryClassificationCode.put("230", "租赁和商务服务业");
		mapIndustryClassificationCode.put("240", "科学研究、技术服务和地质勘查业");
		mapIndustryClassificationCode.put("250", "水利、环境和公共设施管理业");
		mapIndustryClassificationCode.put("260", "居民服务和其他服务业");
		mapIndustryClassificationCode.put("270", "卫生、社会保幢和社会福利业");
		mapIndustryClassificationCode.put("280", "文化、体育和娱乐业");
		mapIndustryClassificationCode.put("290", "公共管理和社会组织");
		mapIndustryClassificationCode.put("300", "国际组织");
		DictionaryService.setMapIndustryClassification(mapIndustryClassificationCode);
		// 初始化行业分类信息 by 郑春光 2015-3-13 end
	}
}