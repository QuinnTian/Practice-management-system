package com.sict.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.sict.dao.RightRegionDao;
import com.sict.entity.RightRegion;
/**
 * 功能：..相关的service 使用 @Repository 注释 rightRegionDao byccc20150122 *
 * 
 * */
@Repository(value = "rightRegionService")
@Transactional
public class RightRegionService implements BasicService {

	@Autowired
	RightRegionDao rightRegionDao;

	public List selectList(Object o) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object insert(Object o) {
		// TODO Auto-generated method stub
		return null;
	}

	public int update(Object o) {
		int a = 0;
		RightRegion r = (RightRegion) o;
		a = rightRegionDao.update(r);
		return a;
	}


	public int delete(Object o) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Object selectByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object insertOrUpdate(Object o) {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectCount(Object o) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertByRegion(RightRegion rireg) {
		// TODO Auto-generated method stub
		return rightRegionDao.insertByRegion(rireg);

	}
	

	/**
	 * 功能：获得Id 使用 @Repository 注释 rightRegionDao by孙磊  20150409 *
	 * 
	 * */
	public RightRegion getLaById(String id) {
		return rightRegionDao.getLaById(id);
	}

	
	
	
	
	
}
