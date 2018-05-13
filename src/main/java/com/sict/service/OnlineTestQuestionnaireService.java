package com.sict.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.OnlineTestQuestionnaireDao;
import com.sict.entity.OnlineTestOption;
import com.sict.entity.OnlineTestQuestion;
import com.sict.entity.OnlineTestQuestionnaire;
import com.sict.entity.Questionnaire;
import com.sict.util.Common;

@Repository(value = "onlineTestQuestionnaireService")
@Transactional
public class OnlineTestQuestionnaireService implements BasicService<OnlineTestQuestionnaire> {
	@Autowired
	private OnlineTestQuestionnaireDao otQuestionnaireDao;

	@Resource(name = "onlineTestQuestionService")
	private OnlineTestQuestionService otQuestionService;
	@Resource(name = "onlineTestOptionService")
	private OnlineTestOptionService otOptionService;
	
	public OnlineTestQuestionnaire insert(OnlineTestQuestionnaire otqn) {
		otqn.setId(Common.returnUUID());
		otqn.setState(OnlineTestQuestionnaire.close);
		otqn.setCreateDate(Common.getNowTime());
		int i = this.otQuestionnaireDao.insert(otqn);
		if (i > 0) {
			otqn = (OnlineTestQuestionnaire) otQuestionnaireDao.selectByID(otqn.getId());
			return otqn;
		} else {
			return null;
		}
	}
	
	public OnlineTestQuestionnaire insertManualID (OnlineTestQuestionnaire otqn){
		
		otqn.setState(OnlineTestQuestionnaire.close);
		otqn.setCreateDate(Common.getNowTime());
		int i = this.otQuestionnaireDao.insert(otqn);
		if (i > 0) {
			otqn = (OnlineTestQuestionnaire) otQuestionnaireDao.selectByID(otqn.getId());
			return otqn;
		} else {
			return null;
		}
		
	}
	

	public OnlineTestQuestionnaire insertOrUpdate(OnlineTestQuestionnaire otqn) {
		if ("".equals(otqn.getId())) {
			return insert(otqn);
		} else {
			int num = (Integer) update(otqn);
			if(num >= 1){
				return otqn;
			}else{
				return null;
			}
		}
	}

	public int update(OnlineTestQuestionnaire otqn) {
		// TODO Auto-generated method stub
		return this.otQuestionnaireDao.update(otqn);
	}

	public OnlineTestQuestionnaire selectByID(String id) {
		return this.otQuestionnaireDao.selectByID(id);
	}

	public int selectCount(OnlineTestQuestionnaire otqn) {
		return this.otQuestionnaireDao.selectCount(otqn);
	}

	public int delete(OnlineTestQuestionnaire otqn) {
		OnlineTestQuestion otq = new OnlineTestQuestion();
		otq.setQuestionnaire_id(otqn.getId());
		List<OnlineTestQuestion> list = otQuestionService.selectList(otq);
		for (int i = 0; i < list.size(); i++) {
			otq = list.get(i);
			otQuestionService.delete(otq);
		}
		return this.otQuestionnaireDao.delete(otqn);
	}

	public List<OnlineTestQuestionnaire> selectList(OnlineTestQuestionnaire otqn) {
		
		return this.otQuestionnaireDao.selectList(otqn);
	}
	
	
	/**
	 * 
	 * 根据qn_id获取question的数量和测验
	 * @param o
	 * @return
	 * @author SangBigYe 桑博
	 */
	public List<OnlineTestQuestionnaire> selectListAndQuestionCount(OnlineTestQuestionnaire otqn) {
		
		List<OnlineTestQuestionnaire> list =this.selectList(otqn);
		for (int i = 0; i < list.size(); i++) {
			otqn = list.get(i);
			OnlineTestQuestion otq = new OnlineTestQuestion();
			otq.setQuestionnaire_id(otqn.getId());
			otqn.setqNum(otQuestionService.selectCount(otq));
			list.set(i, otqn);
		}
		return list;
	}
	
