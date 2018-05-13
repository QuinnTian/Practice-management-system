package com.sict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.DirectRecord;

@Repository
public class DirectRecordDao extends BasicDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	/**
	 * 根据教师id 查询该教师的指导记录
	 * @param String tea_id,String month
	 * @return List<DirectRecord>
	 * 2015-03-23 邢志武
	 */
	public List<DirectRecord> getTeaDirecRecsByTeaIdAndMonth(String tea_id,String month,String dr_type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tea_id", tea_id);
		map.put("month", month);
		map.put("dr_type", dr_type);
		return sqlSession.selectList("com.sict.dao.DirectRecordDao.getTeaDirecRecsByTeaIdAndMonth", map);
	}

	/**
	 * 根据教师id 查询该教师的指导记录
	 * @param tea_id
	 * @return List<DirectRecord>
	 * 2015-03-23 邢志武
	 */
	public List<DirectRecord> getTeaDirecRecsByTeaId(String tea_id) {
		return sqlSession.selectList("com.sict.dao.DirectRecordDao.getTeaDirecRecsByTeaId", tea_id);
	}
	/**
	 * 根据教师id和类型  查询该教师的指导记录或者教师总结        指导记录 2   教师总结1
	 * @param String tea_id,String dr_type
	 * @return List<DirectRecord>
	 * by 吴敬国  2015-10-10
	 */
	public List<DirectRecord> getTeaDirecRecsByTeaIdAndDr_type(String tea_id,String dr_type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tea_id", tea_id);
		map.put("dr_type", dr_type);
		return sqlSession.selectList("com.sict.dao.DirectRecordDao.getTeaDirecRecsByTeaIdAndDr_type", map);
	}
	
	
	
	
}