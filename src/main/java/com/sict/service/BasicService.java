package com.sict.service;

import java.util.List;

public interface BasicService<T> {

	/**************************************
	 * by桑博
	 ** 
	 * 基础查询
	 * 
	 * @param o
	 * @return
	 */
	public List<T> selectList(T t);

	/**
	 * by桑博
	 ** 
	 * 基础插入
	 * 
	 * @param o
	 * @return
	 */
	public T insert(T t);

	/**
	 * by桑博
	 ** 
	 * 基础更新
	 * 
	 * @param o
	 * @return
	 */
	public int update(T t);

	/**
	 * by桑博
	 ** 
	 * 基础删除
	 * 
	 * @param o
	 * @return
	 */
	public int delete(T t);

	/**
	 * by桑博
	 ** 
	 * 根据id获取参数
	 * 
	 * @param id
	 * @return
	 */
	public T selectByID(String id);

	/**
	 * by桑博
	 ** 
	 * 插入或更新数据
	 * 
	 * @param o
	 * @return
	 */
	public T insertOrUpdate(T t);

	/**
	 * by桑博
	 ** 
	 * 根据对象查询数量
	 * 
	 * @param o
	 * @return
	 */
	public int selectCount(T t);
}
