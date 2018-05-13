package com.sict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.PracticeRecord;

/**
 * 功能：学生相关的数据库操作 使用 @Repository 注释 PracticeRecordDao by王磊20140927 *
 * 
 * */
@Repository
public class PracticeRecordDao extends BasicDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 功能：查询未审核申请记录,得到所有未审核申请记录方法名：getPracticeRecord by王磊0140927 *
	 * 
	 * @param practicerecord
	 * @return list
	 * */
	public List<PracticeRecord> getPracticeRecord(PracticeRecord p) {
		return sqlSession
				.selectList("com.sict.dao.PracticeRecordDao.select", p);
	}

	/**
	 * 功能：查询审核通过或未通过申请记录,方法名：getPartPracticeRecord by王磊0140927 *
	 * 
	 * @param practicerecord
	 * @return list
	 * */
	public List<PracticeRecord> getPartPracticeRecord(PracticeRecord p) {
		return sqlSession.selectList(
				"com.sict.dao.PracticeRecordDao.selectPart", p);
	}

	/**
	 * 功能：根据id更新实习申请记录 param practicerecord by王磊20140928
	 * 
	 * @return *
	 * 
	 * */
	public int updatePracticeRecord(PracticeRecord practicerecord) {
		return sqlSession.update("com.sict.dao.PracticeRecordDao.update",practicerecord);
	}

	/**
	 * 功能：根据id查询 param 实习申请记录id by王磊20140927 *
	 * 
	 * */
	public PracticeRecord selectById(String id) {
		return sqlSession.selectOne("com.sict.dao.PracticeRecordDao.selectByID", id);
	}

	/**
	 * 功能：查询实习记录,
	 * 
	 * @param practicerecord
	 * @return list<PracticeRecord>
	 * */
	public List<PracticeRecord> selectListByTeaId(String tea_id) {
		return sqlSession.selectList("com.sict.dao.PracticeRecordDao.selectListByTeaId", tea_id);
	}

	// 添加
	public int insertPracticeRecord(PracticeRecord practiceRecord) {
		return sqlSession.insert("com.sict.dao.PracticeRecordDao.insertPracticeRecord",practiceRecord);
	}

	// 通过学号选择自己需要改的实习状态
	public PracticeRecord selectByStu_id(String stu_id) {
		return sqlSession.selectOne("com.sict.dao.PracticeRecordDao.selectByStu_id", stu_id);
	}
	/**
	 * 
	 */
	public int updatetime(PracticeRecord practicerecord) {
		return sqlSession.update("com.sict.dao.PracticeRecordDao.updatetime",
				practicerecord);
	}

	/**
	 * 根据实习任务的id得到这个任务的所有实习就业记录 by吴敬国 2015-3-27
	 * 
	 * @param String  practice_id
	 * @return List<PracticeRecord>
	 */
	public PracticeRecord selectPracticeRecordByPracticeTaskId(
			String practice_id,String stu_id) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("practice_id", practice_id);
		param.put("stu_id", stu_id);
		return sqlSession.selectOne("com.sict.dao.PracticeRecordDao.selectPracticeRecordByPracticeTaskId",param);
	}

	// 根据学号选出实习申请 同时判断条件：是否离职 ccc 2015年1月19号
	public List<PracticeRecord> selectPrecord(String stu_id) {
		return sqlSession.selectList(
				"com.sict.dao.PracticeRecordDao.selectByStu_id", stu_id);
	}
	
	// 根据学号选出实习申请 同时判断条件：是否离职 邢志武 2015年6月30日 
	public PracticeRecord getPrecordUndimission_time(String stu_id) {
		return sqlSession.selectOne(
				"com.sict.dao.PracticeRecordDao.selectByStu_idDisstime", stu_id);
	}

	// 根据学号选出实习申请 同时判断条件：是否审核 ccc 2015年1月19号
	public List<PracticeRecord> selectPrecordByCheck_time(String stu_id,String practice_id) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("practice_id", practice_id);
		param.put("stu_id", stu_id);
		List<PracticeRecord> list = sqlSession.selectList("com.sict.dao.PracticeRecordDao.selectByStu_ids", param);
		return list;
	}
	/**
	 * 根据学号选出实习申请是否存在 
	 *  ccc 2015年1月19号
	 * @author 王磊 2015年5月29日 通过实习id查出学生最近的一次就业记录情况
	 * @param 实习id
	 */
	public PracticeRecord selectPrecordBypraid(String stu_id, String practice_id) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("practice_id", practice_id);
		param.put("stu_id", stu_id);
		PracticeRecord list = sqlSession.selectOne("com.sict.dao.PracticeRecordDao.selectPrecordBypraid", param);
		return list;
	}
	/**
	 *
	 */
	public List<PracticeRecord> selectByStu_idDisstime(String stu_id) {
		return sqlSession.selectList("com.sict.dao.PracticeRecordDao.selectByStu_idDisstime",stu_id);
	}
	/**
	 * 通过学生id和实习id得到学生最后的岗位
	 * @author 王磊 2015年5月29日 通过实习id查出学生最近的一次就业记录情况
	 * @param 实习id
	 */
	public PracticeRecord selectPost(String practice_id, String stu_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("practice_id", practice_id);
		map.put("stu_id", stu_id);
		return sqlSession.selectOne("com.sict.dao.PracticeRecordDao.selectPost", map);
	}

	/**
	 * @author 王磊 2015年5月29日 通过实习id查出学生最近的一次就业记录情况
	 * @param 实习id
	 */
	public List<PracticeRecord> getPracticeRecord(String practice_id) {
		return sqlSession.selectList("com.sict.dao.PracticeRecordDao.selectListById", practice_id);
	}

	/**
	 * 功能：根据企业Id获得在企业实习的学生 by：孙磊 2015年5月26日
	 * 
	 */
	public List<PracticeRecord> selectByComTeacherId(Map<String, Object> map) {
		return sqlSession.selectList("com.sict.dao.PracticeRecordDao.selectByComTeacherId", map);
	}
	/**
	 * 功能：
	 * 
	 */
	public int updateComteacher(Map<String, Object> map) {
		return sqlSession.update("com.sict.dao.PracticeRecordDao.updateComteacher", map);
	}

	/**
	 * 功能：查出学生的最近的实习记录根据学生id by：吴敬国 2015-6-24
	 * 
	 */
	public PracticeRecord selectPracticeRecordByStuId(String stu_id) {
		return sqlSession.selectOne("com.sict.dao.PracticeRecordDao.selectPracticeRecordByStuId",stu_id);
	}
	
	/**
	 * 功能：根据学号判断，是否有有效的实习任务
	 * 
	 */
	public PracticeRecord getValidPracticeTask(String stu_id) {
		return sqlSession.selectOne("com.sict.dao.PracticeRecordDao.getValidPracticeTask",stu_id);
	}
	
	
	/**
	 * 根据实习任务ID，添加离职信息 李泽20160411
	 */
	public int resignBypracticeId(PracticeRecord practiceRecord) {
		return sqlSession.update("com.sict.dao.PracticeRecordDao.updateResign",
				practiceRecord);
	}

	/**
	 * 根据学号查出学生通过审核的实习记录 李泽2016/4/12
	 * 
	 * @param stu_id
	 *            学生ID
	 * @return
	 */
	public PracticeRecord selectByStuid(String stu_id) {
		return sqlSession.selectOne(
				"com.sict.dao.PracticeRecordDao.selectByStuid", stu_id);
	}
	
}
