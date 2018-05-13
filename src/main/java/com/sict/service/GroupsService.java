package com.sict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.GroupsDao;
import com.sict.dao.PracticeTaskDao;
import com.sict.entity.Groups;
import com.sict.entity.PracticeTask;
import com.sict.util.Common;
@Repository(value="groupsService")
@Transactional
public class GroupsService implements BasicService{
	@Autowired
	GroupsDao groupsDao;
	@Autowired
	PracticeTaskDao practiceTaskDao;
	public List<Groups> selectList(Object o) {
		// TODO Auto-generated method stub
		return groupsDao.selectList(o);
	}

	public Groups insert(Groups g) {
		int a = 0;
		g.setId(Common.returnUUID());
		a=groupsDao.insert(g);
		DictionaryService.updateGroups(g);
		DictionaryService.updateGroupsNameByName(g);
		return g;
	}

	public int update(Object o) {
		int a = 0;
		Groups g= (Groups) o;
		a = groupsDao.update(g);
		DictionaryService.updateGroups(g);
		DictionaryService.updateGroupsNameByName(g);
		return a;
	}

	public int delete(Object o) {
		int a = 0;
		Groups g= (Groups) o;
		a = groupsDao.delete(g);
		DictionaryService.deleteGroups(g.getId());
		DictionaryService.deleteGroupsNameByName(g.getGroup_name());
		return a;
	}

	public Object selectByID(String id) {
		// TODO Auto-generated method stub
		return groupsDao.selectByID(id);
	}

	public Object insertOrUpdate(Object o) {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectCount(Object o) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	/**
	 * 功能：根据老师部门id获得同部门老师创建的实践任务  by吴敬国20141123*
	 * @param dept_id
	 * @return List<PracticeTask>
	 *
          */

        public List<PracticeTask> getPracticeTasksByDeptId(String dept_id) {
		// TODO Auto-generated method stub
		return practiceTaskDao.getPracticeTasksByDeptId(dept_id);
	}
	/**
	 * 功能：根据老师部门id获得同部门老师创建的小组  by吴敬国20141123*
	 * @param dept_id
	 * @return List<Groups>
	 *
     */
	public List<Groups> getGroupsByDeptId(String dept_id) {
		// TODO Auto-generated method stub
		return groupsDao.getGroupsByDeptId(dept_id);
	}
	/**
	 * 功能：根据老师的id获取到相应的小组： by吴敬国20141123*
	 * @param tea_id
	 * @return List<Groups>
	 *
     */
	public List<Groups> getGroupsByTeaId(String tea_id) {
		// TODO Auto-generated method stub
		return groupsDao.getGroupsByTeaId(tea_id);
	}
	/**
	 * 功能：根据学生的id  关联实践任务表，小组表，小组成员表
	 * 和实践任务service中的getPraByStuId方法重复，所以先不用
	 * 得到有多少实习任务： by楚晨晨20141123*
	 * @param tea_id
	 * @return List<Groups>
	 * 此方法暂时不用
     */
	public List<Groups> selectPractice_code(String id) {
		// TODO Auto-generated method stub
		return groupsDao.selectPractice_code(id);
	}
	
	/**
	 * 2015-01-29 邢志武 根据部门id 查询该部门所有的小组（过滤系） 
	 * @param dept_id
	 * @return
	 */
	public List<Groups> selectGroupsBydept_id(String dept_id,String grade) {
		// TODO Auto-generated method stub
		return groupsDao.selectGroupsBydept_id(dept_id,grade);
	}
	/**
	 * 
	 * @param tea_id
	 * @param grade
	 * @return 该老师负责的小组 
	 * 2015年5月10日 11:37:23 邢志武
	 */
	public List<Groups> selectGroupsByTea_idAndGrade(String tea_id,String grade) {
		// TODO Auto-generated method stub
		return groupsDao.selectGroupsByTea_idAndGrade(tea_id,grade);
	}

	public Object insert(Object t) {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 
	 * @param pra_id
	 * @return 根据实践任务id获取小组id 邢志武 2015-03-26
	 */
	public List<String> getGroupId(String pra_id) {
		// TODO Auto-generated method stub
		return groupsDao.getGroupId(pra_id);
	}
	/**
	 * 根据praid查询是否有小组
	 * by吴敬国 2015-03-25
	 * 
	 * @param practice_id
	 * @return String (学生id)
	 */
	public int selectCountByPraid(String pra_id) {
		int a;
		a = groupsDao.selectCountByPraid(pra_id);
		return a;
	}
	/**
	 * 根据praid查询是否有小组
	 * by吴敬国 2015-03-25
	 * 
	 * @param practice_id
	 * @return String (学生id)
	 */
	public Groups selectGroupsByPraid(String pra_id) {
		Groups g=new Groups();
		g.setPractice_id(pra_id);
		g=(Groups) groupsDao.selectList(g).get(0);
		return g;
	}
	
	/**
	 * 
	 * @param group_name
	 * @return 验证小组名是否重复
	 */
	public int selectCountByGroup_name(String group_name) {
		int g;
		g=groupsDao.selectCountByGroup_name(group_name);
		return g;
	}
	
}
	
	
	
	

