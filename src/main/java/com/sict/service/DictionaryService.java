package com.sict.service;

import java.util.HashMap;
import java.util.TreeMap;

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
import com.sict.entity.LevelApproval;
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

public class DictionaryService {
	private DictionaryService() {
	}

	/**
	 * 功能：通过id获取所有的学生对象
	 * 
	 * by孙家胜20141201
	 * 
	 * */
	private static HashMap<String, Student> mapS;

	public static void setMapStudents(HashMap<String, Student> mapStudents) {
		mapS = mapStudents;
	}

	public static Student findStudent(String id) {
		return mapS.get(id);
	}

	public static void deleteStudent(String id) {
		mapS.remove(id);
	}

	public static void updateStudent(Student s) {
		mapS.put(s.getId(), s);
	}

	/**
	 * 功能：通过id获取所有的教师对象
	 * 
	 * by孙家胜20141201
	 * 
	 * */
	private static HashMap<String, Teacher> mapT;

	public static void setMapTeachers(HashMap<String, Teacher> mapTeachers) {
		mapT = mapTeachers;
	}

	public static HashMap<String, Teacher> getMapTeachers() {
		return mapT;
	}

	public static Teacher findTeacher(String id) {
		if (mapT.get(id) == null) {
			return null;
		} else {
			return mapT.get(id);
		}
	}

	public static void deleteTeacher(String id) {
		mapT.remove(id);
	}

	public static void updateTeacher(Teacher t) {
		mapT.put(t.getId(), t);
	}

	/**
	 * 功能：通过id获取所有的组织对象
	 * 
	 * by孙家胜20141201
	 * 
	 * */
	private static HashMap<String, Org> mapO;

	public static void setMapOrgs(HashMap<String, Org> mapOrgs) {
		mapO = mapOrgs;
	}

	public static Org findOrg(String id) {
		if (mapO.get(id) == null) {
			return null;
		} else {
			return mapO.get(id);
		}
	}

	public static void deleteOrg(String id) {
		mapO.remove(id);
	}

	public static void updateOrg(Org o) {
		mapO.put(o.getId(), o);
	}

	/**
	 * 功能：通过id获取所有的通知对象
	 * 
	 * by吴敬国20141201
	 * 
	 * */
	private static HashMap<String, Notice> mapNT;

	public static void setMapNotices(HashMap<String, Notice> mapNotices) {
		mapNT = mapNotices;
	}

	public static Notice findNotice(String id) {
		return mapNT.get(id);
	}

	public static void deleteNotice(String id) {
		mapNT.remove(id);
	}

	public static void updateNotice(Notice nt) {
		mapNT.put(nt.getId(), nt);
	}

	/**
	 * 功能：通过组织Code获取所有的组织对象
	 * 
	 * by孙家胜20141201
	 * 
	 * */
	private static HashMap<String, Org> mapOrg;

	public static void setMapOrgsCode(HashMap<String, Org> mapOrgsOrgCode) {
		mapOrg = mapOrgsOrgCode;
	}

	public static Org findOrgCode(String content) {
		return mapOrg.get(content);
	}

	public static void deleteOrgCode(String content) {
		mapOrg.remove(content);
	}

	public static void updateOrgCode(Org o) {
		mapOrg.put(o.getOrg_code(), o);

	}

	/**
	 * 功能：通过id获取所有的角色对象
	 * 
	 * by孙家胜20141201
	 * 
	 * */
	private static HashMap<String, Role> mapR;

	public static void setMapRoles(HashMap<String, Role> mapRoles) {
		mapR = mapRoles;
	}

	public static Role findRole(String id) {
		return mapR.get(id);
	}
	
	public static void deleteRole(String id) {
		mapR.remove(id);
	}

	public static void updateRole(Role p) {
		mapR.put(p.getId(), p);
	}

	/**
	 * 功能：通过id获取所有的用户权限
	 * 
	 * by吴敬国2015-03-25
	 * 
	 * */
	private static HashMap<String, UserRole> mapUR;

	public static void setMapUserRoles(HashMap<String, UserRole> mapUserRoles) {
		mapUR = mapUserRoles;
	}

	public static UserRole findUserRole(String id) {
		return mapUR.get(id);
	}

	public static void deleteUserRole(String id) {
		mapUR.remove(id);
	}

