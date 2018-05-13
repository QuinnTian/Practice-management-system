package com.sict.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.Files;
/*
 * 功能：毕业论文相关的数据库操作
 * 使用 @Repository 注释shenyueDao
 * by ccc 20140926	 * 
 */
@Repository
public class FilesDao extends BasicDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	/**
	 * zcg 20141009 获取文件
	 * 
	 * @param stu_code
	 * @return
	 */
	public Object getFile(String file_id) {
		return sqlSession.selectOne(namespace + ".getCurrentVersion", file_id);
	}
	public void insertFiles(Files files) {
		sqlSession.insert("com.sict.dao.FilesDao.insertFiles", files);
	}
	/**
	 * 根据学号，查看学生照片
	 * 功能： 李俊泽
	 * 2014-12-13
	 * @param stu_code
	 * */
	public List<Map<String, String>> selectPhoto(String stu_code) {
			return sqlSession.selectList("com.sict.dao.FilesDao.selectPhoto",stu_code);
		}
	/**
	 * 根据分组，教师ID，日期查询，查看学生照片
	 * 功能： 李俊泽
	 * 2014-12-13
	 * @param tea_id,begin_upload_time,end_upload_time,group_name
	 * */
	public  List<Map<String, String>> selectPhotoList(String tea_id,String begin_upload_time,String end_upload_time,String group_name) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tea_id",tea_id);
		map.put("begin_upload_time", begin_upload_time);
		map.put("end_upload_time", end_upload_time);
		map.put("group_name", group_name);
		return sqlSession.selectList("com.sict.dao.FilesDao.selectPhotoList", map);
	}
	
	public int deleteById(String file_id) {
		return sqlSession.delete("com.sict.dao.FilesDao.deleteById", file_id);
	}
	
	/**
	 *根据学生id 查询学生的实习照片 
	 *by 2015-01-26 邢志武
	 *   wjg 2015-6-20
	 * */
	public List<Files> selectStuPhotoByStu_id(String stu_id) {
			return sqlSession.selectList("com.sict.dao.FilesDao.selectStuPhotoByStu_id",stu_id);
		}
	/**
	 *根据学生id 查询学生的实习照片 
	 *by 2015-01-26 邢志武
	 *   wjg 2015-6-20
	 * */
	public List<Files> selectStuStu_id(String id, Timestamp time) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stu_id", id);
		map.put("time", time);
		return sqlSession.selectList("com.sict.dao.FilesDao.selectStuStu_id", map);
	}
	/**
	 * 根据教师id,查询某月是否上传指导记录
	 * @param map
	 * @return
	 */
	public int getTeacherGuideCount(Map<String, Object> map) {
		return sqlSession.selectOne("com.sict.dao.FilesDao.getTeacherGuideCount", map);
	}
	/**
	 *根据帖子id查询文件
	 *by 2015-01-26 邢志武
	 *   wjg 2015-6-20
	 * */
	public List<Files> getFileByInid(String id) {
		List<Files> files= sqlSession.selectList("com.sict.dao.FilesDao.getFileByInid",id);
		return files;
		
		}
}
