package com.sict.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.Param;

@Repository
public class ParamDao extends BasicDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 根据参数ID查询出该参数的所有信息
	public List<Param> selectListById(String ID) {
		return sqlSession
				.selectList("com.sict.dao.ParamDao.selectListById", ID);
	}

	// 根据参数部门ID查询出所对应的信息
	public List<Param> selectListByDept_Id(String DEPT_ID) {
		return sqlSession.selectList(
				"com.sict.dao.ParamDao.selectListByDept_Id", DEPT_ID);
	}

	// 根据学年查询出所对应的信息
	public List<Param> selectListByYear(String YEAR) {
		return sqlSession.selectList("com.sict.dao.ParamDao.selectListByYear",
				YEAR);
	}

	// 根据部门id与参数名称取出相对应的一条记录
	public Param selectParambyIdAndParam_name(Param param) {
		return sqlSession.selectOne(
				"com.sict.dao.ParamDao.selectParambyIdAndParam_name", param);
	}

	// 根据部门id与参数名称为“开始月份”以及学期和学年取出相对应的一条记录
	public Param selectParambyIdAndParam_nameAndYearAndTerm(Param param) {
		return sqlSession
				.selectOne(
						"com.sict.dao.ParamDao.selectParambyIdAndParam_nameAndYearAndTerm",
						param);
	}

	// 根据部门id取出相对应的记录
	public List<Param> selectParamListbyId(String id) {
		return sqlSession.selectList(
				"com.sict.dao.ParamDao.selectParamListbyId", id);
	}

	// 根据参数删除参数信息
	public int deleteByparam(String PARAM_CODE) {
		return sqlSession.delete("com.sict.dao.ParamDao.deleteByparam",
				PARAM_CODE);
	}

	// 插入一条参数记录
	public int insertByParam(Param param) {
		return sqlSession.insert("com.sict.dao.ParamDao.insert", param);
	}

	// 更新一条记录
	public int updateByParam(Param param) {
		return sqlSession.update("com.sict.dao.ParamDao.update", param);
	}

	// 获取实习任务参数值 张文琪 20160907
	public String selectParamValueByIdYearTermAndName(Param param) {
		return sqlSession.selectOne(
				"com.sict.dao.ParamDao.selectParamValueByIdYearTermAndName",
				param);
	}

}
