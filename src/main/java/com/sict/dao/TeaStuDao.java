package com.sict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.TeaStu;

/**
 * 功能：管理员相关的数据库操作 使用 @Repository 注释 TeaStuDao byccc20141021 *
 * 
 * */
@Repository
public class TeaStuDao extends BasicDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<TeaStu> selectPractice_code(String stu_code) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("stu_code", stu_code);

		List<TeaStu> list = sqlSession.selectList(
				"com.sict.dao.TeaStuDao.selectPractice_code", param);

		return list;
	}
public List<TeaStu> selectByStuCode(String stu_code) {
		
		return sqlSession.selectList(
				"com.sict.dao.TeaStuDao.selectByStuCode",
				stu_code);
	}

public List<TeaStu> selectPractice(String stu_code) {
	
	return sqlSession.selectList(
			"com.sict.dao.TeaStuDao.selectPractice_code",
			stu_code);
}
/**
 * 功能：查询对应学生信息记录,得到所记录方法名：getStudents by王磊0140929*
 * @param practicerecord
 * @return list
 * */
public List<TeaStu> getStudents(String tea_code,String practice_code) {
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("tea_code",tea_code);
	map.put("practice_code", practice_code);
	return sqlSession.selectList(
			
			"com.sict.dao.TeaStuDao.selectStudents", map);
}

/**
 * 功能：查询学生学号：getStudents by吴敬国20141123*
 * @param String tea_code,String practice_code
 * @return List<TeaStu>
 * */
public List<TeaStu> selectTeaListByTeacodeAndPracticecode(String tea_code,String practice_code) {
	Map<String, Object> param = new HashMap<String, Object>();
	param.put("tea_code", tea_code);
	param.put("practice_code", practice_code);
	return sqlSession.selectList(
			"com.sict.dao.TeaStuDao.selectTeaListByTeacodeAndPracticecode", param);
}


}
