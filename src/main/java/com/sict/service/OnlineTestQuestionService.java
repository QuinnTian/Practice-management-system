package com.sict.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.OnlineTestQuestionDao;
import com.sict.entity.OnlineTestOption;
import com.sict.entity.OnlineTestQuestion;
import com.sict.entity.OnlineTestQuestionnaire;
import com.sict.util.Common;

@Repository(value = "onlineTestQuestionService")
@Transactional
public class OnlineTestQuestionService implements BasicService<OnlineTestQuestion> {
	@Autowired
	private OnlineTestQuestionDao qtquestionDao;
	
	@Resource(name = "onlineTestOptionService")
	private OnlineTestOptionService otOptionService;

	public List<OnlineTestQuestion> selectList(OnlineTestQuestion qtq) {
		return this.qtquestionDao.selectList(qtq);
	}

	public OnlineTestQuestion insert(OnlineTestQuestion o) {
		// TODO Auto-generated method stub
		OnlineTestQuestion otq = (OnlineTestQuestion) o;
		otq.setId(Common.returnUUID());
		if (this.qtquestionDao.insert(otq) > 0) {
			return otq;
		} else {
			return null;
		}
	}
	
	public OnlineTestQuestion insertManualID(OnlineTestQuestion o) {
		// TODO Auto-generated method stub
		OnlineTestQuestion otq = (OnlineTestQuestion) o;
		if (this.qtquestionDao.insert(otq) > 0) {
			return otq;
		} else {
			return null;
		}
	}

	public int update(OnlineTestQuestion o) {
		// TODO Auto-generated method stub
		return this.qtquestionDao.update(o);
	}

	public int delete(OnlineTestQuestion o) {
		// TODO Auto-generated method stub
		return this.qtquestionDao.delete(o);
	}

	public OnlineTestQuestion selectByID(String id) {
		// TODO Auto-generated method stub
		return this.qtquestionDao.selectByID(id);
	}

	public OnlineTestQuestion insertOrUpdate(OnlineTestQuestion o) {
		// TODO Auto-generated method stub
		if (o.getId() == null || o.getId().equals("")) {
			return insert(o);
		} else {
			if(update(o) > 0){
				return o;
			}else{
				return null;
			}
		}
	}

	public int selectCount(OnlineTestQuestion o) {
		// TODO Auto-generated method stub
		return this.qtquestionDao.selectCount(o);
	}
	
	/**
	 * 根据qn_id获取所有的question
	 * @param qn_id
	 * @return
	 */
	public List<OnlineTestQuestion> getQuestionByOnlineTestQuesetionnaireID(String qn_id){
		
		OnlineTestQuestion otq = new OnlineTestQuestion();
		otq.setQuestionnaire_id(qn_id);
		return this.selectListAndOptionCount(otq);
		
	}
	/**
	 * 根据问题的id获取所有的选项并获取选项的数量
	 * @param otQuestion
	 * @return
	 */
	public List<OnlineTestQuestion> selectListAndOptionCount(OnlineTestQuestion otQuestion) {
		
		List<OnlineTestQuestion> list =this.selectList(otQuestion);
		for (int i = 0; i < list.size(); i++) {
			otQuestion = list.get(i);
			OnlineTestOption otOption = new OnlineTestOption();
			otOption.setQuestion_id(otQuestion.getId());
			otQuestion.setoNum(this.otOptionService.selectCount(otOption));
			list.set(i, otQuestion);
		}
		return list;
	}
}
