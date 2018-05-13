package com.sict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.Teacher;
import com.sict.entity.TreeNode;

/*
 * 功能：教师相关的数据库操作
 * 使用 @Repository 注释 TeacherDao
 * by郑春光20140910	 * 
 * 
 * */
@Repository
public class TeacherDao extends BasicDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 功能：查询老师记录,
	 * @param tea_code  
	 * wtt 20141125
	 * @return list<PracticeRecord> 
	 * */
	public List<Teacher> selectListByTeaCode(String tea_code) {
		return sqlSession.selectList("com.sict.dao.TeacherDao.selectListByTeaCode", tea_code);
	}
	public List<TreeNode> selectTeaByOrgId(String org_id) {
	    return sqlSession.selectList("com.sict.dao.TeacherDao.selectTeaByOrgId",org_id);
		
	}
	/**
	 * 功能：根据Dept_id查询老师 by邢志武 20141216
	 * 
	 **/
	public List<Teacher> getTeachersByDeptId(String Dept_id) {
		
		List<Teacher> list = sqlSession.selectList(
				"com.sict.dao.TeacherDao.getTeachersByDeptId", Dept_id);
		return list;
	}
	/**
	 * 功能：通过老师编号判断老师是否已存在 
	 * by王磊 20141226 
	 * by 2016-5-28 注释
	 */
	/*public int selectByTeaCode(String tea_code) {
		int count;
		count = sqlSession.selectOne("com.sict.dao.TeacherDao.selectByTeaCode",tea_code);
		return count;
	}*/
	/**
	 * 功能：根据学院id查出本学院的老师信息
	 * by王磊 20150118
	 * @param	String XyId
	 * @return List<Teacher>
	 * 
	 */
	public List<Teacher> selectListByXyId(String XyId) {
		return sqlSession.selectList("com.sict.dao.TeacherDao.selectByDeptId", XyId);
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
		return sqlSession.selectList("com.sict.dao.TeacherDao.getTeachersByCourse", course);
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
		return sqlSession.selectList("com.sict.dao.TeacherDao.getTeachersByExpertise", expertise);
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
		return sqlSession.selectList("com.sict.dao.TeacherDao.getSpecialityBycollege", college_id);
	}
	public Teacher selectTeacode(String Com_teacher_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.sict.dao.TeacherDao.selectTeacode",Com_teacher_id);
	}
	public String getLoginAndPass(String jiequ) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.sict.dao.TeacherDao.getLoginAndPass",jiequ);
	}
	
	/**
	 * 功能：根据微信名，查询用户； param 用户的微信号 by 邢志武 2015年6月24日 
	 * 
	 **/
	public List<Teacher> selectTeacherByWx(String fromUserName) {
		List<Teacher> list = sqlSession.selectList(
				"com.sict.dao.TeacherDao.selectTeacherByWx", fromUserName);
		return list;
	}
	
	/**
	 * 功能：验证用户输入的信息是否正确 param 学号，姓名，身份证号，密码 String stu_code,String
	 * true_name,String id_card,String login_pass by 邢志武 2015年6月24日 
	 * 
	 **/

	public List<Teacher> isTeacher(String tea_code, String true_name, String login_pass) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("tea_code", tea_code);
		param.put("true_name", true_name);
		param.put("login_pass", login_pass);
		List<Teacher> list = sqlSession.selectList("com.sict.dao.TeacherDao.isTeacherByMap", param);
		return list;
	}
	/***
	 * 绑定微信号与学生账号 邢志武 2015年6月24日 20:38:24
	 * 
	 * @param stu_code
	 * @return
	 */
	public void teacherBind(String wx_code, String id) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("wx_code", wx_code);
		param.put("id", id);

		sqlSession.update("com.sict.dao.TeacherDao.teacherBind", param);
	}
	/**
	 * 
	 * @param tea_id
	 * @return
	 * 根据老师的id查询都有什么权限 
	 * 邢志武 
	 * 2015年7月10日 08:57:01
	 */
	public List<String> getTea_role(String tea_id) {
		List<String> list = sqlSession.selectList("com.sict.dao.TeacherDao.getTea_role", tea_id);
		return list;
	}
	
	public List<Teacher> selectByWx(String fromUserName) {
		List<Teacher> list = sqlSession.selectList("com.sict.dao.TeacherDao.selectTeacherByWx", fromUserName);
		return list;
	}
	/*
	 * 功能： 根据學生的id 獲得老師的id
	 * author：楊夢曉
	 * time：2016-03-04
	 * */
	public String selectTeaByStuId(String stuId){
		String teaId = sqlSession.selectOne("com.sict.dao.TeacherDao.selectTeaByStuID", stuId);
		
		return teaId;
		
	}
	/**
	 * 学院管理员根据姓名或者教工号查询教师 by周睿 20160527
	 * 
	 **/
	public List<Teacher> getTeachersByNameOrCode(Map<String, Object> map) {
		
		List<Teacher> list = sqlSession.selectList(
				"com.sict.dao.TeacherDao.getTeachersByNameOrCode", map);
		return list;
	}
	
	/**
	 * 系统管理员根据姓名或者教工号查询教师 by周睿 20160527
	 * 
	 **/
	public List<Teacher> sysAdminGetTeachersByNameOrCode(String name) {
		
		List<Teacher> list = sqlSession.selectList(
				"com.sict.dao.TeacherDao.sysAdminGetTeachersByNameOrCode", name);
		return list;
	}
	
	
}
