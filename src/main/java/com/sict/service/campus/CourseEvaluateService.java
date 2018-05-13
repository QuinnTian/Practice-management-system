package com.sict.service.campus;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.dao.campus.CourseEvaluateDao;
import com.sict.entity.CourseEvaluate;
import com.sict.service.BasicService;

@Repository(value = "courseEvaluateService")
public class CourseEvaluateService implements BasicService<CourseEvaluate>{
	
	@Autowired
	private CourseEvaluateDao courseEvaluateDao;

	public List<CourseEvaluate> selectList(CourseEvaluate t) {
		// TODO Auto-generated method stub
		return null;
	}

	public CourseEvaluate insert(CourseEvaluate t) {
		// TODO Auto-generated method stub
		CourseEvaluate b = (CourseEvaluate)t;
		if(courseEvaluateDao.insert(b)>0){
			return b;
		}else{
			return null;
		}
		
	}

	public int update(CourseEvaluate t) {
		// TODO Auto-generated method stub
		return courseEvaluateDao.update(t);
	}

	public int delete(CourseEvaluate t) {
		// TODO Auto-generated method stub
		CourseEvaluate c = (CourseEvaluate)t;
		return  courseEvaluateDao.delete(c);
	}

	public CourseEvaluate selectByID(String id) {
		// TODO Auto-generated method stub
		return courseEvaluateDao.selectByID(id);
	}

	public CourseEvaluate insertOrUpdate(CourseEvaluate t) {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectCount(CourseEvaluate t) {
		// TODO Auto-generated method stub
		return 0;
	}
	

	/**
	 * @Description 通过教学日志id获取其相关的课堂评价
	 * @author 师杰
	 * @param log_id
	 * @time 2016-05-20
	 * @return
	 */
	public List<CourseEvaluate> selectByLogId(String log_id){
		return courseEvaluateDao.selectByLogId(log_id);
}
	/**
	 * @Description 通过教学日志id、学生id、指标id查询是否存在记录
	 * @author 李达
	 * @param log_id
	 * @param stu_id
	 * @param index_id
	 * @time 2016-06-02
	 */
	public CourseEvaluate selectByLogIdAndStuIdAndIndexId(String log_id,String stu_id,String index_id){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("log_id", log_id);
		map.put("stu_id", stu_id);
		map.put("index_id", index_id);
		return courseEvaluateDao.selectByLogIdAndStuIdAndIndexId(map);
	}
	/**
	 * @Description 通过教学日志id、学生id查询记录
	 * @author 李达
	 * @param log_id
	 * @param stu_id
	 * @time 2016-06-02
	 */
	public List<CourseEvaluate> selectByLogIdAndStuId(String log_id,String stu_id){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("log_id", log_id);
		map.put("stu_id", stu_id);
		return courseEvaluateDao.selectByLogIdAndStuId(map);
	}
	/**
	 * @Description 根据指标id和日志id查询所有评价记录
	 * @param index_id
	 * @param log_id
	 *@time 2016-06-08
	 */
	public List<CourseEvaluate> selectByIndexIdAndLogId(String index_id,String log_id){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("log_id", log_id);
		map.put("index_id", index_id);
		return courseEvaluateDao.selectByIndexIdAndLogId(map);
	}
}
