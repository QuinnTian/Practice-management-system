package com.sict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.RecruitInfoDao;
import com.sict.entity.RecruitInfo;
import com.sict.util.Common;

/**
 * 功能：..相关的service 使用 @Repository 注释 OrgDao by郑春光20140910 *
 * 
 * */
@Repository(value = "recruitInfoService")
@Transactional
public class RecruitInfoService implements BasicService {

	@Autowired
	RecruitInfoDao recruitInfoDao;

	public List selectList(Object o) {
		return recruitInfoDao.selectList(o);
	}

	public Object insert(Object o) {
		RecruitInfo s = (RecruitInfo) o;
		s.setId(Common.returnUUID());
		s.setState("1");
		DictionaryService.updateRecruitInfo(s);
		return recruitInfoDao.insert(s);
	}

	public int update(Object o) {
		RecruitInfo s = (RecruitInfo) o;
		DictionaryService.updateRecruitInfo(s);
		return recruitInfoDao.update(s);
	}

	public int delete(Object o) {
		return recruitInfoDao.delete(o);
	}

	public Object selectByID(String id) {
		return this.recruitInfoDao.selectByID(id);
	}

	public Object insertOrUpdate(Object o) {
		return this.recruitInfoDao.insert(recruitInfoDao);
	}
	public int selectCount(Object o) {
		return this.recruitInfoDao.selectCount(o);
	}
	public Object selectById(String id) {
		return this.recruitInfoDao.selectByID(id);// selectById(id);
	}
	public List<RecruitInfo> select() {
		return recruitInfoDao.select();
	}
	public List<RecruitInfo> select( RecruitInfo ri) {
		return recruitInfoDao.select(ri);
	}
}
