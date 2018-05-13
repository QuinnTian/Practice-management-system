package com.sict.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.StudentDao;
import com.sict.entity.Org;
import com.sict.entity.ReportStuCompany;
import com.sict.entity.StuGraStateCount;
import com.sict.entity.Student;
import com.sict.util.Common;

/**
 * 功能：..相关的service 使用 @Repository 注释 TeacherDao by郑春光20140910 *
 * 
 * */
@Repository(value = "studentService")
@Transactional
public class StudentService implements BasicService<Student> {

	@Autowired @Qualifier("studentDao")
	private StudentDao studentDao;
//	private String stuName;

	public List<Student> selectList(Student o) {
		Student s = (Student) o;
		s.setState("1");
		return studentDao.selectList(s);
	}

	public Student insert(Student o) {
		int a=0;
		Student s = (Student) o;
		s.setState("1");
		a=studentDao.insert(s);
		DictionaryService.updateStudent(s);
		DictionaryService.updateStudentCodeByCode(s);
		if(a > 0){
			return o;
		}else{
			return null;
		}
	}

	public int update(Student o) {
		Student s = (Student) o;
		DictionaryService.updateStudent(s);
		DictionaryService.updateStudentCodeByCode(s);
		return studentDao.update(s);
	}

	public int delete(Student o) {
		int a=0;
		Student s = (Student) o;
		a=studentDao.delete(s);
		DictionaryService.deleteStudent(s.getId());
		DictionaryService.deleteStudentCodeByCode(s.getStu_code());
		return a;
	}

	public Student selectByID(String id) {
		return this.studentDao.ByID(id);
	}
	public Student insertOrUpdate(Student o) {
		return null;
	}
	public int selectCountById(String id) {
	    int num = studentDao.selectCountByID(id);
	    System.out.println(num);
	    return num;
	}
	public int selectCount(Student o) {
		return 0;
	}
	public Object selectByCode(String code) {
		return this.studentDao.selectByCode(code);
	}
	/**
	 * 检查代码：吴敬国 2015-6-4  没有用到，微信方面
	 *
	 */
	public String getStu_id(String stu_id) {
		// TODO Auto-generated method stub
		return this.studentDao.getStu_id(stu_id);
	}
	/**
	 * 检查代码：吴敬国 2015-6-4  没有用到，微信方面
	 *
	 */
	public List<Student> selectByWx(String fromUserName) {
		return studentDao.selectByWx(fromUserName);
	}

	/**
	 * 通过教师id选出所带学生id  by ccc2014/12/25
	 *   检查代码：吴敬国 2015-6-4  没有用到，微信方面
	 * @param o
	 * @return
	 */
	public String selectBytea_id(String tea_id) {
		return studentDao.selectBytea_id(tea_id);
	}
	/**
	 *   检查代码：吴敬国 2015-6-4  微信方面，功能不明确，加上功能描述，过时的方法删掉
	 * @param o
	 * @return
	 */
	public Student selectStuByStu_id(String id) {
		return studentDao.selectStuByStu_id(id);
	}
	/**
	 *   检查代码：吴敬国 2015-6-4   功能不明确，加上功能描述，过时的方法删掉
	 * @param o
	 * @return
	 */
	public int updatePersonal(Student stu) {
		// TODO Auto-generated method stub
		return studentDao.updatePersonal(stu);
	}
	
	/**
	 * 功能：根据class_id查询学生 by邢志武 20141216
	 * 
	 **/
	public List<Student> getStudentsByClassId(String class_id){
		return this.studentDao.getStudentsByClassId(class_id);
	}
	/**
	 * 检查代码：吴敬国 2015-6-4   功能不明确，加上功能描述，过时的方法删掉
	 * 
	 **/
	public int updateLastPlace(Student sd) {
		return this.studentDao.updateLastPlace(sd);
	}

	/**
	 * 功能：通过学生编号查询学生是否存在 by王磊20150117
	 */
	public int selectByStuCode(String stu_code) {
		int a;
		a = studentDao.selectByStuCode(stu_code);
		return a;
	}

