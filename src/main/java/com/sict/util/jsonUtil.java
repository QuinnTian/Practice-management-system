package com.sict.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import net.sf.json.JSONObject;

public class jsonUtil {
		//通过url返回json数据
		public static String getJsonBMap(String lat,String lon) throws IOException { 
			String AK = "XHDPar7ajC4hcnQZS5DPimj1"; 
		    String LOCATION = URLEncoder.encode(lat+","+lon, "utf-8"); 
		    String getURL = "http://api.map.baidu.com/geocoder/v2/?ak=" + AK + "&callback=renderReverse&location="+LOCATION+"&output=json&pois=1"; 
		    URL getUrl = new URL(getURL); 
		    HttpURLConnection connection = (HttpURLConnection) getUrl.openConnection(); 
		    connection.connect(); 

		    // 取得输入流，并使用Reader读取 
		    BufferedReader reader = new BufferedReader(new InputStreamReader( connection.getInputStream(), "utf-8")); 
		    StringBuffer sb = new StringBuffer(); 
		    String line = ""; 
		    while ((line = reader.readLine()) != null) { 
		        sb.append(line); 
		    } 
		    reader.close(); 
		    
		    String jsonString=sb.toString();
		    //截取json字符串
		    int a=jsonString.indexOf("(");
		    int b=jsonString.lastIndexOf(")");
		    jsonString=jsonString.substring(a+1,b);
		    connection.disconnect(); 
		    return jsonString;
			}
			//获取地点json对象
			public static JSONObject getJSONObject(String jsonString){
				 JSONObject json=JSONObject.fromObject(jsonString);
				 String resultString=json.getString("result");
				 JSONObject resultJson=JSONObject.fromObject(resultString);
				 String addressComponentString=resultJson.getString("addressComponent");
				 JSONObject addressComponentJson=JSONObject.fromObject(addressComponentString);
				 return addressComponentJson;
			}
			//根据经纬度得到所在地区（省）
			public static String getCityNameByLocation(String lat,String lon) throws Exception{
				String  jsonString=getJsonBMap(lat, lon);
				net.sf.json.JSONObject address=getJSONObject(jsonString);
				String city=(String) address.get("province");
				return city;
			}
			//根据经纬度得到所在地区（市）
			public static String getCityNameByLoc(String lat,String lon) throws Exception{
				String  jsonString=getJsonBMap(lat, lon);
				net.sf.json.JSONObject address=getJSONObject(jsonString);
				String city=(String) address.get("city");
				return city;
			}
}
