package com.sict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.Invitation;
import com.sict.util.Common;


@SuppressWarnings("unused")
@Repository
public class InvitationDao extends BasicDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	/**
	 * 根据类型查询置顶帖
	 * @param type
	 * @return
	 */
	public List<Invitation> selectTapInvititons(String type) {
		List<Invitation> list = sqlSession.selectList("com.sict.dao.InvitationDao.selectTapInvititons",type);
		return list;
	}
	
	/**
	 * 根据类型查询主题帖（title不为空）
	 * @param type
	 * @return
	 */
	public List<Invitation> selectParentInvititons(String type) {
		List<Invitation> list = sqlSession.selectList("com.sict.dao.InvitationDao.selectParentInvititons",type);
		return list;
	}
	/**
	 * 根据id查询主题帖回复
	 * @param id
	 * @return
	 */
	public List<Invitation> selectSonInvititons(String id) {
		List<Invitation> list = sqlSession.selectList("com.sict.dao.InvitationDao.selectSonInvititons",id);
		return list;
	}
	/**
	 * 查询单个人的主题 
	 * @param id
	 * @return
	 */
	public List<Invitation> selcetPersonInvititons(String id) {
		List<Invitation> list = sqlSession.selectList("com.sict.dao.InvitationDao.selcetPersonInvititons",id);
		return list;
	}
	
	/**
	 * 查询主题回复数量 
	 * @param id
	 * @return
	 */
	public int selcetPerCount(String id) {
		int  count = sqlSession.selectOne("com.sict.dao.InvitationDao.selcetPerCount",id);
		return count;
	}
	
	/**
	 * 根据起始页实现分页功能查看
	 * @param 
	 * @return
	 */
	public List<Invitation> getPageDate(int startPage, int endPage ,String type) {
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("type", Integer.parseInt(type));
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		List<Invitation> list = sqlSession.selectList("com.sict.dao.InvitationDao.getPageDate",map);
		return list;
	}
	/**
	 * 根据主贴id查询参与的人员
	 * @param Inid
	 * @return
	 */
	public List<String> getUserIdByinId(String Inid) {
		List<String> list = sqlSession.selectList("com.sict.dao.InvitationDao.getUserIdByinId",Inid);
		return list;
	}
}