	/**
	 * 根据qn_id获取questionnaire和question
	 * @param otqn
	 * @return
	 */
	public OnlineTestQuestionnaire getOnlineTestQuestionnaireAndQuestionByQn_id(String cy_id){
		
		OnlineTestQuestionnaire otQuestionnaire = otQuestionnaireDao.selectByID(cy_id);
		List<OnlineTestQuestion> list_question = otQuestionService.getQuestionByOnlineTestQuesetionnaireID(cy_id);
		otQuestionnaire.setOnlineTestQuestions(list_question);
		otQuestionnaire.setqNum(list_question.size());
		return otQuestionnaire;
		
	}
	
	/**
	 * 根据q_id获取questionnaire和question
	 */
	public OnlineTestQuestionnaire getOnlineTestQuestionnaireAndQuestionByQuestion_ID(String otQuestion_id){
		
		OnlineTestQuestionnaire otQuestionnaire = new OnlineTestQuestionnaire();
		OnlineTestQuestion otQuestion = otQuestionService.selectByID(otQuestion_id);
		otQuestionnaire = otQuestionnaireDao.selectByID(otQuestion.getQuestionnaire_id());
		otQuestionnaire.setOnlineTestQuestion(otQuestion);
		return otQuestionnaire;
	}
	

	/**
	 * 根据测验的id获取所有相应的所以问题和问题的选项
	 * @param cy_id
	 * @return
	 */
	public OnlineTestQuestionnaire getOnlineTestQuestionnaireAndQuestionAndOptionByQn_id(String cy_id){
		
		//获取测验和问题
		OnlineTestQuestionnaire otQuestionnaire = getOnlineTestQuestionnaireAndQuestionByQn_id(cy_id);
		List<OnlineTestQuestion> list_question = otQuestionnaire.getOnlineTestQuestions();
		//获取问题的选项
		list_question = otOptionService.getAllOptionByQuestions(list_question);
		otQuestionnaire.setOnlineTestQuestions(list_question);
		
		return otQuestionnaire;
	}
	
	
	/**
	 * 去掉所有没有正确答案的问题
	 * @param otQuestionnaire
	 * @return
	 */
	public OnlineTestQuestionnaire removeNotTrueAnswerOption(OnlineTestQuestionnaire otQuestionnaire){
		
		
		List<OnlineTestQuestion> otQuestions = otQuestionnaire.getOnlineTestQuestions();
		for (int i = 0; i < otQuestions.size(); i++) {
			OnlineTestQuestion otQuestion = otQuestions.get(i);
			List<OnlineTestOption> otOptions = otQuestion.getOnlineTestOptions();
			
			boolean isT = false;
			
			for (OnlineTestOption otOption : otOptions) {
				if(OnlineTestOption.answer_true.equals(otOption.getAnswer())){
					isT = true;
					break;
				}
			}
			if(!isT){
				otQuestions.remove(i);
				otQuestionnaire.setqNum(otQuestionnaire.getqNum()-1);
			}
		}
		return otQuestionnaire;
		
	}
	
	
	
	/**
	 * 获取一个没有正确答案的问题,或者问题选项小于2个的问题
	 * @param otQuestionnaire
	 * @return
	 */
	public OnlineTestQuestion getNotTrueAnswerOption(OnlineTestQuestionnaire otQuestionnaire){
		
		
		otQuestionnaire = this.getOnlineTestQuestionnaireAndQuestionAndOptionByQn_id(otQuestionnaire.getId());
		List<OnlineTestQuestion> otQuestions = otQuestionnaire.getOnlineTestQuestions();
		for (int i = 0; i < otQuestions.size(); i++) {
			OnlineTestQuestion otQuestion = otQuestions.get(i);
			List<OnlineTestOption> otOptions = otQuestion.getOnlineTestOptions();
			
			boolean isT = false;
			int num = 0;
			for (OnlineTestOption otOption : otOptions) {
				num ++;
				if(OnlineTestOption.answer_true.equals(otOption.getAnswer())){
					isT = true;
				}
				if(isT==true && num >=2){
					break;
				}
				
			}
			if(num < 2){
				return otQuestion;
			}
			if(!isT){
				return otQuestion;
			}
		}
		return null;
		
	}
	
	
	
}
