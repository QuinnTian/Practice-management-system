package com.sict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.Knowledge;

@Repository
public class KnowledgeDao extends BasicDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Knowledge> findAllKnowledge(String stu_id) {
		List<Knowledge> list = sqlSession.selectList("com.sict.dao.KnowledgeDao.findAllKnowledge", stu_id);
		return list;
	}

	/*
	 * 功能：通过学院id查出学院和学院的系发布的最新20条问题 by王磊20150122
	 */
	public List<Knowledge> ByXyId(String id) {
		List<Knowledge> list = sqlSession.selectList("com.sict.dao.KnowledgeDao.ByXyId", id);
		return list;
	}
	/*
	 * 功能：通过学院id查出学院和学院的系发布的常见问题 by王磊20150121
	 */
	public List<Knowledge> findById(String id) {
		List<Knowledge> list = sqlSession.selectList("com.sict.dao.KnowledgeDao.findByXyId", id);
		return list;
	}
	//功能：根据根据院系，教师id，问题内容，查出问题 by王磊 2015年3月23日 	
	public List<Knowledge> byConditions(String part_Id,String tea_id,String content){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("scope", part_Id);
		map.put("messenger_id", tea_id);
		map.put("content", content);
		List<Knowledge> list =sqlSession.selectList("com.sict.dao.KnowledgeDao.byConditions", map);
		return list;
	}
	//只能过关键字查出院和系的问题详情
	public List<Knowledge> byKey(String college_Id,String content){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("college_Id", college_Id);
		map.put("content", content);
		List<Knowledge> list =sqlSession.selectList("com.sict.dao.KnowledgeDao.byKey", map);
		return list;
	}
	/**
	 * 
	 * @param tea_id
	 * @return
	 * 通过教师id查询专家提问所需要的数据，类型为3，未回答过的问题  邢志武 2015年6月9日 09:17:32
	 */
	public List<Knowledge> getUnAnswerQuestion(String tea_id) {
		List<Knowledge> list = sqlSession.selectList("com.sict.dao.KnowledgeDao.getUnAnswerQuestion", tea_id);
		return list;
	}
	/**
	 * 
	 * @param stu_id
	 * @return
	 * 通过学生id查询专家 某个学生提问的问题，类型为3， 邢志武 2015年6月9日 09:17:32
	 */
	public List<Knowledge> getUnAnswerQuestionForStu(String stu_id) {
		List<Knowledge> list = sqlSession.selectList("com.sict.dao.KnowledgeDao.getUnAnswerQuestionForStu", stu_id);
		return list;
	}
	/**
	 * 
	 * @param kn_id
	 * @return
	 * 根据问题id 返回问题
	 */
	public Knowledge getQustionAnswerByID(String kn_id) {
		Knowledge knowledge = sqlSession.selectOne("com.sict.dao.KnowledgeDao.getQustionAnswerByID", kn_id);
		return knowledge;
	}
	//只能过关键字查出院和系的问题详情
		public List<Knowledge> byWord(String college_Id,String content){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("college_Id", college_Id);
			map.put("content", content);
			List<Knowledge> list =sqlSession.selectList("com.sict.dao.KnowledgeDao.byWord", map);
			return list;
		}
}
