	package com.sict.dao;

	import java.util.ArrayList;
import java.util.List;
import java.util.Map;

	import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

	import com.sict.entity.ReportDetailGraduationMaterial;
import com.sict.entity.ReportLogState;
import com.sict.entity.ReportTrainDetail;
	/*
	 * 功能：报表
	 * 使用 @Repository 注释 
	 * by张超2015/1/24	 * 
	 * */
	@Repository
	public class ReportLogStateDao {
		@Autowired
		private SqlSessionTemplate sqlSession;
		/**
		 * 功能：获取一个学院的原始数据，没有日期过滤报表内容数据      权限：leader
		 * 吴敬国
		 * 2015-5-27 
		 * @return List<ReportLogState>
		 */
		public List<ReportLogState> selectOneCollegeReportLogState(String college_id) {
			List<Object> gras = sqlSession.selectList("com.sict.dao.ReportLogStateDao.selectOneCollegeReportLogState",college_id);
			List<ReportLogState> li = new ArrayList<ReportLogState>();
			for(int i=0;i<gras.size();i++){
				Object d = gras.get(i);
				li.add((ReportLogState)d);		
			}
			return li;
		}
		
}
