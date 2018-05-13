package com.sict.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.sict.util.Common;
import com.sict.dao.TeacherDao;
import com.sict.entity.Teacher;
import com.sict.entity.TreeNode;

/**
 * 功能：..相关的service 使用 @Repository 注释 TeacherDao by郑春光20140910 *
 * 
 * */
@Repository(value = "teacherService")
@Transactional
public class TeacherService implements BasicService {

	@Autowired
	TeacherDao teacherDao;

	public List selectList(Object o) {
		Teacher t =(Teacher)o;
		return teacherDao.selectList(t);
	}


	public int update(Object o) {
		Teacher t =(Teacher)o;
		DictionaryService.updateTeacher(t);
		DictionaryService.updateTeacherCodeByCode(t);
		return teacherDao.update(t);
	}
	//暂时没有用到删除，以后扩展用
	public int delete(Object o) {
		Teacher t =(Teacher)o;
		DictionaryService.deleteTeacher(t.getId());
		DictionaryService.deleteTeacherCodeByCode(t.getTea_code());
		return teacherDao.delete(t);
	}

	public Object selectByID(String id) {
		return this.teacherDao.selectByID(id);
	}

	public Object insertOrUpdate(Object o) {
		// TODO Auto-generated method stub
		return this.teacherDao.insert(teacherDao);
	}
	
	public int selectCountByID(String id) {
		// TODO Auto-generated method stub
		Teacher t = new Teacher();
		t.setId(id);
		return this.teacherDao.selectCount(t);
	}

	public int selectCount(Object o) {
		// TODO Auto-generated method stub
		return this.teacherDao.selectCount(o);
	}

	public Object selectByCode(String code) {
		// TODO Auto-generated method stub
		return this.teacherDao.selectByCode(code);
	}

	public Object insert(Object o) {
		Teacher t = (Teacher) o;
		DictionaryService.updateTeacher(t);
		DictionaryService.updateTeacherCodeByCode(t);
		return this.teacherDao.insert(t);
	}

	public List<Teacher> selectListByTeaCode(String tea_code) {
	    return teacherDao.selectListByTeaCode(tea_code);
		
	}
	public List<TreeNode> selectTeaByOrgId(String org_id) {
	    return teacherDao.selectTeaByOrgId(org_id);
		
	}
	
	/**
	 * 功能：根据Dept_id查询老师 by邢志武 20141216
	 * 
	 **/
	public List<Teacher> getTeachersByDeptId(String Dept_id){
		
		return this.teacherDao.getTeachersByDeptId(Dept_id);
		
		
	}
	public Teacher getOneTeacherByTeacher(Teacher t){
		List<Teacher> list = this.teacherDao.selectList(t);
		t = null;
		try {
			t = list.get(0);
		} catch (Exception e) {
			t = null;
		}
		return t;
	}
	/**
	 * 功能：通过老师编号查询老师是否存在
	 * by王磊20141226
	 * 
	 * */
	public int selectByTeaCode(String tea_code){
		Teacher teacher=new Teacher();
		teacher.setTea_code(tea_code);
		int a;
		a=teacherDao.selectCount(teacher);
		return a;
	}
	/**
	 * 功能：根据学院id查出本学院的老师信息  管理员教师管理和导入教师时用到此方法
	 * by王磊 20150118
	 * @param	String XyId
	 * @return List<Teacher>
	 * 
	 */
	public List<Teacher> selectListByXuId(String XuId) {
		return teacherDao.selectListByXyId(XuId);
	}
	
	/**
	 * 根据org_id是否在教师表中存在
	 * by吴敬国2015年5月25日
	 * 
	 * @param practice_id
	 * @return String (学生id)
	 */
	public int selectCountByOrgId(String org_id) {
		int a;
		Teacher t=new Teacher();
		t.setDept_id(org_id);
		a = teacherDao.selectCount(t);
		return a;
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
		return teacherDao.getTeachersByCourse(course);
	}
	/**
	 * 
	 * @param expertise
	 * @return
	 * 根据专家特长查询教师
	 * 2015年6月7日 15:29:33
	 * 邢志武
	 */
	public List<Teacher> getTeachersByExpertise(String expertise) {
		return teacherDao.getTeachersByExpertise(expertise);
	}
	/**
	 * 
	 * @param college_id
	 * @return
	 * 根据部门的id查询教师特长
	 * 2015年6月7日 15:19:37
	 * 邢志武
	 */
	public List<String> getSpecialityBycollege(String college_id) {
		return teacherDao.getSpecialityBycollege(college_id);
	}


	public Teacher selectTeacode(String Com_teacher_id) {
		// TODO Auto-generated method stub
		return teacherDao.selectTeacode(Com_teacher_id);
	}


