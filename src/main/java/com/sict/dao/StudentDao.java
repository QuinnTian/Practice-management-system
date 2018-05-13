package com.sict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.sict.entity.ReportStuCompany;
import com.sict.entity.StuGraStateCount;
import com.sict.entity.Student;

/**
 * 功能：学生相关的数据库操作 使用 @Repository 注释 StudentDao by吴敬国20140917 *
 * 
 * */
@Repository@Qualifier("studentDao")
public class StudentDao extends BasicDao<Student> {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Student> getAllStudents() {
		List<Student> list = sqlSession
				.selectList("com.sict.dao.StudentDao.selectAllStudents");
		return list;
	}

	/**
	 * 功能：根据微信名，查询用户； param 用户的微信号 by 孟凡朕 20140917
	 * 
	 **/

	public List<Student> selectByWx(String fromUserName) {
		List<Student> list = sqlSession.selectList(
				"com.sict.dao.StudentDao.studentByWx", fromUserName);
		return list;
	}

	/**
	 * 功能：验证用户输入的信息是否正确 param 学号，姓名，身份证号，密码 String stu_code,String
	 * true_name,String id_card,String login_pass by 孟凡朕 20140917
	 * 
	 **/

	public List<Student> isStudent(String stu_code, String true_name,
			String id_card, String login_pass) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("stu_code", stu_code);
		param.put("true_name", true_name);
		param.put("id_card", id_card);
		param.put("login_pass", login_pass);

		List<Student> list = sqlSession.selectList(
				"com.sict.dao.StudentDao.isStudentByMap", param);

		return list;
	}

	/***
	 * 绑定微信号与学生账号 by孟凡朕 20140917
	 * 
	 * @param stu_code
	 * @return
	 */
	public void studentBind(String wx_code, String id) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("wx_code", wx_code);
		param.put("id", id);
		
		sqlSession.update("com.sict.dao.StudentDao.studentBind", param);
	}

	public String getStu_id(String stu_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getStu_id", stu_id);
	}

	public String getStu_idBywx(String wx_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getStu_idBywx", wx_code);
	}

	/**
	 * 功能：根据微信名，查询用户； param 用户的微信号 by 孟凡朕 20140917
	 * 
	 **/

	public List<Student> selectByWxc(String fromUserName) {
		List<Student> list = sqlSession.selectList(
				"com.sict.dao.StudentDao.studentByWxc", fromUserName);
		return list;
	}

	public String selectBytea_id(String tea_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getStu_idBywx", tea_id);
	}

	// 查询个人资料 by ccc 2014/12/21
	public Student selectStuByStu_id(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".selectByID", id);
	}

	public int updatePersonal(Student stu) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + ".updatePersonal", stu);
	}

	

	/**
	 * 功能：根据class_id查询学生 by邢志武 20141216
	 * 
	 **/
	public List<Student> getStudentsByClassId(String class_id) {
		List<Student> list = sqlSession.selectList("com.sict.dao.StudentDao.getStudentsByClassId", class_id);
		return list;
	}

	public int updatePractice(Student stu) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + ".updatePractice", stu);
	}

	public int updateLastPlace(Student sd) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + ".updateLastPlace", sd);
	}

	/*
	 * 功能：通过学生编号判断学生是否已存在 by王磊 20150117
	 */
	public int selectByStuCode(String stu_code) {
		int count;
		count = sqlSession.selectOne("com.sict.dao.StudentDao.selectByStuCode",
				stu_code);
		return count;
	}

	/*
	 * 功能：通过学生身份号判断学生是否已存在 by王磊 20150117
	 */
	public int selectByStuCard(String id_card) {
		int count;
		count = sqlSession.selectOne("com.sict.dao.StudentDao.selectByStuCard",
				id_card);
		return count;
	}

	/*
	 * 功能：通过院部id查出全员的学生20150118
	 */
	public List<Student> selectStudentsByYuanId(String id) {

		return sqlSession.selectList(
				"com.sict.dao.StudentDao.getStudentsByYuanId", id);

	}

	public Student selectByID(String id) {

		return sqlSession.selectOne("com.sict.dao.StudentDao.selectByID", id);

	}

	public Student ByID(String id) {

		return sqlSession.selectOne("com.sict.dao.StudentDao.selectByID", id);

	}

	/**
	 * 
	 * 功能：得到全校实习任务学生各实习状态的人数
	 * 
	 * @param grade
	 * @author by 郑春光 2015年2月3日
	 * @return
	 */

	public List<Map<String, Object>> getSchoolStudentStateCountByGrade(
			String grade) {

		return sqlSession.selectList(
				"com.sict.dao.StudentDao.getSchoolStudentStateCountByGrade",
				grade);

	}
	
	
	/**
	 * 功能：得到学院或系的实习任务学生各实习状态的人数
	 * 
	 * @param 年级
	 *            、学院id或系id
	 * @author by 郑春光 2015年2月3日
	 * @return
	 */

	public List<StuGraStateCount> getStuStateCountByGradeAndOrg(
			Map<String, Object> map) {
		return sqlSession.selectList(
				"com.sict.dao.StudentDao.getStuStateCountByGradeAndOrg", map);

	}
	
	/**
	 * 功能：得到系的实习任务学生各实习状态的人数
	 * 
	 * @param 年级
	 *  学院id或系id
	 * @author by 郑春光 2015年2月3日
	 * @return
	 */

	public List<StuGraStateCount> getXiStuStateCountByGradeAndOrg(
			Map<String, Object> map) {
		return sqlSession.selectList(
				"com.sict.dao.StudentDao.getXiStuStateCountByGradeAndOrg", map);

	}

	/**
	 * 功能：得到教师带的实习学生各实习状态的人数，用于饼图
	 * 
	 * @param 年级
	 *            、教师id
	 * @author by 郑春光 2015-2-9
	 * @return
	 */

	public List<Map<String, Object>> getStuStateCountByGradeAndTeaId(
			Map<String, Object> map) {
		return sqlSession.selectList(
				"com.sict.dao.StudentDao.getStuStateCountByGradeAndTeaId", map);

	}
	/**
	 * <!-- 功能：得到教师带的实习学生各实习状态的学生详情 -->
	 * @param map
	 * @return
	 */
	public List<Student> getStusByGradeAndTeaIdAndState(
			Map<String, Object> map) {
		return sqlSession.selectList("com.sict.dao.StudentDao.getStusByGradeAndTeaIdAndState", map);

	}

	public int selectCountByID(String id) {
		return sqlSession.selectOne("com.sict.dao.StudentDao.selectCountByID",
				id);
	}
	/**
	 *功能：查询数据库中学生的入学的年份集合
	 *2015年4月7日
	 *by王磊 
	 * 
	 * */
	public List<String> getYears(){
		return sqlSession.selectList("com.sict.dao.StudentDao.getYears");
	}
	/**
	 * 功能：通过学生学号查出其对应的id
	 * by ：王磊
	 * 2015年4月17日
	 * 
	 */
	public String getStudentId(String stuCode){
		return sqlSession.selectOne("com.sict.dao.StudentDao.getId", stuCode);
	}
	/**
	 * 功能：通过学生姓名或学号 模糊查询出对应的id
	 * by ：李秋林
	 * 2016年1月18日
	 * 
	 */
	public List<Student> getStudentIdByNameOrCode(Map<String, String> map){
		
		List<Student> list = sqlSession.selectList(
				"com.sict.dao.StudentDao.getStudentIdByNameOrId", map);

		return list;
	}
	/**
	 * 功能：通过学生姓名 查出其对应的id
	 * by ：李秋林
	 * 2016年1月17日
	 * 
	 */

