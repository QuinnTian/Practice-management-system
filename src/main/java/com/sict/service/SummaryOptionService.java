package com.sict.service;

import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.SummaryOptionDao;
import com.sict.entity.SummaryOption;
import com.sict.util.Common;

@Repository(value = "summaryOptionService")
@Transactional
public class SummaryOptionService implements BasicService<SummaryOption> {
	@Autowired
	private SummaryOptionDao SummaryOptionDao;

	public List<SummaryOption> selectList(SummaryOption t) {
		return SummaryOptionDao.selectList(t);
	}

	public SummaryOption insert(SummaryOption t) {
		
		t.setId(Common.returnUUID());
		int num = SummaryOptionDao.insert(t);
		if(num > 0){
			return t;
		}else{
			return null;
		}
	}

	public int update(SummaryOption t) {
		// TODO Auto-generated method stub
		return SummaryOptionDao.update(t);
	}

	public int delete(SummaryOption t) {
		if(t == null){
			return 0;
		}else{
			return SummaryOptionDao.delete(t);
		}
		
	}
	public int deleteByID(String id) {
		
		SummaryOption o = new SummaryOption();
		o.setId(id);
		return SummaryOptionDao.delete(o);
		
	}
	
	public int deleteByQuestionID(String questionID){
		SummaryOption o = new SummaryOption();
		o.setQuestion_id(questionID);
		return SummaryOptionDao.delete(o);
	}

	public SummaryOption selectByID(String id) {
		// TODO Auto-generated method stub
		return SummaryOptionDao.selectByID(id);
	}

	/**
	 * 根据问题的ID获取所有问题的选项
	 * @param questionID
	 * @return 
	 */
	public List<SummaryOption> selectByQuestionID(String questionID) {
		// TODO Auto-generated method stub
		SummaryOption summaryOption = new SummaryOption();
		summaryOption.setQuestion_id(questionID);
		return this.selectList(summaryOption);
	}

	public SummaryOption insertOrUpdate(SummaryOption t) {
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

	public int selectCount(SummaryOption t) {
		// TODO Auto-generated method stub
		return SummaryOptionDao.selectCount(t);
	}
	
	public int selectCountByID(String id) {
		// TODO Auto-generated method stub
		SummaryOption sq = new SummaryOption();
		sq.setId(id);
		return SummaryOptionDao.selectCount(sq);
	}
	
	public int selectCountByQuestionID(String questionID) {
		// TODO Auto-generated method stub
		SummaryOption sq = new SummaryOption();
		sq.setQuestion_id(questionID);
		return SummaryOptionDao.selectCount(sq);
	}
	
}
