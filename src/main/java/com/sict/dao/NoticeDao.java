package com.sict.dao;

import java.security.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.Notice;

@Repository
public class NoticeDao  extends BasicDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	/**
     * 功能：没有调用，方法用途不明
     * by吴敬国 2015-6-20
     * 
     * */
	public List<Notice> selectNotice(String stu_code,int pages) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("stu_code", stu_code);
		param.put("pages", pages);
		List<Notice> list = sqlSession.selectList("com.sict.dao.NoticeDao.selectNotices", param);
		return list;
	}
	/**
     * 功能：没有调用，方法用途不明
     * by吴敬国 2015-6-20
     * 
     * */
	public List<Notice> getNoticesByRange(String org_id) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("org_id", org_id);
		List<Notice> list = sqlSession.selectList("com.sict.dao.NoticeDao.getNoticesByRange", param);
		return list;
	}
	/**
     * 功能：微信没备注
     * by吴敬国 2015-6-20
     * 
     * */
	public int selectNoticeorg_idcount(String org_id,String stu_id, java.sql.Timestamp current_notice_read) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("org_id", org_id);
		param.put("t",current_notice_read);
		param.put("stu_id",stu_id);
		return  sqlSession.selectOne("com.sict.dao.NoticeDao.selectNoticeorg_idcount", param);
	}
	/**
     * 功能：获取通知表中最大的通知编码
     * by王磊20150121
     * 
     * */
	public String getMaxNoticCode(String notice_cur_code){
		String code;
		code=sqlSession.selectOne("com.sict.dao.NoticeDao.maxNotice",notice_cur_code);
		return code;
	}
	/**
     * 功能：微信没备注
     * by吴敬国 2015-6-20
     * 
     * */
	public List<Notice> selectNoticeByType(String stu_id,java.sql.Timestamp time, int page) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("stu_id", stu_id);
		param.put("times", time);
		param.put("pages", page);
		List<Notice> list = sqlSession.selectList("com.sict.dao.NoticeDao.selectNoticeByType", param);
		return list;
	}
	/**
     * 功能：没有调用，方法用途不明
     * by吴敬国 2015-6-20
     * 
     * */
	public List<Notice> selectNotices(String stu_code, int pages,java.sql.Timestamp current_notice_read) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("stu_code", stu_code);
		param.put("pages", pages);
		param.put("t", current_notice_read);
		List<Notice> list = sqlSession.selectList(
				"com.sict.dao.NoticeDao.selectNotices", param);
		return list;
	}
	/**
     * 功能：没有调用，方法用途不明
     * by吴敬国 2015-6-20
     * 
     * */
	public int selectReadNotice(String college_id, String id,
			java.sql.Timestamp time) {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("org_id", college_id);
		param.put("t",time);
		param.put("stu_id",id);
		return  sqlSession.selectOne(
				"com.sict.dao.NoticeDao.selectReadNoticecount", param);
	}
	/**
     * 功能：获得该学院的该同学的通知条数
     * by吴敬国 2015-6-20
     * 
     * */
	public int selectNoticecount(String college_id, String id
			) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("org_id", college_id);
		param.put("stu_id",id);
		return  sqlSession.selectOne("com.sict.dao.NoticeDao.selectNoticecount", param);
	}
	/**
     * 功能：查询通知公告
     * by吴敬国 2015-6-20
     * byCCC 2015-6-22
     * 
     * */
	public List<Notice> getNoticesByRangesALL(String college_id,String stu_id, 
			int i) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("stu_id", stu_id);
		param.put("org_id", college_id);
		param.put("pages", i);
		List<Notice> list = sqlSession.selectList("com.sict.dao.NoticeDao.getNoticesByRanges", param);
		return list;
	}
	/**
     * 功能：web 学生查看自己的的通知
     * by吴敬国 2015-9-15
     * 
     * */
	public List<Notice> stuGetMyNotice(String college_id,String stu_id) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("stu_id", stu_id);
		param.put("org_id", college_id);
		List<Notice> list = sqlSession.selectList("com.sict.dao.NoticeDao.stuGetMyNotice", param);
		return list;
	}
	
	/**
     * 功能：没有调用，方法用途不明
     * by吴敬国 2015-6-20
     * 
     * */
	public List<Notice> getNoticesAll(String id, String college_id) {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("stu_id", id);
		param.put("college_id", college_id);
		List<Notice> list = sqlSession.selectList(
				"com.sict.dao.NoticeDao.getNoticesAll", param);
		return list;
	}
	/**
     * 功能：微信没备注
     * by吴敬国 2015-6-20
     * 
     * */
	public List<Notice> selectNoticeByTypeNotime(String id, int page) {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("stu_id", id);
		param.put("pages", page);
		List<Notice> list = sqlSession.selectList(
				"com.sict.dao.NoticeDao.selectNoticeByTypeNotime", param);
		return list;
	}
	/**
     * 功能：微信没备注
     * by吴敬国 2015-6-20
     * 
     * */
	public int selectCountTime(String id, java.sql.Timestamp time) {
		// TODO Auto-generated method stub
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("tz", time);
				param.put("stu_id",id);
				return  sqlSession.selectOne(
						"com.sict.dao.NoticeDao.selectCountTime", param);	
				}
	/**
     * 功能：查询znts的条数
     * byCCC 2015年6月22日
     * */
	public int selectALLZnts(String id) {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("stu_id",id);
		return  sqlSession.selectOne(
				"com.sict.dao.NoticeDao.selectALLZnts", param);
	}
	
	/**
	 * 
	 * @return
	 * 查询通知
	 * 邢志武 2015年6月30日19:07:27
	 * 
	 */
	public List<Notice> getNoticesList() {
		List<Notice> list = sqlSession.selectList(
				"com.sict.dao.NoticeDao.select");
		return list;
	}
}
