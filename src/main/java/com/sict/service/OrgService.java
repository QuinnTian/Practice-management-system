package com.sict.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.OrgDao;
import com.sict.entity.Org;
import com.sict.entity.Teacher;
import com.sict.entity.TreeNode;
import com.sict.util.Common;

/**
 * 功能：组织管理相关的service by郑春光20140910 * 组织org 学院 college 班级 class 系部 dept
 * 
 * */
@Repository(value = "orgService")
@Transactional
public class OrgService implements BasicService<Org> {

	@Autowired
	OrgDao orgDao;
	private Object id;

	public List<Org> selectList(Org o) {
		Org org = (Org) o;
		return orgDao.selectList(org);
	}

	public Org insert(Org o) {
		Org org = (Org) o;
		org.setState("1");
		DictionaryService.updateOrg(org);
		if (orgDao.insert(org) > 0) {
			return org;
		} else {
			return null;
		}
	}

	public int update(Org o) {
		Org org = (Org) o;
		DictionaryService.updateOrg(org);
		return orgDao.update(org);
	}

	public int delete(Org o) {
		return orgDao.delete(o);
	}

	public int deletebyID(String id) {
		Org org = new Org();
		org.setId(id);
		DictionaryService.deleteOrg(id);
		return orgDao.delete(org);
	}

	public Org selectByID(String id) {
		return this.orgDao.selectByID(id);
	}

	public Org insertOrUpdate(Org o) {
		return null;
	}

	public int selectCount(Org o) {
		return 0;
	}

	/**
	 * 功能：目录树相关的操作 ---------------------------------该方法有可能过时了 by李瑶婷 20141129 *
	 * 
	 * */
	public List<TreeNode> getOrgsByParent(String pid) {
		return orgDao.getOrgsByParent(pid);
	}

	/**
	 * 查询所有的二级学院
	 * --------------------------------使用的不对，没有区分学校，这里查询的是系统所有的组织级别是2的组织 by邢志武
	 * 20141215
	 * 
	 * @return List<Org>
	 */
	public List<Org> getAllCollege() {
		Org org = new Org();
		org.setOrg_level("2");
		return orgDao.selectList(org);
	}

	/**
	 * 根据学院id得到所有的系部列表
	 * 
	 * @author 邢志武
	 * @since 20141215
	 * @param String
	 *            parent_id
	 * @return List<Org>
	 */
	public List<Org> getAllDeptByParentId(String parent_id) {
		Org org = new Org();
		org.setOrg_level("3");
		org.setParent_id(parent_id);
		return orgDao.selectList(org);
	}

	/**
	 * 根据学院id得到所有的系部列表
	 * 
	 * @author 王磊-------上面邢志武方法重复，以后删除
	 * @since 20141215
	 * @param String
	 *            college_id
	 * @return List<Org>
	 */
	public List<Org> getAllDeptByCollegeId(String college_id) {
		Org org = new Org();
		org.setOrg_level("3");
		org.setParent_id(college_id);
		return orgDao.selectList(org);
	}

	/**
	 * 通过系部id查出该系所有的班级
	 * 
	 * @author 王磊
	 * @since 20141215
	 * @param String
	 *            dept_id
	 * @return List<Org>
	 */
	public List<Org> getAllClass(String dept_id) {
		Org org = new Org();
		org.setOrg_level("5");
		org.setParent_id(dept_id);
		return orgDao.selectList(org);
	}

	/**
	 * 通过系id和年级过滤班级
	 * 
	 * @author xzw
	 * @since 20141215
	 * @param String
	 *            dept_id, String grade
	 * @return List<Org>
	 */
	public List<Org> getAllClassByGradeAndDeptId(String dept_id, String grade) {
		return orgDao.getAllClassByGradeAndDeptId(grade, dept_id);
	}

	/**
	 * 通过数据中的部门编号检查数据库中是否符合
	 * 
	 * @author 王磊
	 * @since 20150119
	 * @param String
	 *            deptId, String college_id
	 * @return List<Org>
	 */
	public int checkDpetId(String deptId, String college_id) {
		int b;
		b = orgDao.checkdeptId(deptId, college_id);
		return b;
	}

	/**
	 * 通过学院id查出本学院和所有系
	 * 
	 * @author 王磊
	 * @since 20150120
	 * @param String
	 *            collegeId
	 * @return List<Org>
	 */
	public List<Org> getCollegeAndAllDeptByCollegeID(String collegeId) {
		return orgDao.selectByCollegeId(collegeId);
	}

