package com.sict.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.PositionDao;
import com.sict.entity.Position;
import com.sict.entity.TreeNode;
import com.sict.util.Common;

/**
 * 功能：..相关的service 使用 @Repository 注释 PositionDao by李瑶婷20141105 *
 * 
 * */
@Repository(value = "positionService")
@Transactional
public class PositionService implements BasicService {

	@Autowired
	PositionDao positionDao;

	public List selectList(Object o) {
		// TODO Auto-generated method stub
		Position position = (Position) o;
		return positionDao.selectList(position);
	}

	public Object insert(Object o) {
		// TODO Auto-generated method stub
		Position position = (Position) o;
		position.setId(Common.returnUUID());
		position.setState("1");
		return positionDao.insert(position);
	}

	public int update(Object o) {
		// TODO Auto-generated method stub
		Position position = (Position) o;
		return positionDao.update(position);
	}

	public int delete(Object o) {
		// TODO Auto-generated method stub
		Position position = (Position) o;
		return positionDao.delete(position);
	}

	public Object selectByID(String id) {
		// TODO Auto-generated method stub
		return this.positionDao.selectByID(id);
	}

	public Object insertOrUpdate(Object o) {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectCount(Object o) {
		// TODO Auto-generated method stub
		return this.positionDao.selectCount(o);
	}
	
	public List<Position> selectAllPositions() {
		return this.positionDao.selectAllPositions();
	}
	
	

	/**
	 * 功能：目录树相关的操作       by李瑶婷  20141215 *
	 * 
	 * */
	public List<TreeNode> getPositionsByParent(int pid){
		return positionDao.getPositionsByParent(pid);
	}
	public List<TreeNode> getPresidentPositions(){
		return positionDao.getPresidentPositions();
	}
}

