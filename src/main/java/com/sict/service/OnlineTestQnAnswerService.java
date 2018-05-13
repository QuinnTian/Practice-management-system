package com.sict.service;

import java.util.List;





import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.OnlineTestQAnswerDao;
import com.sict.dao.OnlineTestQnAnswerDao;
import com.sict.entity.OnlineTestQAnswer;
import com.sict.entity.OnlineTestQnAnswer;
import com.sict.util.Common;

@Repository(value = "onlineTestQnAnswerService")
@Transactional
public class OnlineTestQnAnswerService implements BasicService<OnlineTestQnAnswer> {
	@Autowired
	private OnlineTestQnAnswerDao otQnAnswerDao;
	@Resource(name = "onlineTestQAnswerService")
	private OnlineTestQAnswerService otQAnswerService;

	public List<OnlineTestQnAnswer> selectList(OnlineTestQnAnswer t) {
		// TODO Auto-generated method stub
		return otQnAnswerDao.selectList(t);
	}

	public OnlineTestQnAnswer insert(OnlineTestQnAnswer t) {
		// TODO Auto-generated method stub
		t.setId(Common.returnUUID());
		int i = this.otQnAnswerDao.insert(t);
		if (i > 0) {
			return t;
		} else {
			return null;
		}
	}

	public int update(OnlineTestQnAnswer t) {
		// TODO Auto-generated method stub
		return otQnAnswerDao.update(t);
	}

	public int delete(OnlineTestQnAnswer t) {
		// TODO Auto-generated method stub
		int num = otQnAnswerDao.delete(t);
		if(num > 0){
			otQAnswerService.deleteByotQnAnswer_ID(t.getId());
		}
		return num;
	}

	public OnlineTestQnAnswer selectByID(String id) {
		// TODO Auto-generated method stub
		return otQnAnswerDao.selectByID(id);
	}

	public OnlineTestQnAnswer insertOrUpdate(OnlineTestQnAnswer t) {
		// TODO Auto-generated method stub
		if ("".equals(t.getId()) || t.getId() == null) {
			return insert(t);
		} else {
			int num = (Integer) update(t);
			if(num >= 1){
				return t;
			}else{
				return null;
			}
		}
	}

	public int selectCount(OnlineTestQnAnswer t) {
		// TODO Auto-generated method stub
		return otQnAnswerDao.selectCount(t);
	}
	
	/**
	 * 根据测验id和用户id查询一个回答测验的信息
	 * @param cy_id
	 * @param user_id
	 * @return
	 */
	public OnlineTestQnAnswer selectByQuestionnaireIDAndUserID(String cy_id,String user_id){
		OnlineTestQnAnswer otQnAnswer = new OnlineTestQnAnswer();
		otQnAnswer.setQuestionnaire_id(cy_id);;
		otQnAnswer.setUser_id(user_id);
		List<OnlineTestQnAnswer> otQnAnswers = this.selectList(otQnAnswer);
		if(otQnAnswers.size()>0){
			otQnAnswer = otQnAnswers.get(0);
		}
		return otQnAnswer;
	}
	
	
	
}
