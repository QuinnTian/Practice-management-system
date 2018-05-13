package com.sict.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.Region;
import com.sict.entity.ReplyNotice;

@SuppressWarnings("unused")
@Repository
public class ReplyNoticeDao extends BasicDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 查看用户未读取的信息
	 * @param user_id
	 * @return
	 */
	public List<ReplyNotice> selectNotReadNotice(String user_id) {
		List<ReplyNotice> list = sqlSession.selectList("com.sict.dao.ReplyNoticeDao.selectNotReadNotice",user_id);
		return list;
	}
	
}
