package com.sict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.InfoCheckRecord;


/**
 * 功能：学生相关的数据库操作 使用 @Repository 注释 StudentDao by吴敬国20140917 *
 * 
 * */
@Repository
public class InfoCheckRecordDao extends BasicDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	/**
	 * 修改核对信息
	 * by楚晨晨
	 * 2015-2-9
	 * @param	InfoCheckRecord info
	 * @return int
	 */
	public int updateInfo(InfoCheckRecord info) {
		return sqlSession.update("com.sict.dao.InfoCheckRecordDao.updateInfo",info);
	}
	/**
	 * 根据老师的id和实践任务的id获取到相应的小组的学生的信息核对情况
	 * by楚晨晨
	 * 2015-2-9
	 * @param	String tea_id,String practice_id
	 * @return List<InfoCheckRecord>
	 */
	public List<InfoCheckRecord> selectStudentByteaID(String tea_id,String practice_id) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("practice_id", practice_id);
		param.put("tea_id", tea_id);
		return	 sqlSession.selectList("com.sict.dao.InfoCheckRecordDao.selectcheckStudent", param);
	}
	/**
	 * 功能：
	 * by楚晨晨
	 * 2015-2-9
	 *  吴敬国2015-6-4  添加备注，功能不清楚，微信方面掉用
	 * @param	
	 * @return List<InfoCheckRecord>
	 */
	public List<InfoCheckRecord> selectByStu(String ss) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("stu_ids", ss);
		return	 sqlSession.selectList("com.sict.dao.InfoCheckRecordDao.selectByStu", param);
	}
}