	/**
	 * 根据管理员id 查询所管理的学院
	 * 
	 * @author 邢志武
	 * @since 20150120
	 * @param String
	 *            tea_id
	 * @return String
	 */
	public String selectOrgByTeaId(String tea_id) {
		Org org = new Org();
		org.setContacts("%" + tea_id + "%");
		org.setOrg_level("2");
		org = (Org) orgDao.selectList(org).get(0);
		return org.getId();
	}

	/**
	 * 获取系及学院自身
	 * 
	 * @author 郑春光
	 * @since 20150120
	 * @param String
	 *            college_id
	 * @return List<Org>
	 */
	public List<Org> getOrgDeptByCollegeId(String college_id) {
		return orgDao.getOrgDeptByCollegeId(college_id);
	}

	/**
	 * 查询学院的id通过班级
	 * 
	 * @author 郑春光
	 * @since 20150120
	 * @param String
	 *            class_id
	 * @return String
	 */
	public String getCollegeIdByClassId(String class_id) {
		return orgDao.getCollegeIdByClassId(class_id);
	}

	// --------------------------------------------以下代码未整理 2016-5-13
	/**
	 * 查询全校的所有学院 的id，不是实体 邢志武 20150401
	 * 
	 * @return List<String>
	 */
	public List<String> getColleges() {
		return orgDao.getColleges();
	}

	/**
	 * 查询全校的所有学院 ------------有问题，没有考虑其他学校的情况
	 * 
	 * @author 郑春光
	 * @since 20150120
	 * @param String
	 *            class_id
	 * @return String
	 */
	public List<Org> getAllColleges() {
		Org o = new Org();
		o.setOrg_level("2");
		return orgDao.selectList(o);
	}

	/**
	 * 功能：通过学院的id和年份得到这一年的所有班级 吴敬国 201504-13
	 */
	public List<Org> getClassByCollegesAndGrade(String coll_id, String grade) {
		return orgDao.getClassByCollegesAndGrade(coll_id, grade);
	}

	/**
	 * 判断org表组织编码是否重复
	 * 
	 * @author 孙磊
	 * @since 2015/4/21
	 * @param String
	 *            org_code
	 * @return int
	 */
	public int checkOrgCode(String org_code) {
		Org org = new Org();
		org.setOrg_code(org_code);
		return orgDao.selectCount(org);
	}

	/**
	 * 功能：判断org名称是否重复 吴敬国2015-5-28
	 */
	public int checkOrgNameRepeat(String org_name) {
		Org org = new Org();
		org.setOrg_name(org_name);
		int a = orgDao.selectCount(org);
		return a;
	}

	/**
	 * 获取班级的创建的年份
	 * 
	 * @author 王磊
	 * @param
	 * @return
	 */
	public List<String> getYears() {
		return orgDao.getYears();
	}

	/**
	 * 根据教师的id得到教师所在学院的id
	 * 
	 * @author wjg 2015-10-11
	 * @param HttpSession
	 *            session
	 * @return String
	 */
	public String getCollegeIdByTeaId(HttpSession session) {
		Teacher t = (Teacher) session.getAttribute("current_user");
		String orgId = t.getDept_id();
		String org_level = DictionaryService.findOrg(orgId).getOrg_level();
		if (org_level.equals("3")) {
			orgId = DictionaryService.findOrg(orgId).getParent_id();
		}
		return orgId;
	}

	public Org insertXY(Org o) {
		Org org = (Org) o;
		org.setState("1");
		DictionaryService.updateOrg(org);
		if (orgDao.insert(org) > 0) {
			return org;
		} else {
			return null;
		}
	}

	/**
	 * 根据班级id查询学院
	 * 
	 * @author 王磊
	 * @param
	 * @return
	 */
	public List<Org> selectCollegeByclassId(String class_id) {
		return orgDao.selectCollegeByclassId(class_id);
	}

	/**
	 * 得到所有的学校组织
	 * 
	 * @param
	 * @return List<Org>
	 */
	public List<Org> getAllSchool() {
		Org org = new Org();
		org.setOrg_level("1");
		return orgDao.selectList(org);
	}

	/**
	 * 系统管理员得到组织级别为0 1 2的所有组织和联系人
	 * 
	 * @param
	 * @return
	 */
	public List<Map<String, String>> getTopOrgListAndContacts() {
		return orgDao.getTopOrgListAndContacts();
	}

	/**
	 * 功能：通过班级编号查询老师是否存在 by syj 20160326！！！！
	 * 
	 * */
	public int selectByOrgCode(String org_code) {
		int a;
		a = orgDao.selectByOrgCode(org_code);
		return a;

	}

