package com.sict.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.ReportDetailGraduationMaterial;
import com.sict.entity.ReportTrainDetail;
/**
 * 功能：报表
 * 使用 @Repository 注释 
 * by张超2015/1/24	 
 * */
@Repository
public class ReportTrainDetailDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	/**
	 * 功能：管理员 领导 实训安排报表 获取报表数据  
	 * 权限：admin、leader
	 * by张超 
	 * 	   吴敬国 2015年6月12日
	 * @param 
	 * @return 
	 */
	public List<ReportTrainDetail> getReportTrainDetail(Map mapYearAndOrgIdAndTerm) {
		List<Object> gras = sqlSession.selectList("com.sict.dao.ReportTrainDetailDao.selectAllReportTrainDetail",mapYearAndOrgIdAndTerm);
		List<ReportTrainDetail> li = new ArrayList<ReportTrainDetail>();
		for(int i=0;i<gras.size();i++){
			Object d = gras.get(i);
			li.add((ReportTrainDetail)d);		
			String st = (li.get(i).getTrain_time());
			String s = st.substring(0, 10);
			li.get(i).setTrain_time(s);
		}
		return li;
	}
	
	/**
	 * 功能：获取报表title   权限：admin、leader
	 * @param org_id
	 * @return
	 */
	public String getOrgName(String org_id){
		String org_name=(sqlSession.selectList("com.sict.dao.ReportTrainDetailDao.selectOrgName", org_id)).toString();
		return org_name;
	}
	/**
	 * 功能：获取报表数据     权限：teacher
	 * @param year
	 * @return
	 */
	public List<ReportTrainDetail> getTeacherReportTrainDetail(Map map) {
		List<Object> gras = sqlSession.selectList("com.sict.dao.ReportTrainDetailDao.selectReportTrainDetail",map);
		List<ReportTrainDetail> li = new ArrayList<ReportTrainDetail>();
		//获取时间，取前十位
		for(int i=0;i<gras.size();i++){
			Object d = gras.get(i);
			li.add((ReportTrainDetail)d);		
			String st = (li.get(i).getTrain_time());
			String s = st.substring(0, 10);
			li.get(i).setTrain_time(s);
		}
		return li;
	}
}
