package com.sict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.EvaluateStandard;

/**
 * 功能：奖惩标准相关的数据库操作 使用 @Repository 注释 EvaluateStandardDao by李瑶婷 20141030 *
 * 
 * */
@Repository
public class EvaluateStandardDao extends BasicDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	//学院id查出奖惩标准数据
	public List<EvaluateStandard> ListById(String xy_id){
		return sqlSession.selectList("com.sict.dao.EvaluateStandardDao.selectById",xy_id);
	}
	//查询出奖惩指标的所有年份
	//by 王磊2015-1-26
	public List<String> ListYears(){
		return sqlSession.selectList("com.sict.dao.EvaluateStandardDao.selectYears");
	}
	//根据时间和范围scope查询出记录by王磊2015-1-26
	public List<EvaluateStandard> ListByYearAndScope(String scope,String year){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("scope",scope);
		map.put("year", year);
		return sqlSession.selectList("com.sict.dao.EvaluateStandardDao.selectByYearAndScore",map);
	}
	//根据部分编码查出编码的最大值by王磊2015-1-26
	public String getMaxEvaluateStandCode(String part_code){
		String code;
		code=sqlSession.selectOne("com.sict.dao.EvaluateStandardDao.maxEvalStandCode",part_code);
		return code;
	}
	//根据时间和学院id查出本年的学院里的标准by王磊2015-1-26
	public List<EvaluateStandard> selectByYearAndId(String xy_id,String year){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("xy_id",xy_id);
		map.put("year", year);
		return sqlSession.selectList("com.sict.dao.EvaluateStandardDao.selectByYearAndId",map);
	}
	//通过老师的系部id和院部id查出奖惩本老师系的标准和老师所在院的标准
	public List<EvaluateStandard> selectByIds(String xy_id,String xibu_id){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("xy_id",xy_id);
		map.put("xibu_id", xibu_id);
		return sqlSession.selectList("com.sict.dao.EvaluateStandardDao.selectByIds",map);
	}
	/**
	 * 根据标准类型查询出此类型所有标准
	 * by 李达 20160301
	 */
		public List<EvaluateStandard> selectByType(String type){
			return sqlSession.selectList("com.sict.dao.EvaluateStandardDao.selectByType",type);
		}
		/**
		 *根据标准类型早操和范围查询出早操指标(若存在多条记录会报错，仅用于早操)
		 *By 师杰 2016-04-15
		 */
		public Object selectByTypeAndScope(String type,String scope){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("type",type);
			map.put("scope", scope);
			return sqlSession.selectOne("com.sict.dao.EvaluateStandardDao.selectByTypeAndScope",map);
		}
}