	/**
	 * 功能：通过系统管理员ID查出所有组织和子组织 by宋浩20160324
	 * 
	 * */
	public List<Org> getOrgSon() {
		return orgDao.getOrgSon();
	}

	/**
	 * 查询所有校级部门 by 师杰 20160321
	 */
	public List<Org> selectSchoolOrg() {
		Org org = new Org();
		org.setOrg_level("1");
		return orgDao.selectList(org);
	}

	/**
	 * 功能：通过上级部门id查出该部门所有班级 by 李达、师杰 20160301
	 */
	public List<Org> selectClassByXyId(String Xy1Id) {
		return orgDao.selectClassByXyId(Xy1Id);
	}

	/**
	 * 功能：查询所有的部门根据组织级别排序 by
	 */
	public List<Org> selectOrderByOrgLevel() {
		Org org = new Org();
		org.setState("1");
		List<Org> orgList = orgDao.selectOrderByOrgLevel(org);
		List<Org> neworgList = this.getNewOrgList(orgList);
		return neworgList;
	}

	/**
	 * 功能：根据需求文档、数据库文档定义处理一些逻辑字段，简化页面显示 by
	 */
	public List<Org> getNewOrgList(List<Org> orgList) {
		if (orgList.size() > 0) {
			for (Org o : orgList) {
				o.setParentOngName(DictionaryService.findOrg(o.getParent_id())
						.getOrg_name());
				if (o.getOrg_level().equalsIgnoreCase("1")) {
					o.setOrglevelname("校级");
				} else if (o.getOrg_level().equalsIgnoreCase("2")) {
					o.setOrglevelname("院级");
				} else if (o.getOrg_level().equalsIgnoreCase("3")) {
					o.setOrglevelname("系级");
				} else if (o.getOrg_level().equalsIgnoreCase("5")) {
					o.setOrglevelname("班级");
				} else if (o.getOrg_level().equalsIgnoreCase("0")) {
					o.setOrglevelname("系统");
				}
			}
		}
		return orgList;
	}

	/**
	 * 根据教师的id得到教师所在的id
	 * 
	 * @author wjg 2015-10-11
	 * @param HttpSession
	 *            session
	 * @return String
	 */
	public String getSchoolIdByTeaId(HttpSession session) {
		String school_id = "";
		Teacher t = (Teacher) session.getAttribute("current_user");
		String orgId = t.getDept_id();
		String org_level = DictionaryService.findOrg(orgId).getOrg_level();
		if (org_level.equals("1")) {
			school_id = orgId;
		} else if (org_level.equals("2")) {
			orgId = DictionaryService.findOrg(orgId).getParent_id();
			school_id = orgId;
		} else if (org_level.equals("3")) {
			orgId = DictionaryService.findOrg(orgId).getParent_id();
			orgId = DictionaryService.findOrg(orgId).getParent_id();
			school_id = orgId;
		}
		return school_id;
	}

	/**
	 * 根据父组织的id得到所有的子组织
	 * 
	 * @param HttpSession
	 * @return String
	 */
	public List<Org> getChildOrgByParentId(String parent_id) {
		return orgDao.getChildOrgListByParentId(parent_id);
	}

	/**
	 * 查询组织的ajax拼接方法
	 * 
	 * @param List
	 *            <Org> orgList
	 * @return StringBuffer
	 */
	public StringBuffer StringBufferWithGetOrg(List<Org> orgList) {
		StringBuffer sb = new StringBuffer();
		for (Org org : orgList) {
			sb.append("<tr>");
			sb.append("<td>" + org.getOrg_code() + "</td>");
			sb.append("<td>" + org.getOrg_name() + "</td>");
			if (org.getOrg_level().equalsIgnoreCase("2")) {
				sb.append("	<td>" + "院级" + "</td>");
			} else if (org.getOrg_level().equalsIgnoreCase("3")) {
				sb.append("	<td>" + "系级" + "</td>");
			} else {
				sb.append("	<td>" + "班级" + "</td>");
			}
			try {
				sb.append("	<td>"
						+ DictionaryService.findTeacher(org.getContacts())
								.getTrue_name() + "</td>");
			} catch (Exception e) {
				sb.append("	<td>" + "无" + "</td>");
			}
			sb.append("	<td>" + org.getPhone() + "</td>");
			sb.append("	<td>"
					+ DictionaryService.findOrg(org.getParent_id())
							.getOrg_name() + "</td>");
			if (org.getState().equalsIgnoreCase("1")) {
				sb.append("	<td>" + "有效" + "</td>");
			} else {
				sb.append("	<td>" + "无效" + "</td>");
			}
			/*
			 * <td><input type="button" value="修改"
			 * onclick="editOrg('${o.id}','${o.org_level}')">
			 */
			sb.append("	<td><input type='button' value='修改' onclick=\"editOrg('"
					+ org.getId()
					+ "','"
					+ org.getOrg_level()
					+ " ')\">&nbsp;<input type='button' value='删除' onclick=\"doDel('"
					+ org.getId() + " ')\"></td>");
			sb.append("</tr>");
		}
		return sb;
	}