	public static void updateUserRole(UserRole p) {
		mapUR.put(p.getId(), p);
	}

	

	/**
	 * 功能：通过id获取所有的实践教学任务对象
	 * 
	 * by孙家胜20141201
	 * 
	 * */
	private static HashMap<String, PracticeTask> mapP;

	public static void setMapPracticeTasks(HashMap<String, PracticeTask> mapPracticeTasks) {
		mapP = mapPracticeTasks;
	}

	public static PracticeTask findPracticeTask(String id) {
		if (mapP.get(id) == null) {
			return null;
		} else {

			return mapP.get(id);
		}
	}

	public static void deletePracticeTask(String id) {
		mapP.remove(id);
	}

	public static void updatePracticeTask(PracticeTask p) {
		mapP.put(p.getId(), p);
	}

	/**
	 * 功能：通过id获取所有的企业对象
	 * 
	 * by孙家胜20141201 更新公司的时候
	 * */
	private static HashMap<String, Company> mapC;

	public static void setMapCompanys(HashMap<String, Company> mapCompanys) {
		mapC = mapCompanys;
	}

	public static Company findCompany(String id) {
		return mapC.get(id);
	}

	public static void updateCompany(Company c) {
		mapC.put(c.getId(), c);
	}

	public static void deleteCompany(String id) {
		mapC.remove(id);
	}

	/**
	 * 功能：通过id获取所有的企业岗位对象
	 * 
	 * by孙家胜20141201
	 * 
	 * */
	private static HashMap<String, Position> mapP1;

	public static void setMapPositions(HashMap<String, Position> mapPositions) {
		mapP1 = mapPositions;
	}

	public static Position findPosition(String id) {
		return mapP1.get(id);
	}

	/**
	 * 功能：通过id获取所有的评分标准对象
	 * 
	 * by孙家胜20141201
	 * 
	 * */
	private static HashMap<String, EvaluateStandard> mapE;

	public static void setMapEvaluateStandards(HashMap<String, EvaluateStandard> mapEvaluateStandards) {
		mapE = mapEvaluateStandards;
	}

	public static EvaluateStandard findEvaluateStandard(String id) {
		return mapE.get(id);
	}

	public static void deleteEvaluateStandard(String id) {
		mapE.remove(id);
	}

	public static void updateEvaluateStandard(EvaluateStandard e) {
		mapE.put(e.getId(), e);
	}

	/**
	 * 功能：通过id获取所有的文件对象
	 * 
	 * by孙家胜20141201
	 * 
	 * */
	private static HashMap<String, Files> mapF;

	public static void setMapFiles(HashMap<String, Files> mapFiles) {
		mapF = mapFiles;
	}

	public static Files findFiles(String id) {
		return mapF.get(id);
	}

	public static void deleteFiles(String id) {
		mapF.remove(id);
	}

	public static void updateFiles(Files f) {
		mapF.put(f.getId(), f);
	}

	/**
	 * 功能：通过id获取所有的地点对象
	 * 
	 * by孙家胜20141201
	 * 
	 * */
	private static HashMap<String, Region> mapR1;

	public static void setMapRegions(HashMap<String, Region> mapRegions) {
		mapR1 = mapRegions;
	}

	public static Region findRegion(String id) {
		return mapR1.get(id);
	}

	/**
	 * 功能：通过id获取所有的分组表
	 * 
	 * byccc20141216
	 * 
	 * */
	private static HashMap<String, Groups> mapG;

	public static void setMapGroups(HashMap<String, Groups> mapGroups) {
		mapG = mapGroups;
	}

	public static Groups findGroups(String id) {
		return mapG.get(id);
	}

	public static void deleteGroups(String id) {
		mapG.remove(id);
	}

	public static void updateGroups(Groups g) {
		mapG.put(g.getId(), g);
	}

	/**
	 * 功能：通过id获取所有的课程信息
	 * 
	 * byccc20141216
	 * 
	 * */
	private static HashMap<String, Courses> mapCs;

	public static void setMapCourses(HashMap<String, Courses> mapCourses) {
		mapCs = mapCourses;
	}

	public static Courses findCourses(String id) {
		return mapCs.get(id);
	}

	public static void deleteCourses(String id) {
		mapCs.remove(id);
	}

	public static void updateCourses(Courses c) {
		mapCs.put(c.getId(), c);
	}

