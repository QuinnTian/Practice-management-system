package com.sict.dao;

import java.lang.reflect.Field;

import com.sict.entity.StuLeaders;

public class Scq {

	/**
	 * @param args
	 */

	public static StringBuffer daoxml = new StringBuffer();
	public static String util = "com.sict.entity.StuLeaders";
	// 如：com.sict.entity.Teacher
	public static String bm = "sj_stu_leaders "; // 此处填数据库中的表名
	// 如：wjdc_user
	public static String dao = "com.sict.dao.StuLeadersDao";// 此处填dao的包名加类名

	// 如：com.sict.dao.TeacherDao

	public static void main(String[] args) {
		Object o = new StuLeaders();
		util = o.getClass().getCanonicalName();
		setAllComponentsName(o); // 此处new出实体类，如：new
									// Teacher()
	}

	public static String json(String key) {
		StringBuffer sb = new StringBuffer();
		sb.append("String " + key + " = jsonObject.getString(\"" + key + "\");");
		sb.append("\n");
		return sb.toString();
	}

	public static String selectKey(String key) {
		StringBuffer sb = new StringBuffer();

		sb.append("<if test=\"" + key + " != null\">");
		sb.append("\n");
		sb.append("and ");
		sb.append(key);
		sb.append(" = #{");
		sb.append(key + "}");
		sb.append("\n");
		sb.append("</if>");

		return sb.toString();
	}

	public static String selectInsertKey(String key, int num, int i) {
		StringBuffer sb = new StringBuffer();

		if (num == i) {
			sb.append(key);
		} else {
			sb.append(key + ",");
		}

		return sb.toString();
	}

	public static String selectInsert2Key(String key, int num, int i) {
		StringBuffer sb = new StringBuffer();

		if (num == i) {
			sb.append("#{" + key + "}");
		} else {
			sb.append("#{" + key + "},");
		}

		return sb.toString();
	}

	public static String UpdateKey(String key, int num, int i) {

		StringBuffer sb = new StringBuffer();
		sb.append("<if test=\"");
		sb.append(key);
		sb.append(" != null\">");
		sb.append(key);
		sb.append("=#{");
		sb.append(key);
		if (num == i) {
			sb.append("}</if>");
		} else {
			sb.append("},</if>");
		}
		sb.append("\n");
		return sb.toString();

	}

	public static void setAllComponentsName(Object f) {
		// 获取f对象对应类中的所有属性域
		Field[] fields = f.getClass().getDeclaredFields();
		StringBuffer sb = new StringBuffer();
		StringBuffer sb1 = new StringBuffer();
		StringBuffer sb2 = new StringBuffer();
		StringBuffer sb3 = new StringBuffer();
		StringBuffer sb4 = new StringBuffer();
		for (int i = 0, len = fields.length; i < len; i++) {
			// 对于每个属性，获取属性名
			String varName = fields[i].getName();
			try {
				// 获取原来的访问控制权限
				boolean accessFlag = fields[i].isAccessible();
				// 修改访问控制权限
				fields[i].setAccessible(true);
				// 获取在对象f中属性fields[i]对应的对象中的变量
				Object o = fields[i].get(f);
				// System.out.println("传入的对象中包含一个如下的变量：" + varName + " = " + o);

				sb.append(selectKey(varName));
				sb1.append(selectInsertKey(varName, fields.length, i + 1));
				sb2.append(selectInsert2Key(varName, fields.length, i + 1));
				sb3.append(UpdateKey(varName, fields.length, i + 1));
				sb4.append(json(varName));
				// System.out.println(selectInsert2Key(varName));
				// 恢复访问控制权限
				fields[i].setAccessible(accessFlag);
			} catch (IllegalArgumentException ex) {
				ex.printStackTrace();
			} catch (IllegalAccessException ex) {
				ex.printStackTrace();
			}
		}

		daoxml.append("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>    ");
		daoxml.append("\n");
		daoxml.append("<!DOCTYPE mapper    ");
		daoxml.append("\n");
		daoxml.append("    PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\"   ");
		daoxml.append("\n");
		daoxml.append("    \"http://mybatis.org/dtd/mybatis-3-mapper.dtd\">");
		daoxml.append("\n");

		daoxml.append("<mapper namespace=\"" + dao + "\">");
		sb.append("\n");

		daoxml.append("<insert id=\"insert\" parameterType=\"");
		daoxml.append(util);
		daoxml.append("\" statementType=\"" + "PREPARED" + "\">");
		daoxml.append("\n");
		daoxml.append("insert into ");
		daoxml.append(bm);
		daoxml.append("(");
		daoxml.append(sb1.toString());
		daoxml.append(")");
		daoxml.append("\n");
		daoxml.append("values (");
		daoxml.append(sb2.toString());
		daoxml.append(")");
		daoxml.append("\n");
		daoxml.append("</insert>");
		daoxml.append("\n");

		daoxml.append("<select id=\"select\" parameterType=\"");
		daoxml.append(util);
		daoxml.append("\" resultType=\"" + util + "\">");
		daoxml.append("\n");
		daoxml.append("select * from ");
		daoxml.append(bm);
		daoxml.append(" where 1 = 1 ");
		daoxml.append("\n");
		daoxml.append(sb.toString());
		daoxml.append("\n");
		daoxml.append("</select>");
		daoxml.append("\n");

		daoxml.append("<select id=\"selectCount\" parameterType=\"");
		daoxml.append(util);
		daoxml.append("\" resultType=\"" + "int" + "\">");
		daoxml.append("\n");
		daoxml.append("select count(*) from ");
		daoxml.append(bm);
		daoxml.append(" where 1 = 1 ");
		daoxml.append("\n");
		daoxml.append(sb.toString());
		daoxml.append("\n");
		daoxml.append("</select>");
		daoxml.append("\n");

		daoxml.append("<update id=\"update\" parameterType=\"");
		daoxml.append(util);
		daoxml.append("\">");
		daoxml.append("\n");
		daoxml.append("UPDATE ");
		daoxml.append(bm);
		daoxml.append("\n");
		daoxml.append("<set>");
		daoxml.append("\n");
		daoxml.append(sb3.toString());
		daoxml.append("\n");
		daoxml.append("</set>");
		daoxml.append("\n");
		daoxml.append(" WHERE id=#{id} ");
		daoxml.append("\n");
		daoxml.append("</update>");
		daoxml.append("\n");

		daoxml.append("<delete id=\"delete\" parameterType=\"");
		daoxml.append(util);
		daoxml.append("\">");
		daoxml.append("\n");
		daoxml.append("delete from ");
		daoxml.append(bm);
		daoxml.append(" where id=#{id}");
		daoxml.append("\n");
		daoxml.append("</delete>");
		daoxml.append("\n");

		daoxml.append("<select id=\"selectByID\" parameterType=\"");
		daoxml.append("String");
		daoxml.append("\" resultType=\"");
		daoxml.append(util);
		daoxml.append("\">");
		daoxml.append("\n");
		daoxml.append("select * from ");
		daoxml.append(bm);
		daoxml.append(" where id=#{id}");
		daoxml.append("\n");
		daoxml.append("</select>");
		daoxml.append("\n");

		daoxml.append("</mapper>");
		// System.out.println(sb.toString());
		// System.out.println(sb1.toString());
		// System.out.println(sb2.toString());
		// System.out.println(sb3.toString());
		// System.out.println(sb4.toString());

		System.out.println(daoxml.toString());
	}
}
