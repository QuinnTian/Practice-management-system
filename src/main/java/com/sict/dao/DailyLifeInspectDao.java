package com.sict.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class DailyLifeInspectDao extends BasicDao{
	/**
	 * 根据id获取申请信息(non-Javadoc)
	 * @see com.sict.dao.BasicDao#selectByID(java.lang.String)
	 * @author by 岳贤昌 20160119
	 */
	@Autowired
	private SqlSessionTemplate sqlSession;
	

}