	/**
	 * 功能：通过学生身份号查询学生是否已经存在 by王磊20150117
	 */
	public int selectByStuCard(String id_card) {
		int b;
		b = studentDao.selectByStuCard(id_card);
		return b;
	}
	/**
	 * 功能：通过院部id查出全员的学生
	 * */
	public List selectListById(String id) {
		// TODO Auto-generated method stub
		return studentDao.selectStudentsByYuanId(id);
	}
	
	public Student selectByID1(String id) {
		// TODO Auto-generated method stub
		return studentDao.selectByID(id);
	}

	/**
	 * 
	 * 功能：得到全校实习任务学生各实习状态的人数
	 * @param grade
	 * @author by 郑春光 2015年2月3日
	 * @return
	 */

	public List<Map<String, Object>> getSchoolStudentStateCountByGrade(String grade) {
		return studentDao.getSchoolStudentStateCountByGrade(grade);
	}
	/**
	 * 功能：得到学院或系的实习任务学生各实习状态的人数
	 * @param 年级、学院id或系id	
	 * @author by 郑春光 2015年2月3日
	 * @return
	 */
	public List<StuGraStateCount> getStuStateCountByGradeAndOrg(Map<String, Object> map) {
		return studentDao.getStuStateCountByGradeAndOrg(map);
	}
	
	/**
	 * 功能：得到学院或系的实习任务学生各实习状态的人数
	 * @param 年级、学院id或系id	
	 * @author by 郑春光 2015年2月3日
	 * @return
	 */
	public List<StuGraStateCount> getXiStuStateCountByGradeAndOrg(Map<String, Object> map) {
		return studentDao.getXiStuStateCountByGradeAndOrg(map);
	}
	
	/**
	 * 功能：得到教师带的实习学生各实习状态的人数，用于饼图
	 * @param 年级、教师id	
	 * @author by 郑春光 2015-2-9
	 * @return
	 */
	public List<Map<String, Object>> getStuStateCountByGradeAndTeaId(Map<String, Object> map) {
		return studentDao.getStuStateCountByGradeAndTeaId(map);
		
	}
	/**
	 * <!-- 功能：得到教师带的实习学生各实习状态的学生详情 -->
	 * @param 年级，实践任务id，实习状态
	 * @return
	 * @author WuGee
	 */
	public List<Student> getStusByGradeAndTeaIdAndState(String grade,String pk_id,String curStateCode) {
		Map<String, Object> mapParam = new HashMap<String, Object>();
		mapParam.put("grade", grade);
		mapParam.put("pk_id", pk_id);
		mapParam.put("curStateCode", curStateCode);
		return studentDao.getStusByGradeAndTeaIdAndState(mapParam);
		
	}
	/**
	 * 功能：查询数据库中学生的入学年份的集合2015年4月7日by王磊
	 * 
	 * */
	public List<String> getYears() {
		return this.studentDao.getYears();
	}
	/**
	 *
	 *功能：通过学生姓名或学号 查询对应的id
	 * 
	 * 2016年1月18日
	 * 
	 */
	public List<Student>  getStudentByNameOrCode(String keyword, String collegeId){
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("keyword", keyword);
		map.put("collegeId", collegeId);
		return studentDao.getStudentIdByNameOrCode(map);
	}
	/**
	 * 功能：通过学生学号查出其对应的id
	 * by ：王磊
	 * 2015年4月17日
	 * 
	 */
	public String getStudentIdByCode(String stuCode){
		return this.studentDao.getStudentId(stuCode);
	}
	/**
	 * 功能：根据小组的id的得到这个小组的学生list
	 * 2015年4月7日by吴敬国
	 * 
	 * */
	public List<Student> getStuListByGroupID(String delGroup_id) {
		Student s=new Student();
		s.setGroup_id(delGroup_id);
		return studentDao.selectList(s);
	}
	/**
	 * 根据org_id是否在学生表中存在
	 * by吴敬国2015年5月25日
	 * 
	 * @param org_id
	 * @return String (学生id)
	 */
	public int selectCountByOrgId(String org_id) {
		int a;
		a = studentDao.selectCountByClassId(org_id);
		return a;
	}
	/**
	 * 功能：通过实习任务id得到所对应的学生 
	 *  by吴敬国 2015-6-12
	 */
	public List<Student> getStuByPracticeTaskId(String practice_id) {
		return studentDao.getStuByPracticeTaskId(practice_id);
	}
	/**
	 * 
	 * @param map (年级跟教师id)
	 * @return
	 * 某个老师所带实习小组的总人数
	 */
	public double getstateTeacherCount(Map<String, Object> map){
		List<Map<String, Object>> m=getStuStateCountByGradeAndTeaId(map);
		double  countAllStu=0;
		for (Map<String, Object> m1 : m) {
			countAllStu+=new Integer(m1.get("stuCount").toString());
		}
		return countAllStu;
		
	}
	/**
	 * 
	 * @param map
	 * @return
	 * 得到教师带的实习学生某种实习状态的人数，用于饼图 参数：年级、老师id,状态
	 */
	public int getStateStuCount(Map<String, Object> map){
		int count=studentDao.getStateStuCount(map);
		return count;
	}
	
	
	/**
	 * 功能：查询某系某个签到学生的所有信息
	 * by ：WuGee
	 * 2015年9月23日 
	 */
	public Student getDepartmentSinStusMes(String stu_id,String depart_id,String grade){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("stu_id", stu_id);
		map.put("depart_id", depart_id);
		map.put("grade", grade);
		return studentDao.getDepartmentSinStusMes( map);
	}
	/**
	 * by ：WuGee
	 * 查询某个系的所有学生
	 * 2015年9月23日 
	 */
	public List<Student> getDepartmentStus(String depart_id,String grade){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("depart_id", depart_id);
		map.put("grade", grade);
		return studentDao.getDepartmentStus(map);
	}
	/**
	 * 功能：根据学生年级得到该年级中所有学生的公司情况
	 * 吴敬国
	 * 2015-9-26
	 **/
	public List<ReportStuCompany> getStuCompanyReport(String year){
		return studentDao.getStuCompanyReport(year);
	}
	/**
	 * 功能：根据学生会部门id查找此学生会所有学生
	 * by 李达、师杰
	 *  20160302
	 */
	public List<Student> getStuUnionStus(String union_id){
		return studentDao.getStuUnionStus(union_id);
	}
	
