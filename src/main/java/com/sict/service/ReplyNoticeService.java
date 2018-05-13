package com.sict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.dao.ReplyNoticeDao;
import com.sict.entity.ReplyNotice;

@Repository(value = "replyNoticeService")
public class ReplyNoticeService implements BasicService {

	@Autowired
	ReplyNoticeDao replyNoticeDao;

	public List selectList(Object t) {
		// TODO Auto-generated method stub
		return replyNoticeDao.selectList(t);
	}

	public Object insert(Object t) {
		// TODO Auto-generated method stub
		return this.replyNoticeDao.insert(t);
	}

	public int update(Object t) {
		// TODO Auto-generated method stub
		return this.replyNoticeDao.update(t);
	}

	public int delete(Object t) {
		// TODO Auto-generated method stub
		return this.replyNoticeDao.delete(t);
	}

	public Object selectByID(String id) {
		// TODO Auto-generated method stub
		return this.replyNoticeDao.selectByID(id);
	}

	public Object insertOrUpdate(Object t) {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectCount(Object t) {
		// TODO Auto-generated method stub
		return this.replyNoticeDao.selectCount(t);
	}
	
	/**
	 * 
	 * @param user_id
	 * @return
	 */
	public List<ReplyNotice> selectNotReadNotice (String user_id) {
		// TODO Auto-generated method stub
		return replyNoticeDao.selectNotReadNotice(user_id);
	}
}
