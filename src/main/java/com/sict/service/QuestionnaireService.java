package com.sict.service;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.QuestionDao;
import com.sict.dao.QuestionnaireDao;
import com.sict.entity.Option;
import com.sict.entity.Question;
import com.sict.entity.Questionnaire;
import com.sict.util.Common;

@Repository(value = "QuestionnaireService")
@Transactional
public class QuestionnaireService implements BasicService<Questionnaire> {
	@Autowired
	private QuestionnaireDao questionnaireDao;
	@Resource(name = "QuestionService")
	private QuestionService questioService;
	@Resource(name = "OptionService")
	private OptionService optionService;

	/**
	 * 
	 * by桑博
	 ** 
	 * 根据id获取一个问卷并附带问题
	 * 
	 * @param id
	 * @return
	 */
	public Questionnaire getByQuestion(String id) {

		Questionnaire qn = (Questionnaire) this.selectByID(id);
		Question q = new Question();
		q.setQuestionnaire_id(qn.getId());
		List<Question> qlist = this.questioService.getSelectQuestion(q);
		qn.setQuestion(qlist);
		qn.setqNum(qlist.size());
		return qn;
	}

	/**
	 * by桑博
	 ** 
	 * 根据id获取一个问卷，附带问卷的问题与问题的选项
	 * 
	 * @param id
	 * @return
	 */
	public Questionnaire getByQuestionAndOption(String id) {
		Questionnaire qn = getByQuestion(id);
		Question q = new Question();
		q.setQuestionnaire_id(qn.getId());
		List<Question> qlist = this.questioService.getSelectQuestion(q);
		for (int i = 0; i < qlist.size(); i++) {
			Option o = new Option();
			q = new Question();
			q = (Question) qlist.get(i);
			o.setQuestion_id(q.getId());
			q.setOption(this.optionService.getSelectOption(o));
			qlist.set(i, q);
		}
		qn.setQuestion(qlist);
		qn.setqNum(qlist.size());
		return qn;

	}

	public List<Questionnaire> selectList(Questionnaire o) {
		// TODO Auto-generated method stub
		Questionnaire qn = (Questionnaire) o;
		List<Questionnaire> list = this.questionnaireDao.selectList(qn);
		for (int i = 0; i < list.size(); i++) {
			qn = list.get(i);
			Question q = new Question();
			q.setQuestionnaire_id(qn.getId());
			int qNum = (Integer) this.questioService.selectCount(q);
			qn.setqNum(qNum);
			list.set(i, qn);
		}
		return list;
	}

	public Questionnaire insert(Questionnaire o) {
		Questionnaire qn = (Questionnaire) o;
		qn.setId(Common.returnUUID());
		qn.setTemp5(Questionnaire.qn_open);
		int i = this.questionnaireDao.insert(qn);
		if (i > 0) {
			return qn;
		} else {
			return null;
		}
	}

	public Questionnaire insertOrUpdate(Questionnaire o) {
		Questionnaire qn = (Questionnaire) o;
		if (qn.getId() == null || qn.getId().equals("")) {
			return insert(o);
		} else {
			int num =  (Integer) update(o);
			if(num > 0){
				return o;
			}else{
				return null;
			}
		}
	}

	public int update(Questionnaire o) {
		// TODO Auto-generated method stub
		return this.questionnaireDao.update(o);
	}

	public int delete(Questionnaire o) {
		Questionnaire qn = (Questionnaire) o;
		Question q = new Question();
		q.setQuestionnaire_id(qn.getId());
		List<Question> qlist = this.questioService.getSelectQuestion(q);
		for (int i = 0; i < qlist.size(); i++) {
			this.questioService.deleteQuestion((Question) qlist.get(i));
		}
		return this.questionnaireDao.delete(qn);
	}

	public Questionnaire selectByID(String id) {
		return this.questionnaireDao.selectByID(id);
	}

	public int selectCount(Questionnaire o) {
		return this.questionnaireDao.selectCount(o);
	}
}
