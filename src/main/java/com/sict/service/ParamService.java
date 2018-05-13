package com.sict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.ParamDao;
import com.sict.entity.Param;

@Repository(value = "paramService")
@Transactional
public class ParamService implements BasicService {
	@Autowired
	ParamDao paramDao;

	public List selectList(Object t) {
		// TODO Auto-generated method stub
		Param pm = (Param) t;
		return this.paramDao.selectList(pm);
	}

	public Object insert(Object t) {
		// TODO Auto-generated method stub
		return this.paramDao.insert(t);
	}

	public int update(Object t) {
		Param p = (Param) t;
		// TODO Auto-generated method stub
		return this.paramDao.update(p);
	}

	public int delete(Object t) {
		return this.paramDao.delete(t);
	}

	public Object selectByID(String id) {
		// TODO Auto-generated method stub
		return this.paramDao.selectByID(id);
	}

	public Object insertOrUpdate(Object t) {
		// TODO Auto-generated method stub
		return this.paramDao.insert(t);
	}

	public int selectCount(Object t) {
		// TODO Auto-generated method stub
		return this.paramDao.selectCount(t);
	}

	// 通过学年查出所对应的参数信息。
	public List<Param> selectListByYear(String YEAR) {
		return this.paramDao.selectListByYear(YEAR);
	}

	// 通过部门查出所对应的参数信息。
	public List<Param> selectListByDept_Id(String DEPT_ID) {
		return this.paramDao.selectListByDept_Id(DEPT_ID);
	}

	// 根据部门id与参数名称为“开始月份”取出相对应的一条记录
	public Param selectParambyIdAndParam_name(Param param) {
		return this.paramDao.selectParambyIdAndParam_name(param);
	}

	// 根据部门id与参数名称为“开始月份”以及学期和学年取出相对应的一条记录
	public Param selectParambyIdAndParam_nameAndYearAndTerm(Param param) {
		return this.paramDao.selectParambyIdAndParam_nameAndYearAndTerm(param);
	}

	// 根据部门id取出相对应的记录
	public List<Param> selectParamListbyId(String id) {
		return this.paramDao.selectListByDept_Id(id);
	}

	// 通过参数删除参数信息
	public int deleteByparam(String PARAM_CODE) {
		return this.paramDao.deleteByparam(PARAM_CODE);
	}

	// 插入一条参数记录
	public int insertByParam(Param param) {
		return paramDao.insertByParam(param);
	}

	// 更新一条记录
	public int updateByParam(Param param) {
		return paramDao.updateByParam(param);
	}
	
	// 获取实习任务参数值 张文琪 20160907
	public String selectParamValueByIdYearTermAndName(Param param) {
		return this.paramDao.selectParamValueByIdYearTermAndName(param);
	}
}