	/**
	 * 解析学生信息表 对表中数据进行的验证
	 * 2016-5-28
	 */
	public Map<String, Object> validateStuExcel(List<Student> s,String class_id) {
		// 对学生表的数据验证编号是否重复
		List<String> codeList = new ArrayList();// 声明集合，存储学生编号，为了验证表格中的学生编号是否重复。
		List<String> idcardList = new ArrayList();// 声明集合，存储学生身份证号，为了验证表格中的学生身份证号是否重复。
		List<String> classidList = new ArrayList();// 声明集合，存储表格中班级编号，为得到每个班级的人数。
		String infor = "";// 声明变量，存储表格中未按要求的信息存储。
		String information = "";// 声明information，得到各班级个数。
		/*
		 * String email=
		 * "\\p{Alpha}\\w{2,15}[@][a-z0-9]{3,}[.]\\p{Lower}{2,}"
		 * ;可以以后验证邮箱 if (email.matches(format)){return true;//
		 * 邮箱名合法，返回true }else{ return false;// 邮箱名不合法，返回fals }}
		 */int b;
		int c;
		// int d;
		// int cc;
		// 表格的数据验证
		for (Student student : s) {
			String stuCode = student.getStu_code();
			String id_card = student.getId_card();
			b = this.selectByStuCode(stuCode);
			c = this.selectByStuCard(id_card);
			if (student.getStu_code() == null) {
				infor = infor + "学号不能为空,";
			} else if (b != 0) {
				infor = "学号在数据库有重复,";
			} else if (student.getStu_code().substring(0, 4).equals(student.getEntry_year())) {
			} else {
				infor = infor + "入学年份和学号不对应,";
			}
			;
			if (student.getTrue_name() == null) {
				infor = infor + "姓名不能为空";
			}
			if (student.getSex() == null) {
				infor = infor + "性别不能为空,";
			} else if (student.getSex().equals("男") || student.getSex().equals("女")) {

			} else {
				infor = infor + "亲，人只有男女之分奥！,";
			}
			;
			if (student.getId_card() == null) {
				infor = infor + "身份证号不能为空,";
			} else if (student.getId_card().length() != 18) {
				infor = infor + "身份证号应为18位,";
			} else if (student.getId_card()
					.substring(student.getId_card().length() - 3, student.getId_card().length())
					.equals("000")) {
				infor = infor + "此身份证号有误,最后三位不能同时为'0'";
			} else if (c != 0) {
				infor = infor + "身份证号在数据库有重复,";
			}
			;
			if (student.getPhone() == null) {// boolean isNum =
												// str.matches("[0-9]+");
				infor = infor + "手机号不能为空,";
			} else if (student.getPhone().length() == 11 && student.getPhone().matches("[0-9]+")) {

			} else {
				infor = infor + "手机号只能为数字（长度为11位）！,";
			}
			if (codeList.size() != 0) {
				infor = infor + Common.isCodeExist(student.getStu_code(), codeList, "学生编号");
			}
			;
			if (idcardList.size() != 0) {
				infor = infor + Common.isCodeExist(student.getId_card(), idcardList, "学生身份证编号");
			}
			;
			if (infor.trim().equals("")) {
				infor = "无";
			}
			student.setTemp1(infor.trim());
			infor = "";
			classidList.add(class_id);
			if (student.getStu_code() != null) {
				codeList.add(student.getStu_code());
			}
			;
			if (student.getId_card() != null) {
				idcardList.add(student.getId_card());
			}
			;
			// 判断学生编号是否在excel中重复
			String[] co = new String[codeList.size()];
			for (int a = 0; a < codeList.size(); a++) {
				co[a] = codeList.get(a);
			}
			// 判断身份证号是否在excel中重复
			String[] ic = new String[idcardList.size()];
			for (int e = 0; e < idcardList.size(); e++) {
				ic[e] = idcardList.get(e);
			}
			// 声明数组，存储班级id
			String[] ci = new String[classidList.size()];
			for (int g = 0; g < classidList.size(); g++) {
				ci[g] = classidList.get(g);
			}
			information = countArrary(ci);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("information", information);
		map.put("stuList", s);
		
		return map;
	}
	/**
	 * 
	 * 功能：得到excel表格中每个班级的人数信息 by王磊 20150120
	 * 
	 * @param excel中班级id数组
	 */
	public String countArrary(String a[]) {
		String classInformation = "";
		Map<String, Integer> m = new TreeMap<String, Integer>();
		for (int i = 0; i < a.length; i++) {
			Integer c = m.get(a[i]);
			if (c == null) {
				m.put(a[i], new Integer(1));
			} else {
				c = new Integer(c.intValue() + 1);
				m.put(a[i], new Integer(c));
			}
		}
		Set<String> s = m.keySet();
		for (String e : s) {
			Org o = DictionaryService.findOrg(e);
			String name = "错误班级(id:e)";
			if (o != null) {
				classInformation = classInformation + o.getOrg_name() + "， 导入班级人数为：" + m.get(e) + " ";// .getOrg_name()
			} else {
				classInformation = classInformation + name + "， 导入班级人数为：" + m.get(e) + " ";
			}
		}
		return classInformation;
	}
	/**
	 * 修改所选班级所有学生状态为不可用  
	 * 周睿20160606
	 */
	public int deleteAllStuByClassID(String ClassID) {
		return studentDao.deleteAllStuByClassID(ClassID);
	}
	
	/**
	 * 重置学生密码
	 * 
	 * @param String
	 *            id
	 * @return
	 */
	public String resetPassword(String stu_id) {
		Student stu = this.selectByID(stu_id);
		stu.setLogin_pass(stu.getStu_code());
		this.update(stu);
		return "success";
	}
	
	/**
	 * 注销微信账号
	 * 
	 * @param String
	 *            id
	 * @return
	 *//*
	public String resetWx_code(String stu_id) {
		Student stu = this.selectByID(stu_id);
		stu.setWx_code(null);
		this.update(stu);
		return "success";
	}*/
	
	/**
	 * @funciton 根据学生id更新记录（用于注销学生微信号）
	 * @author syj 20160620
	 * @param code
	 * @return
	 */
	public Object updateByStuId(String code) {
		return this.studentDao.updateByStuId(code);
	}
	
}
