package com.sict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.DutiesDao;
import com.sict.entity.Duties;
import com.sict.util.Common;

@Repository(value = "dutiesService")
@Transactional
public class DutiesService implements BasicService<Duties> {
	@Autowired
	DutiesDao dutiesDao;

	public List<Duties> selectList(Duties t) {
		return dutiesDao.selectList(t);
	}

	public Duties insert(Duties t) {
		t.setCreate_time(Common.getNowTime());
		t.setState("1");
		dutiesDao.insert(t);
		return t;
	}

	public int update(Duties t) {
		return dutiesDao.update(t);
	}

	public int delete(Duties t) {
		return dutiesDao.delete(t);
	}

	public Duties selectByID(String id) {
		return dutiesDao.selectByID(id);
	}

	// 暂时没使用
	public Duties insertOrUpdate(Duties t) {
		return null;
	}

	public int selectCount(Duties t) {
		return dutiesDao.insert(t);
	}

}
