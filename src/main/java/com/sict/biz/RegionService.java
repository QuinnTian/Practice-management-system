package com.sict.biz;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.RegionDao;
import com.sict.entity.Region;

@Service
public class RegionService {

	@Resource
	RegionDao regionDao;

	public List<Region> selectAllRegions() {
		return this.regionDao.selectAllRegions();
	}

}
