package com.sict.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.OnlineTestOptionDao;
import com.sict.dao.OnlineTestQuestionnaireDao;
import com.sict.entity.OnlineTestOption;
import com.sict.entity.OnlineTestQuestion;
import com.sict.entity.OnlineTestQuestionnaire;
import com.sict.util.Common;

@Repository(value = "onlineTestOptionService")
@Transactional
public class OnlineTestOptionService implements BasicService<OnlineTestOption> {
	@Autowired
	private OnlineTestOptionDao otOptionDao;

	public List<OnlineTestOption> selectList(OnlineTestOption t) {
		// TODO Auto-generated method stub
		return otOptionDao.selectList(t);
	}

	public OnlineTestOption insert(OnlineTestOption oto) {
		// TODO Auto-generated method stub
		oto.setId(Common.returnUUID());
		int i = this.otOptionDao.insert(oto);
		if (i > 0) {
			return oto;
		} else {
			return null;
		}
	}

	public int update(OnlineTestOption t) {
		// TODO Auto-generated method stub
		return this.otOptionDao.update(t);
	}

	public int delete(OnlineTestOption t) {
		// TODO Auto-generated method stub
		return this.otOptionDao.delete(t);
	}

	public OnlineTestOption selectByID(String id) {
		// TODO Auto-generated method stub
		return this.otOptionDao.selectByID(id);
	}

	public OnlineTestOption insertOrUpdate(OnlineTestOption oto) {
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

	public int selectCount(OnlineTestOption t) {
		// TODO Auto-generated method stub
		return this.otOptionDao.selectCount(t);
	}
	
	/**
	 * 根据问题的id获取选项列表
	 * @param q_id
	 * @return
	 */
	public List<OnlineTestOption> getOptionListByQuestion_ID(String q_id){
		
		OnlineTestOption otOption = new OnlineTestOption();
		otOption.setQuestion_id(q_id);
		return this.otOptionDao.selectList(otOption);
		
	}
	
	/**
	 * 根据问题的ID获取一共有多少选项
	 * @param q_id
	 * @return
	 */
	public int selectCountByQuestion_ID(String q_id){
		OnlineTestOption otOption = new OnlineTestOption();
		otOption.setQuestion_id(q_id);
		return this.otOptionDao.selectCount(otOption);
	}
	
	
	/**
	 * 获取所有问题的选项
	 * @param list
	 * @return
	 */
	public List<OnlineTestQuestion> getAllOptionByQuestions(List<OnlineTestQuestion> list_question){
		
		for (int i = 0; i < list_question.size(); i++) {
			
			OnlineTestQuestion otQuestion = list_question.get(i);
			otQuestion.setOnlineTestOptions(this.getOptionListByQuestion_ID(otQuestion.getId()));
			list_question.set(i, otQuestion);
			
		}
		return list_question;
		
	}

	

}
