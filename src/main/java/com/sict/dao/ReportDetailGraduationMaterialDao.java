package com.sict.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.ReportDetailGraduationMaterial;


/*
 * 功能：报表
 * 使用 @Repository 注释 
 * by张超2015/1/24	 * 
 * */
@Repository
public class ReportDetailGraduationMaterialDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
			
	public List<ReportDetailGraduationMaterial> getReportDetailGraduationMaterials(Map param) {
		List<Object> gras = sqlSession.selectList("com.sict.dao.ReportDetailGraduationMaterialMapper.selectAllReportDetailGraduationMaterial",param);
		List<ReportDetailGraduationMaterial> li = new ArrayList<ReportDetailGraduationMaterial>();
		for(Object d : gras){
			li.add((ReportDetailGraduationMaterial)d);
		}
		return li;
	}

}