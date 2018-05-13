package com.sict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.PracticeTask;
import com.sict.entity.SummaryQuestionnaire;

@Repository
public class SummaryQuestionnaireDao extends BasicDao<SummaryQuestionnaire> {

	@Autowired
	private SqlSessionTemplate sqlSession;
	/**
	 * 得到到目前为止的总结数量
	 * by吴敬国
	 * 2015-10-10
	 * @param	String year,String secondyear
	 * @return int
	 */
	public int getSummaryCount(String year,String secondyear ,String dpt) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("year", year);
		map.put("dpt", dpt);
		map.put("secondyear", secondyear);
	    int a = sqlSession.selectOne("com.sict.dao.SummaryQuestionnaireDao.getSummaryCount",map);
		return a;
	}
	
	/**
	 * @funcion 通过老师所在部门id和输入的年级查询该学院（包括学校）的实习总结
	 * @param dept_id、year
	 * @edit syj @date 2016-08-31
	 * 
	 */
	public List<SummaryQuestionnaire> selectSummaryByTeaDeptIdAndYear(
			String dept_id, String year) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("year", year);
		map.put("dept_id", dept_id);
		List<SummaryQuestionnaire> a = sqlSession.selectList("com.sict.dao.SummaryQuestionnaireDao.selectSummaryByTeaDeptIdAndYear",map);
		return a;
	}
}