	/**
	 * 系统管理员得到组织级别为0 1 2 3的所有组织
	 */
	public List<Org> getAllOrg3() {
		return orgDao.getAllOrg3();
	}

	/**
	 * 根据组织名称查询该组织
	 * 
	 * @author
	 * @since 20141215
	 * @param String
	 *            org_name
	 * @return List<Org>
	 */
	public List<Org> getOrgByOrgName(String org_name) {
		Org org = new Org();
		// org.setParent_id(org_name);
		org.setOrg_name(org_name);
		return orgDao.selectList(org);
	}

	/**
	 * 解析班级信息表 对表中数据进行的验证 2016-5-28
	 */
	public List<Org> validateClassExcel(List<Org> classList) {
		List<String> codeList = new ArrayList();
		String infor = "";// 声明变量，存储表格中未按要求的信息存储。
		int codeNum;
		int nameNum;

		for (Org org : classList) {

			if (org.getHead_code() == null) {
				infor = infor + "班主任教工号不能为空;";
			}
			if (org.getCounselor_code() == null) {
				infor = infor + "辅导员教工号不能为空;";
			}
			String counselor_code = org.getCounselor_code();
			String head_code = org.getHead_code();
			Teacher head_tea = DictionaryService.findTeacherByCode(head_code);
			Teacher counselor_tea = DictionaryService
					.findTeacherByCode(counselor_code);
			if (head_tea == null) {
				infor = infor + "班主任教工号在数据库中不存在;";
			} else {
				if (!head_tea.getTrue_name().equalsIgnoreCase(
						org.getHead_tea_Name())) {
					infor = infor + "班主任教工号与班主任姓名在系统中不对应，请核对;";
				} else {
					org.setHead_tea_id(head_tea.getId());
				}
			}
			if (counselor_tea == null) {
				infor = infor + "辅导员教工号在数据库中不存在;";
			} else {
				if (!counselor_tea.getTrue_name().equalsIgnoreCase(
						org.getCounselorName())) {
					infor = infor + "辅导员教工号与辅导员姓名在系统中不对应，请核对;";
				} else {
					org.setCounselor_id(counselor_tea.getId());
				}
			}
			// 验证组织编码
			nameNum = this.checkOrgNameRepeat(org.getOrg_name());
			codeNum = this.checkOrgCode(org.getOrg_code());
			if (org.getOrg_code() == null) {
				infor = infor + "组织编码不能为空;";
			} else {
				if (codeNum != 0) {
					infor = "组织编码在数据库有重复,请修改";
				}
			}
			// 这里还要验证组织编码不能为汉字2016-6-3
			// 验证组织名称
			if (org.getOrg_name() == null) {
				infor = infor + "组织名称不能为空;";
			} else {
				if (nameNum != 0) {
					infor = "组织名称在数据库有重复,请修改";
				}
			}
			// 验证上级组织
			List<Org> deptlist = this.getOrgByOrgName(org.getParentOngName());
			if (org.getParentOngName() == null) {
				infor = infor + "上级组织不能为空;";
			} else if (deptlist.size() == 0) {
				infor = infor + "上级组织在系统中不存在;";
			} else if (deptlist.size() == 1) {
				if (!deptlist.get(0).getOrg_level().equalsIgnoreCase("3")) {
					infor = infor + "上级组织的组织级别不是系级组织，请核对;";
				} else {
					org.setParent_id(deptlist.get(0).getId());
				}
			}
			if (org.getTime() == null) {
				infor = infor + "年级不能为空;";
			}
			if (infor.trim().equals("")) {
				infor = "无";
			}
			org.setTemp1(infor.trim());
			infor = "";
			if (org.getOrg_code() != null) {
				codeList.add(org.getOrg_code());
			}
		}
		// 判断是否在excel中重复
		String[] co = new String[codeList.size()];
		for (int a = 0; a < codeList.size(); a++) {
			co[a] = codeList.get(a);
		}
		return classList;
	}


}
