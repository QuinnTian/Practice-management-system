package com.sict.service;

import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.ReportDetailGraduationMaterialDao;
import com.sict.entity.ReportCountGraduationMaterial;
import com.sict.entity.ReportDetailGraduationMaterial;

@Repository(value = "reportDetailGraduationMaterialService")
@Transactional
public class ReportDetailGraduationMaterialService {	
	
	@Resource(name = "groupMembersService")
	private GroupMembersService groupMembersService;
			@Autowired
			private ReportDetailGraduationMaterialDao dao;
			/**功能:获取报表需要的数据
			 * by 张超   2015/1/26
			 * @param Map 
			 * @return List<ReportCountGraduationMaterial>
			 */
			public List<ReportCountGraduationMaterial> getReportData(Map param){
				//根据参数param获取ReportDetailGraduationMaterial类型的对象sqlDatas
				List<ReportDetailGraduationMaterial> sqlDatas = dao.getReportDetailGraduationMaterials(param);
				//调用getSumDate()方法获取Map类型的对象m
				 Map<String,ReportCountGraduationMaterial> m = getSumData(sqlDatas);
				 //创建一个<List>类型为ReportCountGraduationMaterial的对象li
				 List<ReportCountGraduationMaterial> li = new ArrayList<ReportCountGraduationMaterial>();
				 //遍历m对象获取分组身份证,合同通过率
				 for(Object key : m.keySet()){
					 ReportCountGraduationMaterial reportCountGM = m.get(key);
					  Float f = (float)reportCountGM.getIdPassNum()/reportCountGM.getGroup_number()*100;
						 reportCountGM.setNum_id_pass_rate(f.intValue());
						 Float v = (float)reportCountGM.getContractPassNum()/reportCountGM.getGroup_number()*100;
						 reportCountGM.setNum_contract_pass_rate(v.intValue());
						 String s = (float)reportCountGM.getIdPassNum()/reportCountGM.getGroup_number()*100+"";
	 					 if(s.equals("100.0")){
	 						reportCountGM.setId_pass_rate("100%");
	 					 }else{
	 						reportCountGM.setId_pass_rate(s.substring(0, 2)+"%");
	 					 }
	 					 String r = (float)reportCountGM.getContractPassNum()/reportCountGM.getGroup_number()*100+"";
	 					 if(r.equals("100.0")){
	 						reportCountGM.setContract_pass_rate("100%");
	 					 }else{
	 						reportCountGM.setContract_pass_rate(r.substring(0, 2)+"%");
	 					 }					 
					 //重新把value对象付给m
					 String  i = key.toString();
					  m.put(i,reportCountGM);					 
				 }
				 //获得身份证、合同的上交率
				 for(Object key : m.keySet()){
					 ReportCountGraduationMaterial reportCountGM = m.get(key);		 
					 String s = (float)(reportCountGM.getIdPassNum()+reportCountGM.getIdNoPassNum())/reportCountGM.getGroup_count_number()*100+"";
	 					 if(s.equals("100.0")){
	 						reportCountGM.setId_handin_rate("100%");
	 					 }else{
	 						reportCountGM.setId_handin_rate(s.substring(0, 2)+"%");
	 					 }
	 					 String r = (float)(reportCountGM.getContractPassNum()+reportCountGM.getContractNoPassNum())/reportCountGM.getGroup_count_number()*100+"";

	 					 if(r.equals("100.0")){
	 						reportCountGM.setContract_handin_rate("100%");
	 					 }else{
	 						reportCountGM.setContract_handin_rate(r.substring(0, 2)+"%");
	 					 }					 
					 
					 //重新把value对象付给m
					 String  i = key.toString();
					  m.put(i,reportCountGM);					 
				 }
				 //把CountgroupcountNumber赋值
				 int countgroupcountnumber=0;
				 for(Object key : m.keySet()){
					 ReportCountGraduationMaterial reportCountGM = m.get(key);
					 if(reportCountGM.getIdPassNum()!=0){
						 countgroupcountnumber += reportCountGM.getGroup_count_number();
					 }						
				 }
				 
				 for(Object key : m.keySet()){
					 ReportCountGraduationMaterial reportCountGM = m.get(key);
					 reportCountGM.setCount_group_count_number(countgroupcountnumber);		
					 String  i = key.toString();
					  m.put(i,reportCountGM);	
				 }
				 //把CountIdPassNum赋值
				 int countpassid = 0;
				 for(Object key : m.keySet()){
					 ReportCountGraduationMaterial reportCountGM = m.get(key);
					 if(reportCountGM.getIdPassNum()!=0){
						 countpassid += reportCountGM.getIdPassNum();
					 }						
				 }
				 
				 for(Object key : m.keySet()){
					 ReportCountGraduationMaterial reportCountGM = m.get(key);
					 reportCountGM.setCountIdPassNum(countpassid); 		
					 String  i = key.toString();
					  m.put(i,reportCountGM);	
				 }
				 //把CountIdNoPassNum赋值
				 int countnopassid = 0;
				 for(Object key : m.keySet()){
					 ReportCountGraduationMaterial reportCountGM = m.get(key);
					 if(reportCountGM.getIdNoPassNum()!=0){
						 countnopassid +=reportCountGM.getIdNoPassNum();
					 }
				 }
				 for(Object key : m.keySet()){
					 ReportCountGraduationMaterial reportCountGM = m.get(key);
					 reportCountGM.setCountIdNoPassNum(countnopassid); 		
					 String  i = key.toString();
					  m.put(i,reportCountGM);	
				 }
				 //把CountContractPassNum赋值
				 int countpasscontract = 0;
				 for(Object key : m.keySet()){
					 ReportCountGraduationMaterial reportCountGM = m.get(key);
					 if(reportCountGM.getContractPassNum()!=0){
						 countpasscontract +=reportCountGM.getContractPassNum();
					 }
				 }
				 for(Object key : m.keySet()){
					 ReportCountGraduationMaterial reportCountGM = m.get(key);
					 reportCountGM.setCountContractPassNum(countpasscontract); 		
					 String  i = key.toString();
					  m.put(i,reportCountGM);	
				 }
				 //把CountContractNoPassNum赋值
				 int countnopasscontract = 0;
				 for(Object key : m.keySet()){
					 ReportCountGraduationMaterial reportCountGM = m.get(key);
					 if(reportCountGM.getContractNoPassNum()!=0){
						 countnopasscontract +=reportCountGM.getContractNoPassNum();
					 }
				 }
				 for(Object key : m.keySet()){
					 ReportCountGraduationMaterial reportCountGM = m.get(key);
					 reportCountGM.setCountContractNoPassNum(countnopasscontract); 		
					 String i = key.toString();
					  m.put(i,reportCountGM);	
				 }
				 
				 //遍历m获取总的身份证,合同通过率
				 for(Object key : m.keySet()){
					 	ReportCountGraduationMaterial reportCountGM = m.get(key);
					 		

		 					 String s = (float)reportCountGM.getCountIdPassNum()/(reportCountGM.getCountIdPassNum()+reportCountGM.getCountIdNoPassNum()+reportCountGM.getCountContractPassNum()+reportCountGM.getCountContractNoPassNum())*100+"";
		 					 if(s.equals("100.0")){
		 						reportCountGM.setCount_id_pass_rate("100%");
		 					 }else{
		 						reportCountGM.setCount_id_pass_rate(s.substring(0, 2)+"%");
		 					 }
		 					 String r = (float)reportCountGM.getCountContractPassNum()/(reportCountGM.getCountIdPassNum()+reportCountGM.getCountIdNoPassNum()+reportCountGM.getCountContractPassNum()+reportCountGM.getCountContractNoPassNum())*100+"";
	 						 if(r.equals("100.0")){
	 							reportCountGM.setCount_contract_pass_rate("100%");
	 						 }else{
	 							reportCountGM.setCount_contract_pass_rate(r.substring(0, 2)+"%");
	 						 }
	 						 String i = key.toString();
	 						  m.put(i,reportCountGM);
				 }
				 //获取总的身份证、合同上交率
				 for(Object key : m.keySet()){
					 ReportCountGraduationMaterial reportCountGM = m.get(key);
 					 String s = (float)(reportCountGM.getCountIdPassNum()+reportCountGM.getCountIdNoPassNum())/(reportCountGM.getCount_group_count_number())*100+"";
 					 if(s.equals("100.0")){
 						reportCountGM.setCount_id_handin_rate("100%");
 					 }else{
 						reportCountGM.setCount_id_handin_rate(s.substring(0, 2)+"%");
 					 }
 					 String r = (float)(reportCountGM.getCountContractPassNum()+reportCountGM.getCountContractNoPassNum())/(+reportCountGM.getCount_group_count_number())*100+"";
						 if(r.equals("100.0")){
							reportCountGM.setCount_contract_handin_rate("100%");
						 }else{
							reportCountGM.setCount_contract_handin_rate(r.substring(0, 2)+"%");
						 }	 	 					
			 li.add((ReportCountGraduationMaterial)reportCountGM);
				 }
				return li;
			}			
			/**功能:获取分组数据
			 * by张超  2015/1/26
			 * @param List<ReportDetailGraduationMaterial> sqlDatas
			 * @return Map<Integer,ReportCountGraduationMaterial>
			 */
			private Map<String,ReportCountGraduationMaterial> getSumData(List<ReportDetailGraduationMaterial> sqlDatas){
				HashMap<String,ReportCountGraduationMaterial> r = new HashMap<String,ReportCountGraduationMaterial>();
				for(ReportDetailGraduationMaterial d : sqlDatas){
					ReportCountGraduationMaterial m = r.get(d.getGroup_id());
					//当分组人数为零时
					if(m==null){
						m = new ReportCountGraduationMaterial();
						m.setHead(d.getTrue_name());
						m.setGroup_number(new Integer(1));
						m.setGroup_name(d.getGroup_name());
						m.setHead(d.getTrue_name());
						if(d.getMaterials_type().equals("身份证")){					
							if(d.getCheck_state().equals("1")){
							m.setIdPassNum(new Integer(1));	
							m.setIdNoPassNum(new Integer(0));
							}
							else{
								m.setIdPassNum(new Integer(0));
								m.setIdNoPassNum(new Integer(1));
							}
						}
						else{
							if(d.getCheck_state().equals("1")){
							m.setContractPassNum(new Integer(1));
							m.setContractNoPassNum(new Integer(0));
							}
							else{
								m.setContractPassNum(new Integer(0));
								m.setContractNoPassNum(new Integer(1));
							}
						}						
						r.put(d.getGroup_id(), m);
					}
					else{
						m.setGroup_number(m.getGroup_number().intValue()+1);
						if(d.getMaterials_type().equals("身份证")){
							if(d.getCheck_state().equals("1")){
								m.setIdPassNum(m.getIdPassNum().intValue()+1);
							}
							else{
								m.setIdNoPassNum(m.getIdNoPassNum().intValue()+1);
							}
						 }
						  else{
							    if(d.getCheck_state().equals("1")){
							    m.setContractPassNum(m.getContractPassNum().intValue()+1);
							    }
							    else{
							    	m.setContractNoPassNum(m.getContractNoPassNum().intValue()+1);
							    }
						  }
						r.put(d.getGroup_id(), m);
				      }			
				}
				//获取总的分组人数
				for(String key : r.keySet()){
					ReportCountGraduationMaterial a = r.get(key);
					int group_count_number= groupMembersService.getStudentsSize(key);
					a.setGroup_count_number(group_count_number);			
				}
				return r;			
			}		
			
}