package com.sict.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.GroupMembers;
import com.sict.entity.Student;

/*
 * 功能：毕业论文相关的数据库操作
 * 使用 @Repository 注释GroupMemberDao
 * by ccc 20140923	 * 
 */
@Repository
public class GroupMembersDao extends BasicDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	String className = getClass().getName();
	public String namespace = className;
	/**
	   * 根据实践任务的id查询这个任务对应小组的小组成员（学生）的所有信息
	   * by 王磊
	   * 2015-2-9
	   * @param	String Practice_id
	   * @return List<GroupMembers>
	   */
	public List<GroupMembers> selectGroupMemberListByPraTaskId(String Practice_id){
		return sqlSession.selectList(
				"com.sict.dao.GroupMembersDao.selectGroupMemberListByPraTaskId", Practice_id);
	}
	/**
	 * 功能：根据实践教学任务的id获得小组成员的学生的id   by吴敬国20141123*
	 * @param practice_id
	 * @return List<String>
	 *  
     */
	public List<GroupMembers> selectStuIdListByPracticeId(String practice_id){
		return sqlSession.selectList(
				"com.sict.dao.GroupMembersDao.selectStuIdListByPracticeId", practice_id);
	}
	/**
	 * 功能：根据教师id查询负责小组的的小组学生id 
	 * byccc20141215*
	 * @param tea_id
	 * @return List<String>
	 *
     */
	public List<GroupMembers>  selectBytea_id(String tea_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(
				"com.sict.dao.GroupMembersDao.selectBytea_id", tea_id);
	}
	/**
	 * 功能：根据小组的id获得小组的成员信息   
	 * by吴敬国20141216*
	 * @param group_id
	 * @return List<GroupMembers>
	 *
     */
	public List<GroupMembers> selectGroupMembersByGroupId(String group_id){
		return sqlSession.selectList(
				"com.sict.dao.GroupMembersDao.selectGroupMembersByGroupId", group_id);
	}
	
	
	/**
	 * 功能：根据group_id 删除小组成员 
	 * by邢志武20150120*
	 * @param group_id
	 * 
	 *
     */
	public void deleteByGroup_id(String group_id){
		 sqlSession.delete("com.sict.dao.GroupMembersDao.deleteByGroup_id", group_id);
				
	}
	
	/**
	 * 	<!-- 根据小组的id获得小组的id    by邢志武2015-01-24 -->
	 * @param group_id
	 * @return List<GroupMembers>
	 *
     */
	public List<String> selectGroupMembersIdByGroupId(String group_id){
		return sqlSession.selectList(
				"com.sict.dao.GroupMembersDao.selectGroupMembersIdByGroupId", group_id);
	}
	
	
	/**
	 * 根据小组的id获得小组中学生的idList   
	 * by邢志武2015-01-25
	 *
     */
	public List<String> selectGroupMembersStuIdByGroupId(String group_id){
		return sqlSession.selectList(
				"com.sict.dao.GroupMembersDao.selectGroupMembersStuIdByGroupId", group_id);
	}
	
	/**
	 * 根据小组的id获得小组中学生的数量
	 * @param group_id
	 * @return int 学生的数量
	 */
	public int getStudentsSize(String group_id){
		
		int i=sqlSession.selectOne(
				"com.sict.dao.GroupMembersDao.getStudentsSize", group_id);
		return  i;
	}
	
	/**
	 * 查询所有全校所有实习生的数量
	 * @param group_id
	 * @return int 学生的数量
	 */
	public int getSchoolStudentsSize(String grade){
		int i=sqlSession.selectOne("com.sict.dao.GroupMembersDao.getSchoolStudentsSize", grade);
		return  i;
	}
	/**
	 * 根据小组的id获得小组中老师的数量
	 * @param group_id
	 * @return int 老师的数量
	 */
	public int getTeachersSize(String group_id){
		return sqlSession.selectOne(
				"com.sict.dao.GroupMembersDao.getTeachersSize", group_id);
	}
	/**
	   * 根据实践任务的id查询这个任务对应小组的小组成员（学生）的所有信息  返回的是学生 跟上面王磊的方法有点重复
	   * by 吴敬国
	   * 2015-4-8
	   * @param	String Practice_id
	   * @return List<Student>
	   */
	public List<Student> getStuListByPraId(String Practice_id){
		return sqlSession.selectList("com.sict.dao.GroupMembersDao.getStuListByPraId", Practice_id);
	}	
	/**
	 * 根据user_id获取分组  by 李达 2016-07-18
	 */
	public GroupMembers selectByUser_id (String user_id){
		return sqlSession.selectOne("com.sict.dao.GroupMembersDao.selectByUser_id",user_id);
	}
}
