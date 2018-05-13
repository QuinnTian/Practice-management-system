package com.sict.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.UserDao;
import com.sict.entity.Org;
import com.sict.entity.PracticeTask;
import com.sict.entity.SummaryQnAnswer;
import com.sict.entity.User;

@Repository(value = "userService")
@Transactional
public class UserService implements BasicService<User> {
	@Autowired
	private UserDao userDao;
	@Resource(name = "orgService")
	private OrgService orgService;
	@Resource(name = "practiceTaskService")
	private PracticeTaskService practiceTaskService ;


	public List<User> selectList(User user) {
		// TODO Auto-generated method stub
		List<User> users = this.userDao.selectList(user);
		for (User u : users) {
			u = this.getUserOtherInfo(user);
		}
		return users;
	}

	/**
	 * 此功能禁用
	 */
	public User insert(User user) {
		// TODO Auto-generated method stub
		return null;
	}


	
	
	
	/**
	 * 此功能禁用
	 */
	public int update(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * 此功能禁用
	 */
	public int delete(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	public User selectByID(String id) {
		// TODO Auto-generated method stub
		User user = this.userDao.selectByID(id);
		if(user != null){
			return getUserOtherInfo(user);
		}else{
			return null;
		}
		 
	}

	/**
	 * 此功能禁用
	 */
	public User insertOrUpdate(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectCount(User user) {
		// TODO Auto-generated method stub
		return this.selectCount(user);
	}

	
	public User getUserOtherInfo(User user){
		Org org = (Org) orgService.selectByID(user.getOrg_id());
		if(org!=null){
			user.setClass_name(org.getOrg_name());
		}
		return user;
	}
	/**
	 * 2015年5月7日 15:10:37
	 * @param tea_id
	 * @param users
	 * @return 查询回答此次总结的学生list
	 */
	public List<User> selectBySummaryQnAnswer(SummaryQnAnswer summaryQnAnswer){
		return userDao.selectBySummaryQnAnswer(summaryQnAnswer);
	}
	
	/**
	 * 2015年5月7日 15:10:37
	 * @param tea_id
	 * @param users
	 * @return 得到当前老师所带的学生的月总结
	 */
	public List<User> getTrueUsers (String tea_id,List<User> users){
		//根据教师id查询校外实习 by邢志武 
		List<PracticeTask> pts=practiceTaskService.selectOutSchoolPracticeTasks(tea_id);
		//根据实践任务id 查询该老师负责的所有校外实习的学生id
		List<String> allStu_ids=practiceTaskService.selectAllOutSchoolStusId(tea_id);
		List<String> allStu_code=new ArrayList<String>();
		for(int j=0;j<allStu_ids.size();j++){
			String stu_id=allStu_ids.get(j);
			String  stu_code=DictionaryService.findStudent(stu_id).getStu_code();
			allStu_code.add(stu_code);
		}
		List<User> trueUsers=new ArrayList<User>();
		for(int i=0;i<users.size();i++){
			User u=users.get(i);
			String userCode=u.getS_t_code();
			//判断该学生是否是该老师负责
			 boolean b = allStu_code.contains(userCode);
			 if(b){
				 trueUsers.add(u);
			 }else{
				 System.out.println("不是该教师所负责的学生！");
			 }
			
		}
		return trueUsers;
	}
	
	
}