	public String getLoginAndPass(String jiequ) {
		// TODO Auto-generated method stub
		return teacherDao.getLoginAndPass(jiequ);
	}
	
	/**
	 * 根据opId查询相应老师
	 * @param fromUserName
	 * @return
	 */
	public List<Teacher> selectByWx(String fromUserName) {
		return teacherDao.selectByWx(fromUserName);
	}
	/*
	 * 功能： 根据學生的id 獲得老師的id
	 * author：楊夢曉
	 * time：2016-03-04
	 * */
	
	public String selectTeaByStuId(String stuId){
		return teacherDao.selectTeaByStuId(stuId);
	}
	/**
	 * 重置教师密码 
	 * @param String tea_id
	 * @return
	 */
	public String resetPassword(String tea_id) {
		Teacher tea =  (Teacher) this.selectByID(tea_id);
		tea.setLogin_pass(tea.getTea_code());
		this.update(tea);
		return "success";
	}
	/**
	 * 学院管理员根据姓名或者教工号查询教师 by周睿 20160527
	 * 
	 **/
	public List<Teacher> getTeachersByNameOrCode(String name,String college_id){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("name","%"+name+"%");
		map.put("college_id",college_id);
		return teacherDao.getTeachersByNameOrCode(map);
	}
	/**
	 * 系统管理员根据姓名或者教工号查询教师 by周睿 20160527
	 * 
	 */
	public List<Teacher> sysAdminGetTeachersByNameOrCode(String name){
		name="%"+name+"%";
		return teacherDao.sysAdminGetTeachersByNameOrCode(name);
	}
	
	/**
	 * 解析教师信息表 对表中数据进行的验证
	 * 2016-5-28
	 */
	public List<Teacher> validateTeaExcel(List<Teacher> tcList) {
		// 对教师表的数据验证编号是否重复
		List<String> codeList = new ArrayList();// 声明集合，存储教师编号，为了验证表格中的教师编号是否重复。
		List<String> duties = new ArrayList();// 声明集合，储存职能。
		duties.add("教师");
		duties.add("院长");
		duties.add("副院长");
		duties.add("系主任");
		duties.add("系副主任");
		String infor = "";// 声明变量，存储表格中未按要求的信息存储。
		int b;
		// 表格的数据验证
		for (Teacher teacher : tcList) {
			String teaCode = teacher.getTea_code();//获得老师的教师编码
			//根据教师编号查询老师是否存在
			b = this.selectByTeaCode(teaCode);     //这地方改成用字典判断比较好，每次都查询数据库比较慢
			
			//检验手机号
			if (teacher.getPhone() == null) {
				infor = infor + "手机号不能为空,";
			} else if (teacher.getPhone().length() == 11 && teacher.getPhone().matches("[0-9]+")) {
			} else {
				infor = infor + "手机号只能为数字（长度为11位）！,";
			};
			
			//检验教工号
			if (teaCode == null) {
				infor = "教工号不能为空,";
			}else if (teaCode.contains("*")) {//判断教师编号是否有特殊的字符* by syj 20160613
				infor =  "请仔细核对教工号是否书写正确,";
			}
			else {
				if (b != 0) {
					infor = "教工号在数据库有重复,";
				};
			};
			//检验性别
			if (teacher.getSex() == null) {
				infor = infor + "性别不能为空,";
			} else if (teacher.getSex().equals("男")
					|| teacher.getSex().equals("女")) {

			} else {
				infor = infor + "亲，人只有男女之分奥！,";
			};
			
			if (teacher.getCourse_id() != null) {
				if (teacher.getCourse_id().length() > 0) {
					String name[] = teacher.getCourse_id().split(",");
					for (int i = 0; i < name.length; i++) {
						if (DictionaryService.findCoursesByCode(name[i]) == null) {
							infor = infor + "此编号" + name[i] + "有误";
						}
					}
					;
				}
			}
			//检验用户名
			if (teacher.getTrue_name() == null) {
				infor = infor + "用户名不能为空";
			}
			if (codeList.size() != 0) {
				infor = infor + Common.isCodeExist(teaCode, codeList, "教师编号");
			}
			if (teacher.getDuties() == null) {
				infor = infor + "职责不能为空";
			} else {
				if (duties.contains(teacher.getDuties()) == true) {
				} else {
					infor = infor + "没有此职责";
				}
			}
			if (infor.trim().equals("")) {
				infor = "无";
			}
			teacher.setTemp1(infor.trim());
			infor = "";
			if (teacher.getTea_code() != null) {
				codeList.add(teaCode);
			}
			;
		}
		// 判断是否在excel中重复
		String[] co = new String[codeList.size()];
		for (int a = 0; a < codeList.size(); a++) {
			co[a] = codeList.get(a);
		}
		return tcList;
	}
	
	
	
}
