package com.sict.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.QnAnswerDao;
import com.sict.entity.QnAnswer;
import com.sict.util.Common;

@Repository(value = "QnAnswerService")
@Transactional
public class QnAnswerService {
	@Autowired
	QnAnswerDao qnaDao;

	public List<QnAnswer> getSelectQnAnswer(QnAnswer qna) {
		return this.qnaDao.getSelectQnAnswer(qna);
	}

	public QnAnswer getQnAnswerById(String id) {
		QnAnswer qna = new QnAnswer();
		qna.setId(id);
		return this.qnaDao.getSelectQnAnswer(qna).get(0);
	}

	public QnAnswer insertQnAnswer(QnAnswer qna) {
		qna.setId(Common.returnUUID());
		int num = this.qnaDao.insertQnAnswer(qna);
		if(num>=1){
			return this.qnaDao.selectByID(qna.getId());
		}else{
			return null;
		}
	}

	public int updateQnAnswer(QnAnswer qna) {

		return this.qnaDao.updateQnAnswer(qna);
	}

	public String insertOrUpdate(QnAnswer qna) {
		String id = qna.getId();
		int i = 0;
		String str = null;
		if ("".equals(id) || null == id) {
			i = this.qnaDao.insertQnAnswer(qna);
			if (i == 0) {
				str = "插入失败";
			} else {
				str = "插入成功";
			}
		} else {
			i = updateQnAnswer(qna);
			if (i == 0) {
				str = "更新失败";
			} else {
				str = "更新成功";
			}
		}
		return str;
	}

	public int deleteQnAnswer(QnAnswer qna) {
		return this.qnaDao.deleteQnAnswer(qna);
	}

	public int deleteQnAnswerById(String id) {

		QnAnswer qna = new QnAnswer();
		qna.setId(id);
		return deleteQnAnswer(qna);
	}

	public int selectQnAnswerCount(QnAnswer qna) {
		return this.qnaDao.selectQnAnswerCount(qna);
	}
	
	public boolean selectQnAnswerIDAndTypeAndNum(QnAnswer qna){
		List<QnAnswer> list = this.qnaDao.getSelectQnAnswer(qna);
		if(list.size() > 0){
			return true;
		}else{
			return false;
		}
		
	}
	public QnAnswer selectByID(String id){
		return (QnAnswer) this.qnaDao.selectByID(id);
	}
}
