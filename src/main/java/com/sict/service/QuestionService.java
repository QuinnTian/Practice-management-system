package com.sict.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.OptionDao;
import com.sict.dao.QuestionDao;
import com.sict.dao.QuestionnaireDao;
import com.sict.entity.Option;
import com.sict.entity.Question;
import com.sict.entity.Questionnaire;
import com.sict.util.Common;

@Repository(value = "QuestionService")
@Transactional
public class QuestionService implements BasicService {
	@Autowired
	private QuestionDao QuestionDao;
	@Autowired
	private OptionDao optionDao;
	@Autowired
	private QuestionnaireDao questionnaireDao;
	@Resource(name = "OptionService")
	private OptionService optionService;

	public List<Question> getSelectQuestion(Question q) {

		List<Question> list = this.QuestionDao.selectList(q);
		for (int i = 0; i < list.size(); i++) {

			q = list.get(i);
			Option o = new Option();
			o.setQuestion_id(q.getId());
			int num = this.optionDao.selectOptionCount(o);
			q.setoNum(num);
			list.set(i, q);

		}
		return list;
	}

	

	/**
	 * 根据问卷的ID获取问卷及其问卷问题
	 * @param questionnaireID
	 * @return
	 */
	public Questionnaire getOneQurestionnaire_question(String questionnaireID) {

		Questionnaire questionnaire = questionnaireDao.selectByID(questionnaireID);
		Question q = new Question();
		q.setQuestionnaire_id(questionnaire.getId());
		questionnaire.setQuestion(this.getSelectQuestion(q));
		return questionnaire;

	}

	public int deleteQuestion(Question q) {
		this.optionService.deleteOptionByQid(q.getId());
		return this.QuestionDao.delete(q);
	}

	public List selectList(Object o) {
		return this.QuestionDao.selectList(o);
	}

	public Object insert(Object o) {
		// TODO Auto-generated method stub
		Question q = (Question) o;
		q.setId(Common.returnUUID());
		if (this.QuestionDao.insert(q) > 0) {
			return q;
		} else {
			return null;
		}
	}

	public int update(Object o) {
		// TODO Auto-generated method stub
		return this.QuestionDao.update(o);
	}

	public int delete(Object o) {
		// TODO Auto-generated method stub
		return this.QuestionDao.delete(o);
	}

	public Object selectByID(String id) {
		// TODO Auto-generated method stub
		return this.QuestionDao.selectByID(id);
	}

	public Object insertOrUpdate(Object o) {
		// TODO Auto-generated method stub
		Question q = (Question) o;
		if (q.getId() == null || q.getId().equals("")) {
			return insert(o);
		} else {
			return update(o);
		}
	}

	public int selectCount(Object o) {
		// TODO Auto-generated method stub
		return this.QuestionDao.selectCount(o);
	}
	
	public List<String> selectAllIdByQn_id(String id){
		
		Question q = new Question();
		q.setQuestionnaire_id(id);
		return this.QuestionDao.selectAllIdByQn_id(id);

	}
}
