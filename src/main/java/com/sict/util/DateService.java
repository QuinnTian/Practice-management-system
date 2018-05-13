package com.sict.util;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class DateService {

	// 获取现在时间，格式化为 YYYY-MM-DD HH24:MI:SS 格式
	public static String formatNowTime() {
		Date date = new Date();
		SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String LgTime = sdformat.format(date);
		return LgTime;
	}

	// 计算时间间隔：时间为 YYYY-MM-DD HH24:MI:SS 格式,返回分钟数
	public static long minuteSpan(String sTime, String eTime) {
		long span = 0;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try {
			Date s = sdf.parse(sTime);
			Date e = sdf.parse(eTime);

			span = (e.getTime() - s.getTime()) / 1000 / 60;
		} catch (Exception e) {
			e.printStackTrace();
			span = -1;
		}
		return span;
	}

	// 计算到现在的时间间隔：时间为 YYYY-MM-DD HH24:MI:SS 格式,返回分钟数
	public static long minuteSpanToNow(String sTime) {
		long span = 0;

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try {
			Date s = sdf.parse(sTime);
			Date e = new Date();

			span = (e.getTime() - s.getTime()) / 1000 / 60;
		} catch (Exception e) {
			e.printStackTrace();
			span = -1;
		}
		return span;
	}
	
		/**
		 * 获取现在时间，格式化为  yyyyMMddHHmmss 格式
		 * by吴敬国2015-6-20
		 * 
		 * */
		public static String formatNowTimeforUpload() {
			Date date = new Date();
			SimpleDateFormat sdformat = new SimpleDateFormat("yyyyMMddHHmmss");
			String LgTime = sdformat.format(date);
			return LgTime;
		}
		
		/**
		 * 获取现在时间，返回值类型为Timestamp
		 * by吴敬国2015-6-20
		 * 
		 * */
		public static Timestamp getNowTimeTimestamp() {
			Date date = new Date();
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			ts = new Timestamp(date.getTime());
			return ts;
		}
		/**
		 * string类型的时间转成Timestamp
		 * by吴敬国2015-6-20
		 * @param String time
		 * @return Timestamp
		 * */
		public static Timestamp StringTimeTurnTimestamp(String time) {
			//SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			try {
				ts = Timestamp.valueOf(time);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return ts;
		}
		/**
		 * string类型的时间转成Timestamp
		 * @param String time
		 * @return Timestamp
		 * */
		public static Timestamp StringTimeTurnTimestamp2(String time) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			try {
				ts = new Timestamp(format.parse(time).getTime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			return ts;
		}
		/**
		 * 两个String时间类型转Timestamp  String的类型参数： yyyy-mm-dd hh:mm:ss
		 * @param String begin_Time,String end_Time
		 * @author 吴敬国
		 * @return Map<String, Timestamp>
		 * */
		public static Map<String, Timestamp> StringTimeTurnTimestamp(String begin_Time,String end_Time) {
			Map<String, Timestamp> map = new HashMap<String, Timestamp>();
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			try {
				ts = Timestamp.valueOf(begin_Time);
			} catch (Exception e) {
				e.printStackTrace();
			}
			//DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			//DateFormat format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Timestamp ts1 = new Timestamp(System.currentTimeMillis());
			try {
				ts1 = Timestamp.valueOf(end_Time);
			} catch (Exception e) {
				e.printStackTrace();
			}
			map.put("begin", ts);
			map.put("end", ts1);
			return map;
		}
		/**
		 * 两个String时间类型转Timestamp  String的类型参数： yyyy-mm-dd
		 * @param String begin_Time,String end_Time
		 * @author 吴敬国
		 * @return Map<String, Timestamp>
		 * */
		public static Map<String, Timestamp> StringTimeTurnTimestamp1(String begin_Time,String end_Time) {
			Map<String, Timestamp> map = new HashMap<String, Timestamp>();
			
			if (begin_Time == null) {
				begin_Time = "2010-01-01";
			}
			DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			try {
				ts = new Timestamp(format1.parse(begin_Time).getTime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			if (end_Time == null) {
				end_Time = "2010-01-01";
			}
			DateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
			Timestamp ts1 = new Timestamp(System.currentTimeMillis());
			try {
				ts1 = new Timestamp(format2.parse(end_Time).getTime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			map.put("begin", ts);
			map.put("end", ts1);
			return map;
		}
		/**
		 * Timestamp类型的时间转成string yyyy-MM-dd HH:mm:ss
		 * by吴敬国2015-8-18
		 * @param Timestamp time
		 * @return string
		 * */
		public static String TimestampTimeTurnString(Timestamp time) {
			 DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			 String tsStr = "";  
			try {
				tsStr = sdf.format(time);  
			} catch (Exception e) {
				e.printStackTrace();
			}
			return tsStr;
		}
		/**
		 * Timestamp类型的时间转成string yyyy-MM-dd
		 * by吴敬国2015-8-18
		 * @param Timestamp time 
		 * @return string
		 * */
		public static String TimestampTimeTurnStringTime(Timestamp time) {
			 DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			 String tsStr = "";  
			try {
				tsStr = sdf.format(time);  
			} catch (Exception e) {
				e.printStackTrace();
			}
			return tsStr;
		}
		/**
		 * Timestamp类型的时间转成string yyyy-MM-dd
		 * by吴敬国2015-8-18
		 * @param Timestamp time 
		 * @return string
		 * */
		/*public static String getMonthList(Timestamp time) {
			Calendar cal = Calendar.getInstance(); 
			int month = cal.get(Calendar.MONTH) + 1;
			String month1="";
			if(month<10){
				month1="0"+String.valueOf(month);
			}
			return tsStr;
		}*/
		
		
		
		

}
