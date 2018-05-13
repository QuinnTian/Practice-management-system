package com.sict.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.DirectRecordDao;
import com.sict.dao.RoomsDetalsDao;
import com.sict.entity.Application;
import com.sict.entity.DirectRecord;
import com.sict.entity.RoomsDetals;
import com.sict.util.Common;

/**
 * 功能：RoomsDetals相关的service 使用 @Repository 注释 RoomsDetalsDao by宋浩20160119 *
 * 
 * */
@Repository(value = "roomsDetalsService")
@Transactional
public class RoomsDetalsService implements BasicService{
	
	@Autowired
	RoomsDetalsDao roomsDetalsDao;
	
	public List selectList(Object o) {
		RoomsDetals rd = (RoomsDetals) o;
		return roomsDetalsDao.selectList(rd);
	}

	public Object insert(Object o) {
		RoomsDetals rd = (RoomsDetals) o;
		rd.setId(Common.returnUUID());
		return roomsDetalsDao.insert(rd);
	}

	public int update(Object o) {
		return roomsDetalsDao.update(o);
	}

	public int delete(Object o) {
		return roomsDetalsDao.delete(o);
	}

	public Object selectByID(String id) {
		return this.roomsDetalsDao.selectByID(id);
	}

	public Object insertOrUpdate(Object o) {
		return this.roomsDetalsDao.insert(o);
	}

	public int selectCount(Object o) {
		return this.roomsDetalsDao.selectCount(o);
	}

	public Object selectById(String id) {
		return this.roomsDetalsDao.selectByID(id);
	}
	
}
