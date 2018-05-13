package com.sict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sict.entity.DailyLifeInspect;

public class DailyLifeInspectService implements BasicService<Object>{
	/**
	 * 根据id获取申请信息(non-Javadoc)
	 * @see com.sict.dao.BasicDao#selectByID(java.lang.String)
	 * @author by 岳贤昌 20160119
	 */
	
	@Autowired
	private com.sict.dao.DailyLifeInspectDao DailyLifeInspectDao;

	public List<Object> selectList(Object t) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object insert(Object t) {
		DailyLifeInspect la = (DailyLifeInspect)t;
		DailyLifeInspectDao.insert(la);
		return null;
	}

	public int update(Object t) {
		DailyLifeInspect la = (DailyLifeInspect)t;
		return DailyLifeInspectDao.update(la);
	}

	public int delete(Object t) {
		DailyLifeInspect la = (DailyLifeInspect)t;
		return DailyLifeInspectDao.delete(la);
	}

	public Object selectByID(String id) {
		return DailyLifeInspectDao.selectByID(id);
	}

	public Object insertOrUpdate(Object t) {
		DailyLifeInspect la = (DailyLifeInspect)t;
		return null;
	}

	public int selectCount(Object t) {
		DailyLifeInspect la = (DailyLifeInspect)t;
		return DailyLifeInspectDao.selectCount(la);
	}

}
