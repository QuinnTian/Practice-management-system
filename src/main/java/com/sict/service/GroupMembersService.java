package com.sict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.GroupMembersDao;
import com.sict.entity.GroupMembers;
import com.sict.entity.Student;

/**
 * 功能：..相关的service 使用 @Repository 注释 groupMemberDao byccc20141128 *
 * 
 * */
@Repository(value = "groupMembersService")
@Transactional
public class GroupMembersService implements BasicService {
	@Autowired
	GroupMembersDao groupMembersDao;
	public List selectList(Object o) {
		return groupMembersDao.selectList(o);
	}

	public Object insert(Object o) {
		GroupMembers g=(GroupMembers) o;
		DictionaryService.updateGroupMembers(g);
		groupMembersDao.insert(o);
		
		return null;
	}

	public int update(Object o) {
		GroupMembers g=(GroupMembers) o;
		DictionaryService.updateGroupMembers(g);
		return groupMembersDao.update(g);
	}

	public int delete(Object o) {
		return 0;
	}

	public Object selectByID(String id) {
		// TODO Auto-generated method stub
		return null;
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
	   * 根据实践任务的id查询这个任务对应小组的小组成员（学生）的所有信息  返回的是学生 跟下面吴敬国的方法有点重复
	   * by 王磊
	   * 2015-2-9
	   * @param	String Practice_id
	   * @return List<GroupMembers>
	   */
	public List<GroupMembers> studentsList(String Practice_id) {
		return groupMembersDao.selectGroupMemberListByPraTaskId(Practice_id);
	
	}
	/**
	 * 功能：根据实践教学任务的id获得小组成员的学生的id  
	 * by吴敬国20141123*
	 * @param practice_id
	 * @return List<GroupMembers>
	 * 备注：和上面的方法有点重复，抽时间修改
     */
	public List<GroupMembers> selectStuIdListByPracticeId(String practice_id) {
		return groupMembersDao.selectStuIdListByPracticeId(practice_id);
	}
	/**
	 * 功能：根据教师的id获得小组成员的学生的id   
	 * byccc20141215*
	 * @param tea_id
	 * @return List<GroupMembers>
	 * 没有方法调用
	 *
     */
	public List<GroupMembers>  selectBytea_id(String tea_id) {
		return groupMembersDao.selectBytea_id(tea_id);
	}
	/**
	 * 功能：根据小组的id获得小组的成员信息   
	 * by吴敬国20141216*
	 * @param group_id
	 * @return List<GroupMembers>
	 *
     */
	public List<GroupMembers> selectGroupMembersByGroupId(String group_id) {
		return groupMembersDao.selectGroupMembersByGroupId(group_id);
	}

	/**
	 * 功能：根据group_id 删除小组成员    
	 * by邢志武20150120*
	 * @param group_id
	 * 
	 *
     */
	public void deleteByGroup_id(String group_id){
		groupMembersDao.deleteByGroup_id(group_id);		
	}
	
	/**
	 * 根据小组的id获得小组成员表的id    
	 * by邢志武2015-01-24 
	 * @param group_id
	 * @return List<String>
	 * 备注：和selectGroupMembersByGroupId方法重复，03-25 吴敬国
     */
	public List<String> selectGroupMembersIdByGroupId(String group_id) {
		return groupMembersDao.selectGroupMembersIdByGroupId(group_id);
	}
	
	/**
	 * 根据小组的id获得小组中学生的idList  
	 * by邢志武2015-01-25 
	 *
     */
	public List<String> selectGroupMembersStuIdByGroupId(String group_id) {
		return groupMembersDao.selectGroupMembersStuIdByGroupId(group_id);
	}
	/**
	 * 根据小组的id获得小组中学生的数量
	 * @param group_id
	 * @return int 学生的数量
	 */
	public int getStudentsSize(String group_id) {
		return groupMembersDao.getStudentsSize(group_id);
	}
	
	/**
	 * 查询所有全校所有实习生的数量
	 * @param group_id
	 * @return int 学生的数量
	 */
	public int getSchoolStudentsSize(String grade){
		return groupMembersDao.getSchoolStudentsSize(grade);
	}
	
	/**
	 * 根据小组的id获得小组中老师的数量
	 * @param group_id
	 * @return int 老师的数量
	 */
	
	public int getTeachersSize(String group_id) {
		return groupMembersDao.getTeachersSize(group_id);
	}
	/**
	   * 根据实践任务的id查询这个任务对应小组的小组成员（学生）的所有信息  返回的是学生 跟上面王磊的方法有点重复
	   * by 吴敬国
	   * 2015-4-8
	   * @param	String Practice_id
	   * @return List<Student>
	   */
	public List<Student> getStuListByPraId(String Practice_id) {
		return groupMembersDao.getStuListByPraId(Practice_id);
	}
	/**
	 * 根据user_id获取分组  by 李达 2016-07-18
	 */
	public GroupMembers selectByUser_id (String user_id){
		return groupMembersDao.selectByUser_id(user_id);
	}
}
