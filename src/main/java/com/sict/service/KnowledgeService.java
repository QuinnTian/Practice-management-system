package com.sict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.KnowledgeDao;
import com.sict.entity.Knowledge;
import com.sict.util.Common;

/**
 * 功能：常见问题相关的service 使用 @Repository 注释 OrgDao by郑春光20140910 *
 * 
 * */
@Repository(value = "knowledgeService")
@Transactional
public class KnowledgeService implements BasicService {

	@Autowired
	KnowledgeDao knowledgeDao;

	public List selectList(Object o) {
		Knowledge k = (Knowledge) o;
		return knowledgeDao.selectList(k);
	}

	public Object insert(Object o) {
		Knowledge s = (Knowledge) o;
		s.setId(Common.returnUUID());
		return knowledgeDao.insert(s);
	}

	public int update(Object o) {
		return knowledgeDao.update(o);
	}

	public int delete(Object o) {
		return knowledgeDao.delete(o);
	}

	public Object selectByID(String id) {
		return this.knowledgeDao.selectByID(id);
	}

	public Object insertOrUpdate(Object o) {
		return this.knowledgeDao.insert(knowledgeDao);
	}

	public int selectCount(Object o) {
		return this.knowledgeDao.selectCount(o);
	}

	public Object selectById(String id) {
		return this.knowledgeDao.selectByID(id);
	}
	/**
	 * 功能：通过学院id查出学院和学院的系发布的最新20条问题
	 * by王磊20150122
	 * 
	 * */
	public List<Knowledge> ByXyId(String id){
		return this.knowledgeDao.ByXyId(id);
	}

	/**
	 * 功能：通过学院id查出学院和学院的系发布的常见问题  没有调用
	 * by王磊20150121
	 *   吴敬国 2015-7-6
	 * */
	public List<Knowledge> findById(String id){
		return this.knowledgeDao.findById(id);
	}
	/**
	 * 功能：根据根据院系，教师id，问题内容，查出问题
	 * by王磊 2015年3月23日
	 * 
	 * */
	public List<Knowledge> byConditions(String part_Id, String tea_id,
			String content) {
		return this.knowledgeDao.byConditions(part_Id, tea_id, content);
	}
	/**
	 * 功能：只能过关键字查出院和系的问题详情
	 * by王磊 2015年3月23日
	 * 
	 * */
	public List<Knowledge> byKey(String college_Id, String content) {
		return this.knowledgeDao.byKey(college_Id, content);
	}

	/**
	 * 根据教师id查询等待回复的类型为3 的问题 即专家提问问题
	 * @param tea_id
	 * @return  邢志武 2015年6月9日 09:21:03
	 */
	public List<Knowledge> getUnAnswerQuestion(String tea_id) {
		return this.knowledgeDao.getUnAnswerQuestion(tea_id);
	}

	/**
	 * 微信
	 * @param kn_id
	 * @return 查询问题
	 */
	public Knowledge getQustionAnswerByID(String kn_id) {
		return this.knowledgeDao.getQustionAnswerByID(kn_id);
	}
	/**
	 * 功能：只能过关键字查出院和系的问题详情
	 * bylxb 20160308
	 * 
	 * */
	public List<Knowledge> byWord(String college_Id, String content) {
		return this.knowledgeDao.byWord(college_Id, content);
	}


}
