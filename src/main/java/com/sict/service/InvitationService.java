package com.sict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.dao.InvitationDao;
import com.sict.entity.Invitation;

@Repository(value = "invitationService")
public class InvitationService implements BasicService {

	@Autowired
	InvitationDao  invitationDao;

	public List selectList(Object t) {
		return this.invitationDao.selectList(t);
	}

	public Object insert(Object t) {
		// TODO Auto-generated method stub
		return this.invitationDao.insert(t);
	}

	public int update(Object t) {
		// TODO Auto-generated method stub
		return this.invitationDao.update(t);
	}

	public int delete(Object t) {
		// TODO Auto-generated method stub
		return this.invitationDao.delete(t);
	}

	public Object insertOrUpdate(Object t) {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectCount(Object t) {
		// TODO Auto-generated method stub
		return this.invitationDao.selectCount(t);
	}

	public Object selectByID(String id) {
		// TODO Auto-generated method stub
		return this.invitationDao.selectByID(id);
	}
	/**
	 * 根据类型查询主题帖（title不为空）
	 * @param type
	 * @return
	 */
	public List<Invitation> selectParentInvititons(String type) {
		return this.invitationDao.selectParentInvititons(type);
	}
	
	/**
	 * 根据类型查询置顶帖前两条
	 * @param type
	 * @return
	 */
	public List<Invitation> selectTapInvititons(String type) {
		return this.invitationDao.selectTapInvititons(type);
	}
	/**
	 * 根据id查询主题帖回复
	 * @param id
	 * @return
	 */
	public List<Invitation> selectSonInvititons(String id) {
		return this.invitationDao.selectSonInvititons(id);
	}
	
	/**
	 * 查询单个人的主题 
	 * @param id
	 * @return
	 */
	public List<Invitation> selcetPersonInvititons(String id) {
		return this.invitationDao.selcetPersonInvititons(id);
	}
	/**
	 * 查询主题回复数量 
	 * @param id
	 * @return
	 */
	public int selcetPerCount(String id) {
		return this.invitationDao.selcetPerCount(id);
	}
	/**
	 * 根据起始页实现分页功能查看
	 * @param 
	 * @return
	 */
	public List<Invitation> getPageDate(int startPage, int endPage,String type) {
		return this.invitationDao.getPageDate(startPage,endPage, type);
	}
	
	public List<String> getUserIdByinId(String inId) {
		return this.invitationDao.getUserIdByinId(inId);
	}
}