	/**
	 * 功能：通过id获取所有的小组成员信息
	 * 
	 * by王磊20150121
	 * 
	 * */
	private static HashMap<String, GroupMembers> mapGm;

	public static void setMapGroupMembers(HashMap<String, GroupMembers> mapMapGroupMembers) {
		mapGm = mapMapGroupMembers;
	}

	public static GroupMembers findGroupMembers(String id) {
		return mapGm.get(id);
	}

	public static void updateGroupMembers(GroupMembers g) {
		mapGm.put(g.getId(), g);
	}

	/**
	 * 功能：通过id获取招聘信息
	 * 
	 * by邢志武 2015-01-22
	 * 
	 * */
	private static HashMap<String, RecruitInfo> mapRe;

	public static void setMapRecruitInfos(HashMap<String, RecruitInfo> mapMapRecruitInfo) {
		mapRe = mapMapRecruitInfo;
	}

	public static RecruitInfo findRecruitInfo(String id) {
		return mapRe.get(id);
	}

	public static void updateRecruitInfo(RecruitInfo r) {
		mapRe.put(r.getId(), r);
	}

	/**
	 * 功能：通过id获取奖惩指标信息
	 * 
	 * by王磊 2015-1-25
	 * 
	 * */
	private static HashMap<String, EvalsIndex> mapEi;

	public static void setMapEvalsIndexs(HashMap<String, EvalsIndex> mapMapEvalsIndex) {
		mapEi = mapMapEvalsIndex;
	}

	public static EvalsIndex findEvalsIndex(String id) {
		return mapEi.get(id);
	}

	public static void updateEvalsIndex(EvalsIndex e) {
		mapEi.put(e.getId(), e);
	}

	/**
	 * 功能：通过id获取信息核对
	 * 
	 * bywjg 2015-1-25
	 * 
	 * */
	private static HashMap<String, InfoCheckRecord> mapIr;

	public static void setMapInfoCheckRecords(HashMap<String, InfoCheckRecord> mapInfoCheckRecords) {
		mapIr = mapInfoCheckRecords;
	}

	public static InfoCheckRecord findInfoCheckRecord(String id) {
		return mapIr.get(id);
	}

	public static void deleteInfoCheckRecord(String id) {
		mapIr.remove(id);
	}

	public static void updateInfoCheckRecord(InfoCheckRecord e) {
		mapIr.put(e.getId(), e);
	}

	/**
	 * 功能：通过id获取实习申请
	 * 
	 * byccc 2015-4-07
	 * 
	 * */
	private static HashMap<String, PracticeRecord> mapPr;

	public static void setMapPracticeRecord(HashMap<String, PracticeRecord> mapMapPracticeRecord) {
		mapPr = mapMapPracticeRecord;
	}

	public static PracticeRecord findPracticeRecord(String id) {
		return mapPr.get(id);
	}

	public static void updatePracticeRecord(PracticeRecord e) {
		mapPr.put(e.getId(), e);
	}

	/**
	 * 功能：将就业状态分类存于字典表，通过学生就业状态编码获取就业状态名称
	 * 
	 * by郑春光 2015-2-6
	 * 
	 * */
	/*
	 * private static TreeMap<String, String> mapStuGraState;
	 * 
	 * public static void setMapStrGraStates(TreeMap<String, String>
	 * mapStuGrState) { mapStuGraState = mapStuGrState; }
	 * 
	 * public static String findStuGraStateName(String stuStateCode) { return
	 * mapStuGraState.get(stuStateCode); }
	 * 
	 * public static TreeMap<String, String> getStuGraStateName() { return
	 * mapStuGraState; }
	 */
	/**
	 * 功能：将就业状态分类存于字典表，通过学生就业状态编码获取就业状态名称
	 * 
	 * by郑春光 2015-2-6
	 * 
	 * */
	private static TreeMap<String, StuGraState> mapStuGraState;

	public static void setMapStrGraStates(TreeMap<String, StuGraState> mapStuGrStates) {
		mapStuGraState = mapStuGrStates;
	}

	public static StuGraState findStuGraStateName(String stateCode) {
		return mapStuGraState.get(stateCode);
	}

	public static TreeMap<String, StuGraState> getStuGraStateName() {
		return mapStuGraState;
	}

