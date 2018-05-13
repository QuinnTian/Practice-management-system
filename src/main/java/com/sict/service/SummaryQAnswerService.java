package com.sict.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.SummaryQAnswerDao;
import com.sict.entity.SummaryQAnswer;
import com.sict.util.Common;

@Repository(value = "summaryQAnswerService")
@Transactional
public class SummaryQAnswerService implements BasicService<SummaryQAnswer> {
	@Autowired
	private SummaryQAnswerDao summaryQAnswerDao;

	public List<SummaryQAnswer> selectList(SummaryQAnswer t) {
		// TODO Auto-generated method stub
		return summaryQAnswerDao.selectList(t);
	}
	public SummaryQAnswer selectsummaryQAnswer(SummaryQAnswer t) {
		// TODO Auto-generated method stub
		List<SummaryQAnswer> list = summaryQAnswerDao.selectList(t);
		if(list.size() > 0){
			return list.get(0);
		}else{
			return null;
		}
	}

	public SummaryQAnswer insert(SummaryQAnswer t) {
		// TODO Auto-generated method stub
		t.setId(Common.returnUUID());
		int i = this.summaryQAnswerDao.insert(t);
		if (i > 0) {
			return t;
		} else {
			return null;
		}
	}

	public int update(SummaryQAnswer t) {
		// TODO Auto-generated method stub
		return this.summaryQAnswerDao.update(t);
	}

	public int delete(SummaryQAnswer t) {
		// TODO Auto-generated method stub
		return this.summaryQAnswerDao.delete(t);
	}

	public SummaryQAnswer selectByID(String id) {
		// TODO Auto-generated method stub
		return this.summaryQAnswerDao.selectByID(id);
	}

	public SummaryQAnswer insertOrUpdate(SummaryQAnswer oto) {
		// TODO Auto-generated method stub
		if ("".equals(oto.getId()) || oto.getId() == null) {
			return insert(oto);
		} else {
			int num = (Integer) update(oto);
			if(num >= 1){
				return oto;
			}else{
				return null;
			}
		}
	}

	public int selectCount(SummaryQAnswer t) {
		// TODO Auto-generated method stub
		return this.summaryQAnswerDao.selectCount(t);
	}
	
	/**
	 * 根据问题的id获取选项列表
	 * @param q_id
	 * @return
	 */
	public List<SummaryQAnswer> getOptionListByQuestion_ID(String q_id){
		
		SummaryQAnswer summaryQAnswer = new SummaryQAnswer();
		summaryQAnswer.setQuestion_id(q_id);
		return this.summaryQAnswerDao.selectList(summaryQAnswer);
		
	}
	
	
	public int selectCountByQuestion_ID(String q_id){
		SummaryQAnswer summaryQAnswer = new SummaryQAnswer();
		summaryQAnswer.setQuestion_id(q_id);
		return this.summaryQAnswerDao.selectCount(summaryQAnswer);
	}
	
	public int deleteBySummaryQnAnswer_ID(String summaryQnAnswerID){
		
		SummaryQAnswer summaryQAnswer = new SummaryQAnswer();
		summaryQAnswer.setQnanswer_id(summaryQnAnswerID);
		return this.summaryQAnswerDao.delete(summaryQAnswer);
		
	}

	/**
	 * 根据总结id 查询题目答案 按班级
	 * @param id
	 * @return
	 */
	public List<Map<String, String>> selectAnswerbyQuestionId(String id){
		return this.summaryQAnswerDao.selectAnswerbyQuestionId(id);
	}

}
