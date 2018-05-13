package com.sict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.GroupMembers;
import com.sict.entity.Groups;
import com.sict.entity.PracticeTask;

@Repository
public class GroupsDao extends BasicDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String className = getClass().getName();
	public String namespace = className;
	public String getPractice_id(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getPractice_ids",user_id);
	}
	/**
	 * 功能：查询用户分组的实训 id getPractice_ids byccc20141212*
	 * @param String user_id
	 * @return List<Groups>
	 * */
	public  List<Groups> selectPractice_code(String id) {
		return sqlSession.selectList(
				"com.sict.dao.GroupsDao.getPractice_ids", id);
	}
	
	
	/**
	 * 功能：根据老师部门id获得同部门老师创建的小组  by吴敬国20141123*
	 * @param dept_id
	 * @return List<Groups>
	 *
     */
	public  List<Groups> getGroupsByDeptId(String dept_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(
				"com.sict.dao.GroupsDao.getGroupsByDeptId", dept_id);
	}
	/**
	 * 功能：根据老师的id获取到相应的小组： by吴敬国20141123*
	 * @param tea_id
	 * @return List<Groups>
	 *
     */
	public  List<Groups> getGroupsByTeaId(String tea_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.sict.dao.GroupsDao.getGroupsByTeaId", tea_id);
	}
	
	/**
	 * 2015-01-29 邢志武 根据部门id 查询该部门的所有小组（系过滤）
	 * @param dept_id
	 * @return
	 */
	public  List<Groups> selectGroupsBydept_id(String dept_id,String grade) {
		// TODO Auto-generated method stub
		Map<String, String> p=new HashMap<String, String>();
		p.put("dept_id", dept_id);
		p.put("grade", grade);
		return sqlSession.selectList(
				"com.sict.dao.GroupsDao.selectGroupsBydept_id", p);
		}
	
	/**
	 * 
	 * @param tea_id
	 * @param grade
	 * @return 该老师负责的小组 
	 * 2015年5月10日 11:37:23 邢志武
	 */
	public  List<Groups> selectGroupsByTea_idAndGrade(String tea_id,String grade) {
		// TODO Auto-generated method stub
		Map<String, String> p=new HashMap<String, String>();
		p.put("tea_id", tea_id);
		p.put("grade", grade);
		return sqlSession.selectList(
				"com.sict.dao.GroupsDao.selectGroupsByTea_idAndGrade", p);
		}
	
	/**
	 * 
	 * @param pra_id
	 * @return 根据实践任务id获取小组id 邢志武 2015-03-26
	 */
	public  List<String> getGroupId(String pra_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(
				"com.sict.dao.GroupsDao.getGroupId", pra_id);
		}
	/**
	 * 根据praid查询是否有小组  
	 * bywjg
	 * 2015-03-25
	 * @param task_name
	 * @return String (任务名称)
	 */
	public int selectCountByPraid(String pra_id) {
		int count;
		count = sqlSession.selectOne("com.sict.dao.GroupsDao.selectCountByPraid",pra_id);
		return count;
	}
	
	public int selectCountByGroup_name(String group_name) {
		int count;
		count = sqlSession.selectOne("com.sict.dao.GroupsDao.selectCountByGroup_name",group_name);
		return count;
	}
	/**
	 * 根据实习任务id和学生id查询实习分组
	 * @param praid
	 * @param stu_id
	 * @return Groups
	 * 2015年6月21日
	 * 楚晨晨
	 */
	public Groups getGroupByPracIdAndStuId(String praid, String stu_id) {
		// TODO Auto-generated method stub
		Map<String, String> p=new HashMap<String, String>();
		p.put("praid", praid);
		p.put("stu_id", stu_id);
		return sqlSession.selectOne(
				"com.sict.dao.GroupsDao.getGroupByPracIdAndStuId", p);
	}
	
}
