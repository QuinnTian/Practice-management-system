package com.sict.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.GraduationThesisDao;
import com.sict.entity.GraduationThesis;
import com.sict.util.Common;

/**
 * 功能：论文实训作品相关的service 使用 @Repository 注释 GraduationThesisDao 
 * by郑春光20140910 *
 * 吴敬国2015-6-3
 * 
 * */
@Repository(value = "graduationThesisService")
@Transactional
public class GraduationThesisService implements BasicService {

	@Autowired
	GraduationThesisDao graduationThesisDao;

	public List<GraduationThesis> selectList(Object o) {
		return this.graduationThesisDao.selectList(o);
	}

	public Object insert(Object o) {
		GraduationThesis g = (GraduationThesis) o;
		g.setId(Common.returnUUID16());
		int a=graduationThesisDao.insert(o);
		DictionaryService.updateGraduationThesis(g);
		return a;
	}

	public int update(Object o) {
		GraduationThesis g = (GraduationThesis) o;
		DictionaryService.updateGraduationThesis(g);
		return this.graduationThesisDao.update(o);
	}

	public int delete(Object o) {
		GraduationThesis g = (GraduationThesis) o;
		DictionaryService.deleteGraduationThesis(g.getId());
		return this.graduationThesisDao.delete(g);
	}

	public Object selectByID(String id) {
		return this.graduationThesisDao.selectByID(id);
	}

	public Object insertOrUpdate(Object o) {
		return null;
	}

	public int selectCount(Object o) {
		GraduationThesis g = (GraduationThesis) o;
		return this.graduationThesisDao.selectCount(g);
	}
	/**
	 * 获取论文当前版本号
	 * zcg 20141009 
	 * @param user_id
	 * @return
	 */
	public String getCurrentVersion(String user_id) {
		GraduationThesis gt = new GraduationThesis();
		String currentVersion = "0";
		Object o1 = this.graduationThesisDao.getCurrentVersion(user_id);
		if (o1 != null) {
			gt = (GraduationThesis) o1;
			currentVersion = gt.getVersion();
		}
		return currentVersion;
	}
	/**
	 * 功能：根据学生id和类型获得论文或者实训作品（论文和实训作品一个表）   
	 *    byccc20141215*
	 *    吴敬国 2015-3-25 
	 * @param String stu_id,String type
	 * @return List<GraduationThesis>
	 *
     */
	public List<GraduationThesis> selectByStuIdAndType(String stu_id,String type) {
		GraduationThesis thesis=new GraduationThesis();
		thesis.setStu_id(stu_id);
		thesis.setType(type);
		return graduationThesisDao.selectList(thesis);
	}
	/**
	 * 功能：根据学号 实习任务id 获得这个任务下的这个学生上传的版本号最大的那个论文
	 * bywjg 2015-4-20
	 * @param String stu_id,String pra_id
	 * @return GraduationThesis
	 * 
     */
	public GraduationThesis getMaxVersionByStuAndPraId(String stu_id,String pra_id) {
		GraduationThesis list=graduationThesisDao.getMaxVersionByStuAndPraId(stu_id, pra_id);
		return list;
	}
	/**
	 * 功能：根据学生id 实习任务id 获得最新的实训作品信息 
	 * bywjg 2015-4-20
	 * @param String stu_id,String pra_id
	 * @return GraduationThesis
	 * 
     */
	public GraduationThesis getNewTrainByStuAndPraId(String stu_id,String pra_id) {
		GraduationThesis list=graduationThesisDao.getNewTrainByStuAndPraId(stu_id, pra_id);
		return list;
	}
}


