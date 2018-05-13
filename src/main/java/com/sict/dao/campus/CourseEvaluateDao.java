package com.sict.dao.campus;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.dao.BasicDao;
import com.sict.entity.CourseEvaluate;

@Repository
public class CourseEvaluateDao extends BasicDao<CourseEvaluate>{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/**
	 * @Description 通过教学日志id获取其相关的课堂评价
	 * @author 师杰
	 * @time 2016-05-20
	 * @param log_id
	 * @return
	 */
	public List<CourseEvaluate> selectByLogId(String log_id){
		return sqlSession.selectList("com.sict.dao.campus.CourseEvaluateDao.selectByLogId",log_id);
	}
	/**
	 * @Description 通过教学日志id、学生id、指标id查询是否存在记录
	 * @author 李达
	 * @param log_id
	 * @param stu_id
	 * @param index_id
	 * @time 2016-06-02
	 */
	public  CourseEvaluate selectByLogIdAndStuIdAndIndexId(Map<String, Object> map){
		return sqlSession.selectOne("com.sict.dao.campus.CourseEvaluateDao.selectByLogIdAndStuIdAndIndexId",map);
	}
	/**
	 * @Description 通过教学日志id、学生id、指标id查询是否存在记录
	 * @author 李达
	 * @param log_id
	 * @param stu_id
	 * @time 2016-06-02
	 */
	public List<CourseEvaluate> selectByLogIdAndStuId(Map<String, Object> map){
		return sqlSession.selectList("com.sict.dao.campus.CourseEvaluateDao.selectByLogIdAndStuId",map);
	}
	/**
	 * @Description 根据指标id和日志id查询所有评价记录
	 * @param index_id
	 * @param log_id
	 *@time 2016-06-08
	 */
	public List<CourseEvaluate> selectByIndexIdAndLogId(Map<String, Object> map){
		return sqlSession.selectList("com.sict.dao.campus.CourseEvaluateDao.selectByIndexIdAndLogId",map);
	}
}
