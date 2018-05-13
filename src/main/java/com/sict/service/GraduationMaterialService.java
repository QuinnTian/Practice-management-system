package com.sict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.GraduationMaterialsDao;
import com.sict.entity.GraduationMaterials;
import com.sict.entity.PracticeTask;

/**
 * 功能：就业材料相关的service 使用 @Repository 注释 graduationMaterialsDao 
 * byccc20141101*
 *    吴敬国2015年5月26日
 * */
@Repository(value = "graduationMaterialService")
@Transactional
public class GraduationMaterialService implements BasicService {
	@Autowired
	GraduationMaterialsDao graduationMaterialsDao;

	public List<GraduationMaterials> selectList(Object o) {
		return graduationMaterialsDao.selectList(o);
	}

	public Object insert(Object o) {
		GraduationMaterials gm = (GraduationMaterials) o;	
		DictionaryService.updateGraduationMaterials(gm);
		return graduationMaterialsDao.insert(gm);
	}
	public int update(Object o) {
		GraduationMaterials gm= (GraduationMaterials) o;
		DictionaryService.updateGraduationMaterials(gm);
		return graduationMaterialsDao.update(gm);
	}

	public int delete(Object o) {
		int a = 0;
		GraduationMaterials gm = (GraduationMaterials) o;
		a = graduationMaterialsDao.delete(gm);
		DictionaryService.deleteGraduationMaterials(gm.getId());
		return a;
	}
	public Object selectByID(String id) {
		return graduationMaterialsDao.selectByID(id);
	}

	public Object insertOrUpdate(Object o) {
		return null;
	}
	public Object selectCounts( Object o) {
		return null;
	}
	public int selectCount(Object t) {
		// TODO Auto-generated method stub
		return 0;
	}
	/**
	 * 功能：根据学生id获得就业材料  
	 * byccc20141215*
	 * @param stu_id
	 * @return List<GraduationMaterials>
	 *
     */
	public List<GraduationMaterials> selectGraduationMaterialsByStuId(String stu_id) {
		GraduationMaterials gm=new GraduationMaterials();
		gm.setStu_id(stu_id);
		return graduationMaterialsDao.selectList(gm);
	}
	/**
	 * 功能：根据学生id和实践任务的id获得该学生这个任务下的多次就业材料
	 * by吴敬国2015-3-23*
	 * @param String stu_id,String pra_id
	 * @return List<GraduationMaterials>
	 *
     */
	public List<GraduationMaterials> selectMaterialsByStuIdAndPraid(String stu_id,String pra_id) {
		GraduationMaterials gm=new GraduationMaterials();
		gm.setStu_id(stu_id);
		gm.setPractice_id(pra_id);
		return graduationMaterialsDao.selectList(gm);
	}
}
