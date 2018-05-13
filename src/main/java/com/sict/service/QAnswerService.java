package com.sict.service;

import java.text.SimpleDateFormat;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.QAnswerDao;
import com.sict.entity.QAnswer;
import com.sict.util.Common;

@Repository(value = "QAnswerService")
@Transactional
public class QAnswerService {
	@Autowired
	QAnswerDao qaDao;

	public List<QAnswer> getSelectQAnswer(QAnswer qa) {
		return this.qaDao.getSelectQAnswer(qa);
	}

	public QAnswer getQAnswerById(String id) {
		QAnswer qa = new QAnswer();
		qa.setId(id);
		return this.qaDao.getSelectQAnswer(qa).get(0);
	}

	public int insertQAnswer(QAnswer qa) {
		qa.setId(Common.returnUUID());
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		return this.qaDao.insertQAnswer(qa);
	}

	public int updateQAnswer(QAnswer qa) {

		return this.qaDao.updateQAnswer(qa);
	}

	public String insertOrUpdate(QAnswer qa) {
		String id = qa.getId();
		int i = 0;
		String str = null;
		if ("".equals(id) || null == id) {
			i = insertQAnswer(qa);
			if (i == 0) {
				str = "插入失败";
			} else {
				str = "插入成功";
			}
		} else {
			i = updateQAnswer(qa);
			if (i == 0) {
				str = "更新失败";
			} else {
				str = "更新成功";
			}
		}
		return str;
	}

	public int deleteQAnswer(QAnswer qa) {
		return this.qaDao.deleteQAnswer(qa);
	}

	public int deleteQAnswerByAll(QAnswer qa) {
		if (qa.getId() != null || qa.getQnanswer_id() != null
				|| qa.getQuestion_id() != null || qa.getAnswertext() != null) {
			return this.qaDao.deleteQAnswerByAll(qa);
		}
		return 0;
		
	}

	public int deleteQAnswerById(String id) {

		QAnswer qa = new QAnswer();
		qa.setId(id);
		return deleteQAnswer(qa);
	}

	public int selectQAnswerCount(QAnswer qa) {
		return this.qaDao.selectQAnswerCount(qa);
	}

	public int distinctQAnswerQuestion_id(QAnswer qa) {
		return this.qaDao.distinctQAnswerQuestion_id(qa);
	}

	public int distinctQAnswerCount(QAnswer qa) {
		return this.qaDao.distinctQAnswerCount(qa);
	}
}
