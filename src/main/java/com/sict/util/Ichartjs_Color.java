package com.sict.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.math.RoundingMode;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.JsonEncoding;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.map.ObjectMapper;

import com.sict.entity.ChartData;
import com.sict.entity.ChartModel;
import com.sict.entity.StuGraStateCount;
import com.sict.service.DictionaryService;

public class Ichartjs_Color {

	public static List<String> Ichartjs_Color_List = getAll();
	
	public static List<String> getAll() {

		List<String> list = new ArrayList<String>();

		list.add("#8B0000");
		list.add("#8B2252");
		list.add("#00008B");
		list.add("#006400");

		list.add("#000080");
		list.add("#00868B");
		list.add("#458B00");
		list.add("#8B008B");
		
		list.add("#8B0000");
		list.add("#8B2252");
		list.add("#00008B");
		list.add("#006400");

		list.add("#000080");
		list.add("#00868B");
		list.add("#458B00");
		list.add("#8B008B");
		
		list.add("#8B0000");
		list.add("#8B2252");
		list.add("#00008B");
		list.add("#006400");

		list.add("#000080");
		list.add("#00868B");
		list.add("#458B00");
		list.add("#8B008B");
		
		list.add("#8B0000");
		list.add("#8B2252");
		list.add("#00008B");
		list.add("#006400");

		list.add("#000080");
		list.add("#00868B");
		list.add("#458B00");
		list.add("#8B008B");
		
		list.add("#8B0000");
		list.add("#8B2252");
		list.add("#00008B");
		list.add("#006400");

		list.add("#000080");
		list.add("#00868B");
		list.add("#458B00");
		list.add("#8B008B");
		
		list.add("#8B0000");
		list.add("#8B2252");
		list.add("#00008B");
		list.add("#006400");

		list.add("#000080");
		list.add("#00868B");
		list.add("#458B00");
		list.add("#8B008B");
		
		list.add("#8B0000");
		list.add("#8B2252");
		list.add("#00008B");
		list.add("#006400");

		list.add("#000080");
		list.add("#00868B");
		list.add("#458B00");
		list.add("#8B008B");
		
		list.add("#8B0000");
		list.add("#8B2252");
		list.add("#00008B");
		list.add("#006400");

		list.add("#000080");
		list.add("#00868B");
		list.add("#458B00");
		list.add("#8B008B");
		
		list.add("#8B0000");
		list.add("#8B2252");
		list.add("#00008B");
		list.add("#006400");

		list.add("#000080");
		list.add("#00868B");
		list.add("#458B00");
		list.add("#8B008B");
		
		
		return list;

	}
	/**
	 * 求各项的百分比，并转变成ChartModel by zcg 2015-2-6	
	 * @param List<Map<String, Object>> listStuState
	 * @return
	 */
	public static List<ChartData> getChartDataList(List<Map<String, Object>> listStuState) {
		double countAllStu=0;//总人数
		double countStu=0;//单个实习状态的人数
		double rate = 0;//单个状态的比例
		//ChartModel chartModel = new ChartModel();
		List<ChartData> listData = new ArrayList<ChartData>();
		NumberFormat nf = NumberFormat.getPercentInstance();//百分比
		nf.setMinimumFractionDigits(3);//设置保留小数位
		nf.setRoundingMode(RoundingMode.HALF_EVEN); //设置舍入模式
		
		//计算总人数
		for (Map<String, Object> m : listStuState) {
			countAllStu+=new Integer(m.get("stuCount").toString());
		}
		String percent ="";
		int i=0;
		//计算各项状态百分比，生成报表数据类型
		for (Map<String, Object> m : listStuState) {
			//单项状态人数
			countStu = new Integer(m.get("stuCount").toString());
			rate=countStu/countAllStu;
			percent = nf.format(rate);
			//生成报表数据对象，并添加到list
			listData.add(new ChartData(DictionaryService.findStuGraStateName(m.get("stateCode").toString()).getStateDesc(), percent,Ichartjs_Color.Ichartjs_Color_List.get(i),m.get("stateCode").toString()));
			i++;
		}
		
		
		
		//chartModel.setListData(listData);
		return listData;
	}

