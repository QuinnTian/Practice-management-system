package com.sict.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.Company;
import com.sict.entity.Position;
import com.sict.entity.TreeNode;

/**
 * 功能：企业岗位相关的数据库操作 使用 @Repository 注释 PositionDao by李瑶婷20141105 *
 * 
 * */
@Repository
public class PositionDao extends BasicDao{

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Position> selectAllPositions() {
		List<Position> list = sqlSession
				.selectList("com.sict.dao.PositionDao.selectAllPositions");
		return list;
	}
	
	/**
	 * 功能：目录树相关的数据库操作  20141215 *李瑶婷*
	 * 
	 * */
	
	public List<TreeNode> getPositionsByParent(int pid){ //根据父元素去获取子元素 
		List<TreeNode> li = new ArrayList<TreeNode>();
		
		List<Object> positions = sqlSession.selectList("com.sict.dao.PositionDao.selectPositionsByParent",pid);
		
		for(Object o : positions){  //遍历所有岗位
			li.add((TreeNode)o);
		}
		return li;
	}
	
	public List<TreeNode> getPresidentPositions(){  //获取所有父元素
		List<TreeNode> li = new ArrayList<TreeNode>();
		
		List<Object> positions = sqlSession.selectList("com.sict.dao.PositionDao.selectPresidentPositions");
		
		for(Object o : positions){
			li.add((TreeNode)o);
		}
		return li;
	}
	

}