/*	public void studentBind(String wx_code, String id) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("wx_code", wx_code);
		param.put("id", id);
		
		sqlSession.update("com.sict.dao.StudentDao.studentBind", param);
	}*/
	public List<Student> getStudentIdByName(String stuName){
		return sqlSession.selectList("com.sict.dao.StudentDao.selectByName", stuName);
	}
	/**
	 * 功能：通过班级查询这个班级有没有学生
	 * by ：吴敬国
	 * 2015年5月29日
	 * 
	 */
	public int selectCountByClassId(String class_id){
		return sqlSession.selectOne("com.sict.dao.StudentDao.selectCountByClassId", class_id);
	}
	/**
	 * 功能：通过实习任务id得到所对应的学生 
	 *  by吴敬国 2015-6-12
	 */
	public List<Student> getStuByPracticeTaskId(String practice_id){
		return sqlSession.selectList("com.sict.dao.StudentDao.getStuByPracticeTaskId", practice_id);
	}
	/*
	 * 得到教师带的实习学生某种实习状态的人数，用于饼图 参数：年级、老师id,状态
	 */
	public int getStateStuCount(Map<String, Object> map){
		int count;
		try {
			count= sqlSession.selectOne("com.sict.dao.StudentDao.getStateStuCount", map);
		} catch (Exception e) {
			count=0;
		}
		
		return count;
	}
	
	/**
	 * 功能：查询某系某个签到学生的所有信息
	 * by ：WuGee
	 * 2015年9月23日 
	 */
	public Student getDepartmentSinStusMes(Map<String, Object> map){
		return sqlSession.selectOne("com.sict.dao.StudentDao.getDepartmentSinStusMes", map);
	}
	/**
	 * 功能：查询某个系的所有学生
	 * by ：WuGee
	 * 2015年9月23日 
	 */
	public List<Student> getDepartmentStus(Map<String, Object> map){
		return sqlSession.selectList("com.sict.dao.StudentDao.getDepartmentStus", map);
	}
	/**
	 * 功能：根据学生年级得到该年级中所有学生的公司情况
	 * 吴敬国
	 * 2015-9-26
	 **/
	public List<ReportStuCompany> getStuCompanyReport(String year) {
		List<ReportStuCompany> list = sqlSession.selectList("com.sict.dao.StudentDao.getStuCompanyReport", year);
		return list;
	}
	/**
	 * 功能：根据学生会部门id查找此学生会所有学生
	 * by 李达、师杰
	 *  20160302
	 */
	public List<Student> getStuUnionStus(String union_id) {
		List<Student> list = sqlSession.selectList("com.sict.dao.StudentDao.getStuUnionStus", union_id);
		return list;
	}
	/**
	 * 修改所选班级所有学生状态为不可用  
	 * 周睿20160606
	 */
	public int deleteAllStuByClassID(String ClassID) {
		int a = sqlSession.update("com.sict.dao.StudentDao.deleteAllStuByClassID", ClassID);
		return a;
	}
}