	/**
	 * 功能：将行业分类信息存到字典表，通过行业编码获取行业名称
	 * 
	 * by郑春光 2015-3-13
	 * 
	 * */
	private static HashMap<String, String> mapIndustryClassificationCode;

	public static void setMapIndustryClassification(HashMap<String, String> mapIndustryClassCode) {
		mapIndustryClassificationCode = mapIndustryClassCode;
	}

	public static String findIndustryClassificationName(String mapIndustryClassCode) {
		return mapIndustryClassificationCode.get(mapIndustryClassCode);
	}

	public static HashMap<String, String> getmapIndustryClassificationCode() {
		return mapIndustryClassificationCode;
	}

	/**
	 * 功能：通过id获取所有的论文
	 * 
	 * by吴敬国20150320
	 * 
	 * */
	private static HashMap<String, GraduationThesis> mapGT;

	public static void setMapGraduationThesiss(HashMap<String, GraduationThesis> mapGraduationThesiss) {
		mapGT = mapGraduationThesiss;
	}

	public static GraduationThesis findGraduationThesis(String id) {
		return mapGT.get(id);
	}

	public static void deleteGraduationThesis(String id) {
		mapGT.remove(id);
	}

	public static void updateGraduationThesis(GraduationThesis gt) {
		mapGT.put(gt.getId(), gt);
	}

	/**
	 * 功能：通过id获取所有的就业材料
	 * 
	 * by吴敬国20150320
	 * 
	 * */
	private static HashMap<String, GraduationMaterials> mapGM;

	public static void setMapGraduationMaterialss(HashMap<String, GraduationMaterials> mapGraduationMaterialss) {
		mapGM = mapGraduationMaterialss;
	}

	public static GraduationMaterials findGraduationMaterials(String id) {
		return mapGM.get(id);
	}

	public static void deleteGraduationMaterials(String id) {
		mapGM.remove(id);
	}

	public static void updateGraduationMaterials(GraduationMaterials gt) {
		mapGM.put(gt.getId(), gt);
	}

	/**
	 * 功能：通过StuCode获取所有的学生对象
	 * 
	 * by王磊2015年4月20日
	 * 
	 * */
	private static HashMap<String, Student> mapStudentsBycode;

	public static void setMapStudentsBycode(HashMap<String, Student> mapStuBycode) {
		mapStudentsBycode = mapStuBycode;
	}

	public static Student findStudentByCode(String stuCode) {
		if (mapStudentsBycode.get(stuCode) == null) {
			return null;
		} else {
			return mapStudentsBycode.get(stuCode);
		}

	}

	public static void deleteStudentCodeByCode(String Code) {
		mapStudentsBycode.remove(Code);
	}

	public static void updateStudentCodeByCode(Student s) {
		mapStudentsBycode.put(s.getStu_code(), s);
	}

	/**
	 * 功能：通过任务名称获取所有的任务对象 by王磊2015年5月6日
	 * 
	 * */
	private static HashMap<String, PracticeTask> mapPracticeTasksByName;

	public static void setMapPracticeTasksByName(HashMap<String, PracticeTask> mapPraTasByName) {
		mapPracticeTasksByName = mapPraTasByName;
	}

	public static PracticeTask findPracticeTaskByName(String praName) {
		if (mapPracticeTasksByName.get(praName) == null) {
			return null;
		} else {
			return mapPracticeTasksByName.get(praName);
		}

	}

	public static void deletePracticeTaskNameByName(String name) {
		mapPracticeTasksByName.remove(name);
	}

	public static void updatePracticeTaskNameByName(PracticeTask pt) {
		mapPracticeTasksByName.put(pt.getTask_name(), pt);
	}

	/**
	 * 功能：通过小组名称获取所有的小组对象 by王磊2015年5月6日
	 * 
	 * */
	private static HashMap<String, Groups> mapGroupsByName;

	public static void setMapGroupsByName(HashMap<String, Groups> mapGroByName) {
		mapGroupsByName = mapGroByName;
	}

	public static Groups findGroupByName(String grouName) {
		if (mapGroupsByName.get(grouName) == null) {
			return null;
		} else {
			return mapGroupsByName.get(grouName);
		}

	}

	public static void deleteGroupsNameByName(String name) {
		mapGroupsByName.remove(name);
	}

	public static void updateGroupsNameByName(Groups g) {
		mapGroupsByName.put(g.getGroup_name(), g);
	}

