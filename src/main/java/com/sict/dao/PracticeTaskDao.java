package com.sict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.PracticeTask;

/**
 * 功能：学生相关的数据库操作 使用 @Repository 注释 practiceTaskDao by ccc 20141014 *
 * 
 * */
@Repository
public class PracticeTaskDao extends BasicDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 查询task_type为1的所有实践任务 by郑春光20140910
	 * 
	 * */
	public List<PracticeTask> selectAllPracticeTasks() {
		List<PracticeTask> list = sqlSession
				.selectList("com.sict.dao.PracticeTaskDao.selectAllPracticeTasks");
		return list;
	}
	/**
	 * 根据任务编号查询任务名称
	 * by楚晨晨
	 * 20141105
	 * @param	String practice_id
	 * @return List<PracticeTask>
	 */
	public List<PracticeTask> selectTask_name(String practice_id) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("practice_id", practice_id);
		List<PracticeTask> list = sqlSession.selectList(
				"com.sict.dao.PracticeTaskDao.selectTask_name", param);
		return list;
	}

	/**
	 * 根据教师id查询实训任务 bywjg20141105
	 * 
	 * *//*
	public List<PracticeTask> selectPracticeTasks() {
		List<PracticeTask> list = sqlSession
				.selectList("com.sict.dao.PracticeTaskDao.selectPracticeTasks");
		return list;
	}*/

	/**
	 * 根据id更新状态
	 * by吴敬国
	 * 2015-03-13
	 * @param	String tea_id,String grade
	 * @return List<PracticeTask>
	 */
	public int updateState(String id) {
		return sqlSession
				.update("com.sict.dao.PracticeTaskDao.updateState", id);
	}

	/**
	 * 教师 根据教师id和年级和实习任务id查询核对信息任务列表
	 * by吴敬国
	 * 2015-03-13
	 * @param	String tea_id,String grade,String praID
	 * @return List<PracticeTask>
	 */
	public List<PracticeTask> selectCheckInfoListByTeaIdAndGrade(String tea_id,String grade,String praID) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tea_id", tea_id);
		map.put("grade", grade);
		map.put("praID", praID);
		List<PracticeTask> list = sqlSession.selectList("com.sict.dao.PracticeTaskDao.selectCheckInfoListByTeaIdAndGrade",map);
		return list;
	}

	/**
	 * 管理员根据部门id获得该部门的实习或实训任务 
	 * by吴敬国
	 * 2015-03-13
	 * @param	String dept_id
	 * @return List<PracticeTask>
	 */
	public List<PracticeTask> getPracticeTasksByDeptId(String dept_id) {
		List<PracticeTask> list = sqlSession.selectList("com.sict.dao.PracticeTaskDao.getPracticeTasksByDeptId",dept_id);
		return list;
	}

	/**
	 * 分数统计 
	 * bylfb
	 * 2015-03-13
	 * @param	String tea_id
	 * @return List<String>
	 */
	public List<Map<String, String>> getPracticeScoreList(String practice_id) {
		return sqlSession.selectList("com.sict.dao.PracticeTaskDao.getPracticeScoreList",practice_id);
	}

	/**
	 * 管理员 根据年份和部门id(包括学院和系) 任务类型 (实习，实训)获得实践任务
	 * by吴敬国
	 * 2015-03-13
	 * @param	String dept_id, String grade, String task_type
	 * @return List<PracticeTask>
	 */
	public List<PracticeTask> selectPracticeTasksByDeptIdAndGrade(
			String dept_id, String grade, String task_type) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("dept_id", dept_id);
		param.put("grade", grade);
		param.put("task_type", task_type);
		List<PracticeTask> list = sqlSession.selectList("com.sict.dao.PracticeTaskDao.selectPracticeTasksByDeptIdAndGrade",param);
		return list;
	}

	/**
	 * 查询实践任务中已经有的年级 
	 * by邢志武
	 * 2015-03-13
	 * @param	
	 * @return List<PracticeTask>
	 */
	public List<PracticeTask> getPracticeTasksGrade() {
		List<PracticeTask> list = sqlSession.selectList("com.sict.dao.PracticeTaskDao.getPracticeTasksGrade");
		return list;
	}

	/**
	 * 查询实践任务
	 * by邢志武 
	 * 2015-03-13
	 * @param	String grade, String dept_id
	 * @return List<PracticeTask>
	 */
	public List<PracticeTask> getPracticeTasksGradeByGradeAndDept_id(String grade, String dept_id) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("grade", grade);
		param.put("dept_id", dept_id);
		List<PracticeTask> list = sqlSession.selectList("com.sict.dao.PracticeTaskDao.getPracticeTasksGradeByGradeAndDept_id",param);
		return list;
	}
	/**
	 * @param grade
	 * @param tea_id
	 * @return该老师负责的实践任务实训任务 邢志武 
	 * 2015年5月10日 14:12:38
	 */
	public List<PracticeTask> getPracticeTasksGradeByGradeAndTea_id(String grade, String tea_id) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("grade", grade);
		param.put("tea_id", tea_id);
		List<PracticeTask> list = sqlSession.selectList("com.sict.dao.PracticeTaskDao.getPracticeTasksGradeByGradeAndTea_id",param);
		return list;
	}
	/**
	 * 根据本人的实践任务id选出实践任务
	 * byccc
	 * 2015-03-13
	 * @param	String praid
	 * @return PracticeTask
	 */
	public PracticeTask selectonlyMe(String praid) {
		return sqlSession.selectOne("com.sict.dao.PracticeTaskDao.selectonlyMe", praid);
	}
	/**
	 * 根据本人的多个实训任务选出集合
	 * byccc
	 * 2015-03-13
	 * @param	String praid
	 * @return List<PracticeTask>
	 */
	public List<PracticeTask> selectPracticeTasksPd(String praid) {
		List<PracticeTask> list = sqlSession.selectList("com.sict.dao.PracticeTaskDao.selectonlyMe", praid);
		return list;
	}

	/**
	 * 教师  根据教师id和入学年份获得实习任务
	 * by吴敬国   
	 * 2015-03-13
	 * 2015-6-11  暂时不用此方法
	 * @param	String tea_id,int grade
	 * @return List<PracticeTask>
	 */
	public List<PracticeTask> getPracticeTasksByGradeAndTea_id(String tea_id,int grade) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("tea_id", tea_id);
		param.put("grade", grade);
		List<PracticeTask> list = sqlSession.selectList("com.sict.dao.PracticeTaskDao.getPracticeTasksByGradeAndTea_id",param);
		return list;
	}

	/**
	 * 查询实践任务
	 * by邢志武 
	 * 2015-03-13
	 * @param	String tea_id,String year
	 * @return List<PracticeTask>
	 */
	public List<PracticeTask> getPracticeTasksBytea_id(String tea_id,String year) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("tea_id", tea_id);
		param.put("year", year);
		List<PracticeTask> list = sqlSession.selectList("com.sict.dao.PracticeTaskDao.getPracticeTasksBytea_id",param);
		return list;
	}
	/**
	 * 查询校外实践任务
	 * by邢志武 
	 * 2015年6月3日 19:28:04
	 * @param	String tea_id,String year
	 * @return List<PracticeTask>
	 */
	public List<PracticeTask> getOutPracticeTasksBytea_id(String tea_id,String year) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("tea_id", tea_id);
		param.put("year", year);
		List<PracticeTask> list = sqlSession.selectList("com.sict.dao.PracticeTaskDao.getOutPracticeTasksBytea_id",param);
		return list;
	}
	/**
	 * 根据实践任务id 查询小组成员id（学生） 邢志武 2015-01-24
	 * by邢志武 
	 * @param	String id,String year
	 * @return List<String>
	 */
	public List<String> getGroupMembersBypId(String id,String year) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		param.put("year", year);
		List<String> list = sqlSession.selectList(
				"com.sict.dao.PracticeTaskDao.getGroupMembersBypId", param);
		return list;
	}
	/**
	 * 查出编号最大的一条信息核对记录 
	 * byccc
	 * 2015-03-13
	 * @param	
	 * @return 
	 */
	public String getMaxpracticeCode(){
		String code;
		code=sqlSession.selectOne("com.sict.dao.PracticeTaskDao.maxpracticeCode");
		return code;
	}
	
	
	/**
	 * 根据教师id查询校外实习 
	 * by邢志武
	 * 2015-03-13
	 * @param	
	 * @return 
	 */
	public List<PracticeTask> selectOutSchoolPracticeTasks(String tea_id) {
		List<PracticeTask> list = sqlSession.selectList("com.sict.dao.PracticeTaskDao.selectOutSchoolPracticeTasks",tea_id);
		return list;
	}
	
	/**
	 * 根据实践任务id 查询学生id
	 * by邢志武
	 * 2015-03-13
	 * @param	
	 * @return 
	 */
	public List<String> selectStusId(String practice_id) {
		List<String> list = sqlSession.selectList("com.sict.dao.PracticeTaskDao.selectStusId",practice_id);
		return list;
	}
	/**
	 * 根据实践任务id 查询学生id
	 * by吴敬国
	 * rq3
	 * @param	
	 * @return 
	 */
	public List<String> selectStusIdByPractice(String practice_id) {
		List<String> list = sqlSession.selectList("com.sict.dao.PracticeTaskDao.selectStusIdByPractice",practice_id);
		return list;
	}
	/**
	 * 根据实践任务id 查询该组学生从未签到过的学生 
	 * by邢志武
	 * 2015-03-12
	 * @param practice_id
	 * @return String (学生id)
	 */
	public List<String> getUnSinStusIdByPk_id(String practice_id) {
		List<String> list = sqlSession.selectList("com.sict.dao.PracticeTaskDao.getUnSinStusIdByPk_id",practice_id);
		return list;
	}
	/**
	 * 
	 * @param practice_id
	 * @param grade
	 * @return 查询各系校外实习任务id 参数（系id,年级 ) 邢志武 2015-03-26
	 */
	public List<String> getPracTaskIdByOrgIdAndGrade(String org_id,String grade) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("org_id", org_id);
		map.put("grade", grade);
		List<String> list = sqlSession.selectList("com.sict.dao.PracticeTaskDao.getPracTaskIdByOrgIdAndGrade",map);
		return list;
	}
	
	/**
	 * 查出编号最大的一条实践任务
	 * bywjg
	 * 2015-03-25
	 * @param task_name
	 * @return String (任务名称)
	 */
	public String maxPraCode(String pra_code){
		String code;
		code=sqlSession.selectOne("com.sict.dao.PracticeTaskDao.maxPraCode",pra_code);
		return code;
	}
	/**
	 * 根据学生的id得到这个学生有多少的实习任务
	 * bywjg
	 * 2015-04-6
	 * @param task_name
	 * @return List<PracticeTask>
	 */
	public List<PracticeTask> getTaskByStuIdAndType(String stu_id,String task_type){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stu_id", stu_id);
		map.put("task_type", task_type);
		return sqlSession.selectList("com.sict.dao.PracticeTaskDao.getPraByStuId",map);
	}
	/**
	 * 查询校内实训    wjg 检查 2015-6-16 没有调用方法  暂时保留
	 * by ccc
	 * @param String practice_id
	 * @return List<PracticeTask>
	 */
	public List<PracticeTask> selectPracticeTasksType(String practice_id) {
		List<PracticeTask> list = sqlSession.selectList("com.sict.dao.PracticeTaskDao.selectPracticeTasksType",practice_id);
		return list;
	}
	
	/**
	 * 根据实践任务id 查询该老师负责的所有校外实习的学生id
	 * by邢志武
	 * 2015年5月7日 
	 * @param	
	 * @return 
	 */
	public List<String> selectAllOutSchoolStusId(String tea_id) {
		List<String> list = sqlSession.selectList("com.sict.dao.PracticeTaskDao.selectAllOutSchoolStusId",tea_id);
		return list;
	}
	
	/**
	 * @author 王磊
	 * 2015年5月14日
	 * @param 教师id	
	 * @return 教师所对应的任务年级集合
	 */
	public List<String> getGrades(String tea_id){
		return sqlSession.selectList("com.sict.dao.PracticeTaskDao.gradeList", tea_id);
		
	}
	/**
	 * 根据教师的id 获得实习任务id    
	 * by sl 
     */  
	/*public List<String> SelectPracticetaskByTeaid(String tea_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.sict.dao.PracticeTaskDao.SelectPracticetaskByTeaid", tea_id);
	}*/
	public List<String> SelectStuidByPracticetaskid(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.sict.dao.PracticeTaskDao.SelectStuidByPracticetaskid", id);
	}
	/**
	 * 根据本人的实践任务id选出实践任务
	 * byccc
	 * 2015-06-19
	 * @param	String praid
	 * @return PracticeTask
	 */
	public List<PracticeTask> selectPracticeTasksBypt(String user_id) {
		return sqlSession.selectList("com.sict.dao.PracticeTaskDao.selectPracticeTasksBypt", user_id);
	}
	/**
	   *功能：通过学生id查出该学生是否已有实习任务。
	   *日期：2015年6月20日
	   * @param	String stu_id
	   * @return int
	   */
	public int getCount(String stu_id){
		return sqlSession.selectOne("com.sict.dao.PracticeTaskDao.getCheck", stu_id);
	}
	public PracticeTask selectonlyMeById(String praid, String stu_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("praid", praid);
		map.put("stu_id", stu_id);
		return sqlSession.selectOne("com.sict.dao.PracticeTaskDao.selectonlyMeById", map);
	}

	/**
	 * 
	 * @param org_id
	 * @param grade
	 * @return
	 * 通过系id查询老师id（以学生为本，用于考核系指标）
	 */
	public List<String> selectTeaIdbyDempartId(String org_id, String grade) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("org_id", org_id);
		map.put("grade", grade);
		return sqlSession.selectList("com.sict.dao.PracticeTaskDao.selectTeaIdbyDempartId", map);
	}
	/** 
	 * 通过实践任务id，起，始时间，当前月份，查询出该老师当月合格实习人数 
	 *(合格实习人数以学生上传实习月总结并且老师已批阅的数量为准)
	 * @param map
	 * @return
	 */
	public double getTeacherMouthCount(Map<String, String> map) {
		return sqlSession.selectOne("com.sict.dao.PracticeTaskDao.getTeacherMouthCount", map);
	}
	
	public List<String> getTeaIdByScope(String org_id) {
		return sqlSession.selectList("com.sict.dao.PracticeTaskDao.getTeaIdbyScope", org_id);
	}
	/**
	   *功能：任务名称查询id
	   *日期：2016年4月14日
	   * @param	zhr
	   */
	public String getIdByName(String task_name){
		return sqlSession.selectOne("com.sict.dao.PracticeTaskDao.getIdByName", task_name);
	}
}