	/**
	 * 求各项的百分比，并转变成ChartModel by zcg 2015-2-6
	 * @param List<Map<String, Object>> listStuState
	 * @return
	 */
	public static ChartModel getChartModel(List<Map<String, Object>> listStuState) {
		double countAllStu=0;//总人数
		double countStu=0;//单个实习状态的人数
		double rate = 0;//单个状态的比例
		ChartModel chartModel = new ChartModel();
		List<ChartData> listData = new ArrayList<ChartData>();
		NumberFormat nf = NumberFormat.getPercentInstance();//百分比
		nf.setMinimumFractionDigits(3);//设置保留小数位
		nf.setRoundingMode(RoundingMode.HALF_EVEN); //设置舍入模式
		for (Map<String, Object> m : listStuState) {
			countAllStu+=new Integer(m.get("stuCount").toString());
		}
		String percent ="";
		int i=0;
		for (Map<String, Object> m : listStuState) {
			countStu = new Integer(m.get("stuCount").toString());
			rate=countStu/countAllStu;
			percent = nf.format(rate);
			ChartData c=new ChartData(m.get("stateCode").toString(), percent,Ichartjs_Color.Ichartjs_Color_List.get(i),DictionaryService.findStuGraStateName(m.get("stateCode").toString()).getStateDesc());
			listData.add(c);
			i++;
		}
		chartModel.setListData(listData);
		return chartModel;
	}
	/**
	 * 对象转换为json字符串数据 by zcg 2015-2-6
	 * @param object
	 * @return
	 * @throws IOException
	 * 
	 */
	public static String getJsonData(Object object) throws IOException{
		ByteArrayOutputStream os= new ByteArrayOutputStream();
		ObjectMapper objectMapper=new ObjectMapper();
		JsonGenerator jsonGenerator =objectMapper.getJsonFactory().createJsonGenerator(os,JsonEncoding.UTF8);
		jsonGenerator.writeObject(object);
		byte[] buf= os.toByteArray();//获得内存缓冲中的数据
		String strJson = new String(buf,"utf-8");
		return strJson;
	}

	/**
	 * 对象list转换为json字符串数据 by zcg 2015-2-11
	 * @param object
	 * @return
	 * @throws IOException
	 * 
	 */
	public static String getJsonDataByList(List<ChartData> listData) throws IOException{
		StringBuffer jsonChartData=new StringBuffer("[");
		for(Object chartData:listData)
		{//将对象转换为json字符串
			jsonChartData.append(Ichartjs_Color.getJsonData(chartData));
			jsonChartData.append(",");
		}
		String json=jsonChartData.toString().substring(0,jsonChartData.length()-1);
		json=json+"]";
		return json;
	}
	/**
	 * 计算单个状态学生的百分比 by郑春光	2015-2-6
	 * @param listStuStateCount
	 * @param stateCode
	 * @return String
	 */
	public static String getPercent(List<StuGraStateCount> listStuStateCount,String stateCode) {

		double rate = 0;//单个状态的比例
		String percent ="";//单个状态的百分比
		double countAllStu=0;//总人数
		NumberFormat nf = NumberFormat.getPercentInstance();//百分比
		nf.setMinimumFractionDigits(3);//设置保留小数位
		nf.setRoundingMode(RoundingMode.HALF_EVEN); //设置舍入模式
		for (StuGraStateCount stuCount : listStuStateCount) {
			countAllStu+=new Integer(stuCount.getStuCount());
		}
		for (StuGraStateCount stuCount : listStuStateCount) {
			if(stuCount.getStateCode().equals(stateCode))
			{
				rate=new Integer(stuCount.getStuCount())/countAllStu;
				percent = nf.format(rate);
			}
		}
		return percent;
	}

	/**
	 * 将带百分比的数据，转变成ChartModel 
	 * @param List<Map<String, Object>> listStuState
	 * @return
	 */
	public static ChartModel getChartModelByPercent(List<Map<String, Object>> listStuState) {
		ChartModel chartModel = new ChartModel();
		List<ChartData> listData = new ArrayList<ChartData>();
		int i=0;
		for (Map<String, Object> m : listStuState) {
			listData.add(new ChartData(DictionaryService.findOrg(m.get("deptId").toString()).getOrg_name(), m.get("percent").toString(),Ichartjs_Color.Ichartjs_Color_List.get(i),m.get("deptId").toString()));
			i++;
		}
		chartModel.setListData(listData);
		return chartModel;
	}
	/**
	 * 将带百分比的数据，转变成List<ChartData>2015-2-11 郑春光
	 * @param List<Map<String, Object>> listStuState
	 * @return
	 */
	public static List<ChartData> getChartModelJson(List<Map<String, Object>> listStuState) {
		List<ChartData> listData = new ArrayList<ChartData>();
		int i=0;
		for (Map<String, Object> m : listStuState) {
			listData.add(new ChartData(DictionaryService.findOrg(m.get("deptId").toString()).getOrg_name(), m.get("percent").toString(),Ichartjs_Color.Ichartjs_Color_List.get(i),m.get("deptId").toString()));
			i++;
		}
		return listData;
	}
	
	
	
	
}