	/**
	 * 功能：通过课程编码获取所有课程信息对象
	 * 
	 * by王磊2015年4月20日
	 * 
	 * */
	private static HashMap<String, Courses> mapCoursesBycode;

	public static void setMapCoursesByCode(HashMap<String, Courses> mapCouByCode) {
		mapCoursesBycode = mapCouByCode;
	}

	public static Courses findCoursesByCode(String couCode) {
		if (mapCoursesBycode.get(couCode) == null) {
			return null;
		} else {
			return mapCoursesBycode.get(couCode);
		}

	}

	public static void deleteCoursesCodeByCode(String code) {
		mapCoursesBycode.remove(code);
	}

	public static void updateCoursesCodeByCode(Courses c) {
		mapCoursesBycode.put(c.getCourse_code(), c);
	}

	/**
	 * 功能：通过教师编码得到教师所有记录
	 * 
	 * by王磊2015年4月20日
	 * 
	 * */
	private static HashMap<String, Teacher> mapTeachersBycode;

	public static void setMapTeachersBycode(HashMap<String, Teacher> mapTeaBycode) {
		mapTeachersBycode = mapTeaBycode;
	}

	public static Teacher findTeacherByCode(String teaCode) {
		if (mapTeachersBycode.get(teaCode) == null) {
			return null;
		} else {
			return mapTeachersBycode.get(teaCode);
		}

	}

	public static void deleteTeacherCodeByCode(String code) {
		mapTeachersBycode.remove(code);
	}

	public static void updateTeacherCodeByCode(Teacher t) {
		mapTeachersBycode.put(t.getTea_code(), t);
	}

	/**
	 * 功能：通过Id编码得到教师所有记录
	 * 
	 * byccc2015年5月20日
	 * 
	 * */
	private static HashMap<String, PracticeRecord> mapPracticeRecordByPrd;

	public static void setMapPracticeRecordByPrd(HashMap<String, PracticeRecord> mapPracticeRecordBy) {
		mapPracticeRecordByPrd = mapPracticeRecordBy;
	}

	public static PracticeRecord findPracticeRecordByPrd(String practice_id) {
		// TODO Auto-generated method stub
		if (mapPracticeRecordByPrd.get(practice_id) == null) {
			return null;
		} else {
			return mapPracticeRecordByPrd.get(practice_id);
		}
	}

	public static void deletePracticeRecordByPrd(String code) {
		mapPracticeRecordByPrd.remove(code);
	}

	public static void updatePracticeRecordByPrd(PracticeRecord p) {
		mapPracticeRecordByPrd.put(p.getPractice_id(), p);
	}

	/**
	 * 功能：通过Id编码得到实习记录
	 * 
	 * byccc2015年5月20日
	 * 
	 * */
	private static HashMap<String, InfoCheckRecord> mapInfoCheckRecord;

	public static void setMapInfoCheckRecord(HashMap<String, InfoCheckRecord> mapInfoCheckRecordBy) {
		mapInfoCheckRecord = mapInfoCheckRecordBy;
	}

	public static InfoCheckRecord findInfoCheckRecordByPrd(String checktask_id) {
		// TODO Auto-generated method stub
		if (mapInfoCheckRecord.get(checktask_id) == null) {
			return null;
		} else {
			return mapInfoCheckRecord.get(checktask_id);
		}

	}

	/**
	 * 功能：通过id获得合理的签到
	 * 
	 * byccc2015年6月03日
	 * 
	 * */
	private static HashMap<String, RightRegion> mapRightRegionBy;

	public static void setMapRightRegion(HashMap<String, RightRegion> mapRightRegion) {
		mapRightRegionBy = mapRightRegion;
	}

	public static RightRegion findRightRegion(String id) {
		if (mapRightRegionBy.get(id) == null) {
			return null;
		} else {
			return mapRightRegionBy.get(id);
		}
	}

	public static void updateRightRegionBy(RightRegion t) {
		mapRightRegionBy.put(t.getId(), t);
	}

	/**
	 * 功能：更新签到
	 * 
	 * byccc2015年6月03日
	 * 
	 * */
	private static HashMap<String, Sign> mapSignBy;

	public static void setMapSign(HashMap<String, Sign> mapSign) {
		mapSignBy = mapSign;
	}

