package com.sict.dao;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.Company;
import com.sict.entity.Log;
import com.sict.service.DictionaryService;
import com.sict.util.Common;


/**
 * 功能：
 * wjg 2015-5-24
 */
@Repository
public class LogDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 根据学生id和日期点得到这个学生这个点的实习状态
	 * bywjg
	 * 2015-5-31
	 * @param	String 
	 * @return List<Log>
	 */
	public Log selectStateByOneStuIdAndTime(String stu_id,String time) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stu_id", stu_id);
		map.put("time", time);
		Log list = sqlSession.selectOne("com.sict.dao.LogDao.selectStateByOneStuIdAndTime", map);
		return list;
	}
	/**
	 * 
	 * @param stu_id
	 * @return
	 * 返回该学生存在 的日志信息条数
	 * 邢志武
	 * 2015年6月16日 14:02:48
	 */
	public int getStuLogCont(String stu_id){
		int a=sqlSession.selectOne("com.sict.dao.LogDao.getStuLogCont", stu_id);
		return a ;
	}
	public Object insert(Object o) {
		// TODO Auto-generated method stub
		Log log = (Log) o;
		log.setId(Common.returnUUID());
		return sqlSession.insert("com.sict.dao.LogDao.insert", log);
	}
	/**
	 * 
	 * @param stu_id
	 * @return
	 * 查询上一条未完结的学生日志信息
	 * 2015年6月16日 14:30:55
	 * 邢志武
	 */
	public Log getOldLog(String stu_id) {
		return	sqlSession.selectOne("com.sict.dao.LogDao.getOldLog", stu_id);
	}
	
	/**
	 * 
	 * @param log
	 * 更新log信息
	 * 2015年6月16日 14:34:37
	 * 邢志武
	 */
	public void update(Log log) {
		sqlSession.update("com.sict.dao.LogDao.update",log);
	}
}
