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

@Repository(value = "OptionService")
@Transactional
public class OptionService {
	@Autowired
	private OptionDao OptionDao;
	@Autowired
	private QuestionDao QuestionDao;
	@Autowired
	private QuestionnaireDao questionnaireDao;

	public List<Object> getSelectOption(Option o) {
		return this.OptionDao.getSelectOption(o);
	}

	public Option getOptionById(String id) {
		Option o = new Option();
		o.setId(id);
		return (Option) this.OptionDao.getSelectOption(o).get(0);
	}

	public int insertOption(Option o) {

		Option o_id = new Option();
		o_id.setId(o.getId());
		if (this.OptionDao.selectOptionCount(o_id) == 1) {
			return this.OptionDao.updateQuestion(o);
		} else {
			o.setId(Common.returnUUID());
			return this.OptionDao.insertOption(o);
		}

	}

	public Questionnaire getOneQurestionnaire_question_option(Questionnaire qn) {

		String qnId = qn.getId();
		String qId = qn.getQ().getId();

		qn = new Questionnaire();
		Question q = new Question();
		Option o = new Option();
		qn.setId(qnId);
		q.setId(qId);
		o.setQuestion_id(qId);

		List<Object> oList = new ArrayList<Object>();
		oList = this.OptionDao.getSelectOption(o);
		List<Object> qList = new ArrayList<Object>();
		qList = this.QuestionDao.selectList(q);
		List<Questionnaire> qnList = this.questionnaireDao.selectList(qn);

		if (qnList.size() > 0) {
			qn = qnList.get(0);
		} else {
			qn = null;
			return qn;
		}
		if (qList.size() > 0) {
			qn.setQ((Question) qList.get(0));
		} else {
			return qn;
		}
		if (oList.size() > 0) {
			qn.getQ().setOption(oList);
		} else {
			return qn;
		}
		return qn;

	}

	/**
	 * 
	 */
	public int selectOptionCount(Option o) {
		return this.OptionDao.selectOptionCount(o);
	}

	public int deleteOption(Option o) {
		return this.OptionDao.deleteOption(o);
	}

	public int deleteOptionByQid(String qId) {
		return this.OptionDao.deleteOptionByQid(qId);
	}
}