	public static Sign findSign(String id) {
		if (mapSignBy.get(id) == null) {
			return null;
		} else {
			return mapSignBy.get(id);
		}
	}

	public static void updateSign(Sign sg) {
		// TODO Auto-generated method stub

	}

	/**
	 * 功能：通过组织名称获取所有的组织对象
	 * 
	 * by孙家胜20141201
	 * 
	 * */
	private static HashMap<String, Org> mapOrgN;

	public static void setMapOrgsName(HashMap<String, Org> mapOrgsOrgCode) {
		mapOrgN = mapOrgsOrgCode;
	}

	public static Org findOrgName(String name) {
		return mapOrgN.get(name);
	}

	public static void deleteOrgName(String name) {
		mapOrgN.remove(name);
	}

	public static void updateOrgName(Org o) {
		mapOrg.put(o.getOrg_name(), o);

	}

	/**
	 * 功能：通过id获取所有的假条审批对象
	 * 
	 * by张向杨 2016-01-15
	 * 
	 * */
	private static HashMap<String, LevelApproval> mapLevelApp;

	public static void setMapLevelApproval(HashMap<String, LevelApproval> mapLevelApproval) {
		mapLevelApp = mapLevelApproval;
	}

	public static LevelApproval findLevelApproval(String id) {
		if (id == null) {
			return null;
		} else {
			return mapLevelApp.get(id);
		}
	}

	// 既可以做 insert操作， 也可以做update操作
	public static void updateLevelApproval(LevelApproval la) {
		mapLevelApp.put(la.getId(), la);
	}

	public static void deleteLevelApproval(String id) {
		mapLevelApp.remove(id);
	}

	/**
	 * 功能：通过id获取所有的申请对象
	 * 
	 * by师杰 20160116
	 * 
	 * */
	private static HashMap<String, Application> mapAp;

	public static void setMapApplication(HashMap<String, Application> mapApplication) {
		mapAp = mapApplication;
	}

	public static Application findApplication(String id) {
		if (mapAp.get(id) == null) {
			return null;
		} else {
			return mapAp.get(id);
		}
	}

	public static void updateApplication(Application e) {
		mapAp.put(e.getId(), e);
	}

	/**
	 * 功能：通过id获取所有的请假记录
	 * 
	 * by syj 20160116
	 * 
	 * */
	private static HashMap<String, Application> mapLevelAppli;

	public static void setMapLevelAppli(HashMap<String, Application> mapLevelApplication) {
		mapLevelAppli = mapLevelApplication;
	}

	public static Application findLevelApplication(String id) {
		if (id == null) {
			return null;
		} else {
			return mapLevelAppli.get(id);
		}
	}

	// 既可以做 insert操作， 也可以做update操作
	public static void updateLevelApplication(Application la) {
		mapLevelAppli.put(la.getId(), la);
	}

	public static void deleteLevelApplication(String id) {
		mapLevelAppli.remove(id);
	}

	/**
	 * 功能：通过菜单id获菜单对象
	 * 
	 * by 吴宝 20160308
	 * 
	 * */
	private static HashMap<String, SysMenu> mapSysmenus;

	public static void setMapSysmenus(HashMap<String, SysMenu> mapSysmenu) {
		mapSysmenus = mapSysmenu;
	}
	public static SysMenu findMapSysmenu(String id) {
		if (id == null) {
			return null;
		} else {
			return mapSysmenus.get(id);
		}
	}
	public static void updateSysmenu(SysMenu sysmenu) {
		mapSysmenus.put(sysmenu.getId(), sysmenu);
	}

	public static void deleteSysmenu(String id) {
		mapSysmenus.remove(id);
	}

	/**
	 * 功能：通过id获取所有的假条审批对象
	 * 
	 * by张向杨 2016-03-29
	 * 
	 * */
	private static HashMap<String, Association> mapAssociation;

	public static void setMapAssociation(HashMap<String, Association> mapAss) {
		mapAssociation = mapAss;
	}

	public static Association findAssociation(String id) {
		if (id == null) {
			return null;
		} else {
			return mapAssociation.get(id);
		}
	}

	// 既可以做 insert操作， 也可以做update操作
	public static void updateAssociation(Association ass) {
		mapAssociation.put(ass.getId(), ass);
	}

	public static void deleteAssociation(String id) {
		mapAssociation.remove(id);
	}

}
