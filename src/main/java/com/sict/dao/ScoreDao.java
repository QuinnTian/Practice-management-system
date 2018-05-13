package com.sict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.Score;
import com.sict.entity.TemporaryComplish;

@Repository
public class ScoreDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Score> selectScore(String id) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("stu_id", id);

		List<Score> list = sqlSession.selectList(
				"com.sict.dao.ScoreDao.selectScore", param);

		return list;
	}
	
	/**
	 * 
	 * @param practice_id
	 * @param weight_month
	 * @param weight_thesis
	 * @param weight_evaluate
	 * @author 吕付豹
	 */
		public List<Map<String, Object>> ScoreList(String practice_id,String weight_month,String weight_thesis,String weight_evaluate) {
		  
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("practice_id", practice_id);
			map.put("weight_thesis", weight_thesis);
			map.put("weight_evaluate", weight_evaluate);
			map.put("weight_month", weight_month);
			return sqlSession.selectList("com.sict.dao.ScoreDao.ScoreList",map);
		}

		/**
		 * @param  
		 * @param m
		 *@author 吕付豹
		 */
   public Object insert(Score score) {
	// TODO Auto-generated method stub
	return null;
}
	/**
	 * @param  
	 * @param m
	 * @author 吕付豹
	 */
		public Object insertMap(Map m) {
			Map<String, Object> map = new HashMap<String, Object>();
			/*map.put("practice_id", practice_id);
			map.put("weight_thesis", weight_thesis);
			map.put("weight_evaluate", weight_evaluate);
			map.put("weight_month", weight_month);
			map.put("term", term);
			map.put("myYear", myYear);*/
			return sqlSession.insert("com.sict.dao.ScoreDao.insertMap",m);
		}
		
		//<!--获取该实践任务下该学生的的月总结分数 2015-01-27 邢志武 -->
		public double getMothScore(String pract_id,String stu_id,String year) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("pract_id", pract_id);
			map.put("stu_id", stu_id);
			map.put("year", year);
			double monthScore=0;
			if(sqlSession.selectOne("com.sict.dao.ScoreDao.getMothScore",map) != null)
			{
				monthScore=sqlSession.selectOne("com.sict.dao.ScoreDao.getMothScore",map);
			}
			return monthScore;
		}
		//<!--获取该实践任务下该学生的的论文分数 2015-01-27 邢志武 -->
		public double getThesisScore(String pract_id,String stu_id) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("pract_id", pract_id);
			map.put("stu_id", stu_id);
			double thesisScore=0;
			if(sqlSession.selectOne("com.sict.dao.ScoreDao.getThesisScore",map) != null)
			{
				String score=sqlSession.selectOne("com.sict.dao.ScoreDao.getThesisScore",map);
				if(score.equals("暂无")){
					thesisScore=0;
				}else{
					thesisScore=Double.parseDouble(score);
				}
			}
			return thesisScore;
		}
		//<!--获取该实践任务下该学生的的奖惩分数 2015-01-27 邢志武 -->
		public double getEvaScore(String pract_id,String stu_id) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("pract_id", pract_id);
			map.put("stu_id", stu_id);
			double evaScore=0;
			if(sqlSession.selectOne("com.sict.dao.ScoreDao.getEvaScore",map) != null)
			{
				evaScore=sqlSession.selectOne("com.sict.dao.ScoreDao.getEvaScore",map);
			}
			return evaScore;
			
		}
		//<!--获取该实践任务下该学生的的奖惩开始时间 2015-01-27 邢志武 -->
		public String getStartThesisTime(String pract_id,String stu_id) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("pract_id", pract_id);
			map.put("stu_id", stu_id);
			
			
			if(sqlSession.selectOne("com.sict.dao.ScoreDao.getStartThesisTime",map) != null)
			{
				return sqlSession.selectOne("com.sict.dao.ScoreDao.getStartThesisTime",map);
			}
			return null;
			
		}
		
		/**
		 *删除所有数据
		 *2015年8月9日 12:04:18
		 *@author WuGee
		 */
		public void deleteAll(){
			sqlSession.delete("com.sict.dao.ScoreDao.deleteAll");
		}
		/**
		 * 插入教师完成度
		 * 2015年8月9日 12:10:04
		 * @author WuGee
		 */
		public void insertTeaComplish(TemporaryComplish tem){
			sqlSession.insert("com.sict.dao.ScoreDao.insertTeaComplish",tem);
		}
		/**
		 * @author WuGee
		 * @param tea_id
		 * 查询临时表内容
		 * 2015年8月10日 09:07:58
		 * @return 
		 */
		public List<TemporaryComplish> getTeacherComplish(String tea_id){
			return sqlSession.selectList("com.sict.dao.ScoreDao.getTeacherComplish",tea_id);
		}
}
