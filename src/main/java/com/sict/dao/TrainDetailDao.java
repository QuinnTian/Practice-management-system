package com.sict.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.Knowledge;
import com.sict.entity.TrainDetail;

/**
 * 功能：管理员上传实训安排相关的数据库操作 使用 @Repository 注释 TrainDetailDao by吴敬国20141028 *
 * 
 * */
@Repository
public class TrainDetailDao extends BasicDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 功能：查询整周实训,
	 *     ccc 20141212
	 * @param ts task_id
	 * @return list<TrainDetail>
	 * */
	public List<TrainDetail> searchTrain(String task_id, Timestamp ts,Timestamp time) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("task_id", task_id);
		map.put("ts", ts);
		map.put("time",time);
		List<TrainDetail> li = sqlSession.selectList("com.sict.dao.TrainDetailDao.searchTrain", map);
		return li;
	}
	/**根据学院id得到本学院的所有的实训安排信息
	 *@author by王磊2015-1-29
	 *@param 
	 *@return 
	 */
	public List<TrainDetail> selectListByDeptid(String xy_id){
		return sqlSession.selectList("com.sict.dao.TrainDetailDao.selectListByDeptid",xy_id);
	}
	/**
	 *@author 
	 *@param 
	 *@return 
	 */
	public List<TrainDetail> searchTrainNoTime(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("task_id", id);
		List<TrainDetail> li = sqlSession.selectList("com.sict.dao.TrainDetailDao.searchTrainNoTime", map);
		return li;
	}
	/**根据部门id该部门的实训安排课表信息
	 *@author 王磊2015年6月9日
	 *@param 
	 *@return 
	 */
	public List<TrainDetail> selectByDeptId(String dept_id){
		return sqlSession.selectList("com.sict.dao.TrainDetailDao.selectByDeptId",dept_id);
	}
	/**获取实训安排的年份
	 *@author 王磊
	 *@param 
	 *@return 
	 */
	public List<String> getYears(){
		return sqlSession.selectList("com.sict.dao.TrainDetailDao.getYears");
	}
	/**
	 *@author 王磊
	 *@param Map(year,term,dept_id) 
	 *@return List<TrainDetail>
	 */
	public List<TrainDetail> getTrainsByTermAndYearAndDeptId(Map m){
		return this.sqlSession.selectList("com.sict.dao.TrainDetailDao.getTrains", m);
	}
	/**
	 *@author 王磊
	 *@param Map(year,term,tea_id) 
	 *@return List<TrainDetail>
	 */
	public List<TrainDetail> getTrainsByTermAndYearAndTeaId(Map m){
		return this.sqlSession.selectList("com.sict.dao.TrainDetailDao.getTrainsByTeaId", m);
	}
}
