package com.sict.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class BasicDao<T> {

	@Autowired
	private SqlSessionTemplate sqlSession;
	String className = getClass().getName();
	public String namespace = className;

	/**
	 * by 桑博
	 * 
	 * @param o
	 * @return
	 */
	public List<T> selectList(T t) {

		return sqlSession.selectList(namespace + ".select", t);
	}

	/**
	 * by 桑博
	 * 
	 * @param o
	 * @return
	 */
	public int insert(T t) {
		return sqlSession.insert(namespace + ".insert", t);
	}

	/**
	 * by 桑博
	 * 
	 * @param o
	 * @return
	 */
	public int update(T t) {
		return sqlSession.update(namespace + ".update", t);
	}

	/**
	 * by 桑博
	 * 
	 * @param o
	 * @return
	 */
	public int delete(T t) {
		return sqlSession.delete(namespace + ".delete", t);
	}

	/**
	 * by 桑博
	 * 
	 * @param id
	 * @return
	 */
	public T selectByID(String id) {
		return sqlSession.selectOne(namespace + ".selectByID", id);
	}

	/**
	 * by 桑博
	 * 
	 * @param id
	 * @return
	 */
	public int selectCount(T t) {
		return sqlSession.selectOne(namespace + ".selectCount", t);
	}

	/**
	 * by 郑春光
	 * 
	 * @param id
	 * @return
	 */
	public T selectByCode(String code) {
		return sqlSession.selectOne(namespace + ".selectByCode", code);
	}
	
	
	/**
	 * 根据学生id更新记录（用于注销学生微信号）
	 * by syj 20160620
	 * @param id
	 * @return
	 */
	public T updateByStuId(String code) {
		return sqlSession.selectOne(namespace + ".updateByStuId", code);
	}
	
	
	/**
	 * @function 通过老师所在部门id查询该学院和学校的所有实习总结
	 * @param dept_id
	 * @edit syj @date 2016-08-31
	 * @return
	 */
	public List<T> selectSummaryByTeaDeptId(String dept_id) {
		return sqlSession.selectList(namespace + ".selectSummaryByTeaDeptId", dept_id);
	}
}
