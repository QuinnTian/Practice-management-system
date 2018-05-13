package com.sict.service;

import java.util.ArrayList;
import java.util.List;





import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.SummaryQuestionDao;
import com.sict.entity.Option;
import com.sict.entity.Question;
import com.sict.entity.SummaryOption;
import com.sict.entity.SummaryQAnswer;
import com.sict.entity.SummaryQuestion;
import com.sict.util.Common;

@Repository(value = "summaryQuestionService")
@Transactional
public class SummaryQuestionService implements BasicService<SummaryQuestion> {
	@Autowired
	private SummaryQuestionDao SummaryQuestionDao;
	@Resource(name = "summaryOptionService")
	private SummaryOptionService summaryOptionService;
	
	@Resource(name = "summaryQAnswerService")
	private SummaryQAnswerService summaryQAnswerService;

	public List<SummaryQuestion> selectList(SummaryQuestion t) {
		List<SummaryQuestion> summaryQuestions = SummaryQuestionDao.selectList(t);
		for (SummaryQuestion summaryQuestion : summaryQuestions) {
			summaryQuestion.setOptionNum(summaryOptionService.selectCountByQuestionID(summaryQuestion.getId()));
		}
		return summaryQuestions;
	}

	public SummaryQuestion insert(SummaryQuestion t) {
		
		t.setId(Common.returnUUID());
		int num = SummaryQuestionDao.insert(t);
		if(num > 0){
			return t;
		}else{
			return null;
		}
	}
	
	public SummaryQuestion insertManualID(SummaryQuestion t){
		
		int num = SummaryQuestionDao.insert(t);
		if(num > 0){
			return t;
		}else{
			return null;
		}
		
	}
	

	public int update(SummaryQuestion t) {
		// TODO Auto-generated method stub
		return SummaryQuestionDao.update(t);
	}

	public int delete(SummaryQuestion t) {
		
		return SummaryQuestionDao.delete(t);
		
	}
	
	public int deleteByQuestionnaireID(String questionnaireID){
		
		SummaryQuestion q = new SummaryQuestion();
		q.setQuestionnaire_id(questionnaireID);
		List<SummaryQuestion> questions = selectBySummaryQuestionnaireID(questionnaireID);
		for (SummaryQuestion summaryQuestion : questions) {
			summaryOptionService.deleteByQuestionID(summaryQuestion.getId());
		}
		return delete(q);
	}
	
	/**
	 * 根据ID删除总结问题
	 * @param id
	 * @return int
	 */
	public int deleteByID(String id) {
		
		SummaryQuestion q = new SummaryQuestion();
		q.setId(id);
		return delete(q);

		
	}

	public SummaryQuestion selectByID(String id) {
		// TODO Auto-generated method stub
		SummaryQuestion summaryQuestion = new SummaryQuestion();
		summaryQuestion.setId(id);
		List<SummaryQuestion> summaryQuestions = this.selectList(summaryQuestion);
		if(summaryQuestions.size()>0){
			return summaryQuestions.get(0);
		}else{
			return null;
		}
	}

	public List<SummaryQuestion> selectBySummaryQuestionnaireID(String SummaryQuestionnaireID) {
		// TODO Auto-generated method stub
		SummaryQuestion summaryQuestion = new SummaryQuestion();
		summaryQuestion.setQuestionnaire_id(SummaryQuestionnaireID);
		return this.selectList(summaryQuestion);
	}
	public List<SummaryQuestion> selectBySummaryQuestionnaireIDAndStuType(String SummaryQuestionnaireID,String type_student) {
		return SummaryQuestionDao.selectByQuestionnaireId(SummaryQuestionnaireID, type_student);
	}
	
	public SummaryQuestion insertOrUpdate(SummaryQuestion t) {
		// TODO Auto-generated method stub
		if(t == null || "".equals(t.getId())){
			return insert(t);
		}else{
			if(update(t) > 0){
				return t;
			}else{
				return null;
			}
		}
	}

	public int selectCount(SummaryQuestion t) {
		// TODO Auto-generated method stub
		return SummaryQuestionDao.selectCount(t);
	}
	
	public int selectCountByID(String id) {
		// TODO Auto-generated method stub
		SummaryQuestion sq = new SummaryQuestion();
		sq.setId(id);
		return SummaryQuestionDao.selectCount(sq);
	}
	public int selectCountBySummaryID(String summaryID) {
		// TODO Auto-generated method stub
		SummaryQuestion sq = new SummaryQuestion();
		sq.setQuestionnaire_id(summaryID);
		return SummaryQuestionDao.selectCount(sq);
	}
	
	public List<SummaryQuestion> selectBySummaryQuestionnaireIDAndTypeStudent(String SummaryQuestionnaireID,String type_student) {
		// TODO Auto-generated method stub
		SummaryQuestion summaryQuestion = new SummaryQuestion();
		summaryQuestion.setQuestionnaire_id(SummaryQuestionnaireID);
		summaryQuestion.setType_student(type_student);
		return this.selectList(summaryQuestion);
	}
	
	public List<SummaryQuestion> getSelectQuestion(SummaryQuestion q) {

		List<SummaryQuestion> list = this.SummaryQuestionDao.selectList(q);
		for (int i = 0; i < list.size(); i++) {

			q = list.get(i);
			SummaryOption o = new SummaryOption();
			o.setQuestion_id(q.getId());
			int num = this.summaryOptionService.selectCount(o);
			q.setOptionNum(num);
			list.set(i, q);
		}
		return list;
	}
	/**
	 * 返回某月总结文本题答案
	 * @param id
	 * @return
	 */
	public List<SummaryQuestion> getQuestionList(String id) {

		SummaryQuestion question=new SummaryQuestion();
		question.setType("3");
		question.setQuestionnaire_id(id);
		List<SummaryQuestion> questionList=selectList(question);
		List<SummaryQuestion> questionList2=new ArrayList<SummaryQuestion>();
		
		SummaryQAnswer sqAnswer=new SummaryQAnswer();
		for(int i=0;i<questionList.size();i++){
			List<String> answertextList=new ArrayList<String>();
			SummaryQuestion question2=questionList.get(i);
			String queId=question2.getId();
			sqAnswer.setQuestion_id(queId);
			List<SummaryQAnswer> sqAnswerList=this.summaryQAnswerService.selectList(sqAnswer);
			for(int j=0;j<sqAnswerList.size();j++){
				String sqAnswerText=sqAnswerList.get(j).getAnswertext();
				answertextList.add(sqAnswerText);
			}
			question2.setAnswerText(answertextList);
			questionList2.add(question2);
		}
		return questionList2;
	}
	
	
	
}
