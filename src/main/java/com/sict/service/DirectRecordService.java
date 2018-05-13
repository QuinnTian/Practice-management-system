package com.sict.service;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.eclipse.jdt.internal.compiler.ast.ArrayAllocationExpression;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.sict.dao.DirectRecordDao;

import com.sict.entity.DirectRecord;
import com.sict.entity.Teacher;
import com.sict.util.Common;

/**
 * 功能：指导记录相关的service 使用 @Repository 注释 DirectRecordDao bywtt20141217 *
 * 
 * */
@Repository(value = "directRecordService")
@Transactional
public class DirectRecordService implements BasicService {

	@Autowired
	DirectRecordDao directRecordDao;
	@Resource(name = "teacherService")
	private TeacherService teacherService;
	public List selectList(Object o) {
		DirectRecord s = (DirectRecord) o;
		return directRecordDao.selectList(s);
	}

	public Object insert(Object o) {
		DirectRecord s = (DirectRecord) o;
		s.setId(Common.returnUUID());
		return directRecordDao.insert(s);
	}

	public int update(Object o) {
		return directRecordDao.update(o);
	}

	public int delete(Object o) {
		return directRecordDao.delete(o);
	}

	public Object selectByID(String id) {
		return this.directRecordDao.selectByID(id);
	}

	public Object insertOrUpdate(Object o) {
		return this.directRecordDao.insert(o);
	}

	public int selectCount(Object o) {
		return this.directRecordDao.selectCount(o);
	}

	public Object selectById(String id) {
		return this.directRecordDao.selectByID(id);
	}
	/**
	 * 根据教师id和月份 查询该教师的指导记录
	 * @param String tea_id,String month
	 * @return List<DirectRecord>
	 * 2015-03-23 邢志武
	 */
	public List<DirectRecord> getTeaDirecRecsByTeaIdAndMonth(String tea_id,String month,String dr_type) {
		return this.directRecordDao.getTeaDirecRecsByTeaIdAndMonth(tea_id,month,dr_type);
	}
	/**
	 * 根据教师id 查询该教师的指导记录
	 * @param tea_id
	 * @return List<DirectRecord>
	 * 2015-03-23 邢志武
	 */
	public List<DirectRecord> getTeaDirecRecsByTeaId(String tea_id) {
		return this.directRecordDao.getTeaDirecRecsByTeaId(tea_id);
	}
	/**
	 * 查询系部所有的 指导记录
	 * @param String deptment_id,String month
	 * @return List<DirectRecord>
	 * 2015-03-23 邢志武
	 */
	public List<DirectRecord> getDeptmentDirecRecs(String deptment_id,String month,String dr_type) {
		List<Teacher> teaList=teacherService.getTeachersByDeptId(deptment_id);
		List<DirectRecord> deptDirectRecord=new ArrayList<DirectRecord>();
		for(Teacher t:teaList){
			if(month.equalsIgnoreCase("")||month==null){//如果月份为空的情况
				deptDirectRecord.addAll(getTeaDirecRecsByTeaIdAndDr_type(t.getId(),dr_type));
			}else{
				deptDirectRecord.addAll(getTeaDirecRecsByTeaIdAndMonth(t.getId(),month,dr_type));
			}
		}
		return deptDirectRecord;
	}
	/**
	 * 根据教师id和类型  查询该教师的指导记录或者教师总结        指导记录 2   教师总结1
	 * @param tea_id
	 * @return DirectRecord
	 * 2015-03-23 邢志武
	 */
	public List<DirectRecord> getTeaDirecRecsByTeaIdAndDr_type(String tea_id,String dr_type) {
		return this.directRecordDao.getTeaDirecRecsByTeaIdAndDr_type(tea_id,dr_type);
	}
	
	
}
