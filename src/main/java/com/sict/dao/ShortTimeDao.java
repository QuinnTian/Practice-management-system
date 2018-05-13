package com.sict.dao;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.dao.BasicDao;

@Repository
public class ShortTimeDao  extends BasicDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public void deleteAll() {
		// TODO Auto-generated method stub
		sqlSession.delete("com.sict.dao.ShortTimeDao.deleteAll");
	}

	/**
	 * 查询学院 某年的签到使用情况
	 * @param grade
	 * @return
	 */
	public List<Map<String, String>> getCollegeSignstuUsePro( String grade,String year,String org_id) {
		Map<String, String> map=new HashMap<String, String>();
		map.put("grade", grade);
		map.put("year", year);
		map.put("org_id", org_id);
		
		return sqlSession.selectList("com.sict.dao.ShortTimeDao.getCollegeSignstuUsePro",map);
	}

	public void deleteYearMouth() {
		 sqlSession.delete("com.sict.dao.ShortTimeDao.deleteYearMouth");
	}
}
