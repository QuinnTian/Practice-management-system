package com.sict.dao;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sict.entity.RightRegion;
import com.sict.entity.Student;
@Repository
public class RightRegionDao extends BasicDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	// 选出合理地区的结束时间是否过期 楚晨晨
	public List<RightRegion> selectByRegion(String stu_id) {
		// TODO Auto-generated method stub
		 List<RightRegion> list = sqlSession.selectList(
				"com.sict.dao.RightRegionDao.selectByRegion", stu_id);
		 return list;
	}
	//插入合理地区
	public int insertByRegion(RightRegion rireg) {
		// TODO Auto-generated method stub
		return sqlSession.insert(
				"com.sict.dao.RightRegionDao.insert", rireg);
	}
	// 根据学生Id查询学生合理区域表的数据 sunlei

			public RightRegion getLaById(String id) {
				return sqlSession.selectOne("com.sict.dao.RightRegionDao.getLaById", id);
			
			}

}
