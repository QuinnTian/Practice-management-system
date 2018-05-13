package com.sict.service;

import java.util.ArrayList;
import java.util.List;





import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.OnlineTestQAnswerDao;
import com.sict.dao.SummaryQnAnswerDao;
import com.sict.entity.OnlineTestQAnswer;
import com.sict.entity.SummaryQnAnswer;
import com.sict.entity.SummaryQuestion;
import com.sict.util.Common;

@Repository(value = "summaryQnAnswerService")
@Transactional
public class SummaryQnAnswerService implements BasicService<SummaryQnAnswer> {
	@Autowired
	private SummaryQnAnswerDao summaryQnAnswerDao;
	@Resource(name = "summaryQAnswerService")
	private SummaryQAnswerService summaryQAnswerService;

	public List<SummaryQnAnswer> selectList(SummaryQnAnswer t) {
		// TODO Auto-generated method stub
		return summaryQnAnswerDao.selectList(t);
	}

	public SummaryQnAnswer insert(SummaryQnAnswer t) {
		// TODO Auto-generated method stub
		t.setId(Common.returnUUID());
		int i = this.summaryQnAnswerDao.insert(t);
		if (i > 0) {
			return t;
		} else {
			return null;
		}
	}

	public int update(SummaryQnAnswer t) {
		// TODO Auto-generated method stub
		return summaryQnAnswerDao.update(t);
	}

	public int delete(SummaryQnAnswer t) {
		// TODO Auto-generated method stub
		int num = summaryQnAnswerDao.delete(t);
		if(num > 0){
			summaryQAnswerService.deleteBySummaryQnAnswer_ID(t.getId());
		}
		return num;
	}

	public SummaryQnAnswer selectByID(String id) {
		// TODO Auto-generated method stub
		return summaryQnAnswerDao.selectByID(id);
	}
	
	public SummaryQnAnswer selectByQnAnswer(SummaryQnAnswer summaryQnAnswer) {
		// TODO Auto-generated method stub
		List<SummaryQnAnswer> summaryQnAnswers = this.selectList(summaryQnAnswer);
		if(summaryQnAnswers.size() > 0){
			return summaryQnAnswers.get(0);
		}else{
			return null;
		}
	}

	public SummaryQnAnswer insertOrUpdate(SummaryQnAnswer t) {
		// TODO Auto-generated method stub
		if ("".equals(t.getId()) || t.getId() == null) {
			return insert(t);
		} else {
			int num = update(t);
			if(num >= 1){
				return t;
			}else{
				return null;
			}
		}
	}

	public int selectCount(SummaryQnAnswer t) {
		// TODO Auto-generated method stub
		return summaryQnAnswerDao.selectCount(t);
	}
	
	/**
	 * 根据测验id和用户id查询一个总结测验的信息
	 * @param cy_id
	 * @param user_id
	 * @return
	 */
	public SummaryQnAnswer selectByQuestionnaireIDAndUserID(String summaryID,String userID){
		SummaryQnAnswer summaryQnAnswer = new SummaryQnAnswer();
		summaryQnAnswer.setQuestionnaire_id(summaryID);;
		summaryQnAnswer.setUser_id(userID);
		List<SummaryQnAnswer> summaryQnAnswers = this.selectList(summaryQnAnswer);
		if(summaryQnAnswers.size()>0){
			summaryQnAnswer = summaryQnAnswers.get(0);
		}
		return summaryQnAnswer;
	}
	
	
	public List<Map<String, Object>> selectQuestionAndAnanswerBySummaryQnAnswerID(String summaryQnAnswerID){
		List<Map<String, Object>> newList=new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> oldList=summaryQnAnswerDao.selectQuestionAndAnanswerBySummaryQnAnswerID(summaryQnAnswerID);
		for(int i = 0; i < oldList.size(); i++){
			Map<String, Object> map = oldList.get(i);
			if(SummaryQuestion.TYPE_TEXT.contains(map.get("type").toString())){
				newList.add(0, map);
				oldList.remove(i);
			}
			
		}
		oldList.addAll(newList);
		return oldList;
	}
	public int selectCommitCountBySummaryID(String summaryID,String practiceId) {
		// TODO Auto-generated method stub
		SummaryQnAnswer sq = new SummaryQnAnswer();
		sq.setQuestionnaire_id(summaryID);
		sq.setPracticeTasksID(practiceId);
		return summaryQnAnswerDao.selectCountWhereEndDateisnotnull(sq);
	}
	
	
}
