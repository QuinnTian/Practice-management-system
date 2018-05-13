package com.sict.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.OnlineTestQAnswerDao;
import com.sict.entity.OnlineTestQAnswer;
import com.sict.util.Common;

@Repository(value = "onlineTestQAnswerService")
@Transactional
public class OnlineTestQAnswerService implements BasicService<OnlineTestQAnswer> {
	@Autowired
	private OnlineTestQAnswerDao otQAnswerDao;

	public List<OnlineTestQAnswer> selectList(OnlineTestQAnswer t) {
		// TODO Auto-generated method stub
		return otQAnswerDao.selectList(t);
	}
	public OnlineTestQAnswer selectOTQAnswer(OnlineTestQAnswer t) {
		// TODO Auto-generated method stub
		List<OnlineTestQAnswer> list = otQAnswerDao.selectList(t);
		if(list.size() > 0){
			return list.get(0);
		}else{
			return null;
		}
	}

	public OnlineTestQAnswer insert(OnlineTestQAnswer t) {
		// TODO Auto-generated method stub
		t.setId(Common.returnUUID());
		int i = this.otQAnswerDao.insert(t);
		if (i > 0) {
			return t;
		} else {
			return null;
		}
	}

	public int update(OnlineTestQAnswer t) {
		// TODO Auto-generated method stub
		return this.otQAnswerDao.update(t);
	}

	public int delete(OnlineTestQAnswer t) {
		// TODO Auto-generated method stub
		return this.otQAnswerDao.delete(t);
	}

	public OnlineTestQAnswer selectByID(String id) {
		// TODO Auto-generated method stub
		return this.otQAnswerDao.selectByID(id);
	}

	public OnlineTestQAnswer insertOrUpdate(OnlineTestQAnswer oto) {
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

	public int selectCount(OnlineTestQAnswer t) {
		// TODO Auto-generated method stub
		return this.otQAnswerDao.selectCount(t);
	}
	
	/**
	 * 根据问题的id获取选项列表
	 * @param q_id
	 * @return
	 */
	public List<OnlineTestQAnswer> getOptionListByQuestion_ID(String q_id){
		
		OnlineTestQAnswer otQAnswer = new OnlineTestQAnswer();
		otQAnswer.setQuestion_id(q_id);
		return this.otQAnswerDao.selectList(otQAnswer);
		
	}
	
	
	public int selectCountByQuestion_ID(String q_id){
		OnlineTestQAnswer otQAnswer = new OnlineTestQAnswer();
		otQAnswer.setQuestion_id(q_id);
		return this.otQAnswerDao.selectCount(otQAnswer);
	}

	
	public String sumValidityByQnAnswerID(String qnanswer_id){
		int validity = this.otQAnswerDao.sumValidityByQnAnswerID(qnanswer_id);
		return String.valueOf(validity);
	}
	
	public String sumScoreByQnAnswerID(String qnanswer_id){
		int score = this.otQAnswerDao.sumScoreByQnAnswerID(qnanswer_id);
		return String.valueOf(score);
	}
	
	public int deleteByotQnAnswer_ID(String otQnAnswer_ID){
		
		return this.otQAnswerDao.deleteByotQnAnswer_ID(otQnAnswer_ID);
		
	}
	public int sumScoreByQuestionType(String questionType,String qnanswerID){
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("questionType", questionType);
		map.put("qnanswerID", qnanswerID);
		return otQAnswerDao.sumScoreByQuestionType(map);
	}

}
