package com.sict.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Cell;
import jxl.CellType;
import jxl.CellView;
import jxl.DateCell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.format.UnderlineStyle;
import jxl.format.VerticalAlignment;
import jxl.write.Alignment;
import jxl.write.Border;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.entity.ClassRoom;
import com.sict.entity.Company;
import com.sict.entity.Courses;
import com.sict.entity.EvalsIndex;
import com.sict.entity.GroupMembers;
import com.sict.entity.Org;
import com.sict.entity.Student;
import com.sict.entity.SummaryQuestion;
import com.sict.entity.TeaStu;
import com.sict.entity.Teacher;
import com.sict.entity.TeachingClass;
import com.sict.entity.TeachingClassMembers;
import com.sict.entity.TrainDetail;

@Repository(value = "excelService")
@Transactional
public class ExcelService {

	/*
	 * public static void main(String[] args) { writeExcel(); readExcel();
	 * updateExcel(); }
	 */
	public static void writeExcel() {
		try {
			// 打开文件
			WritableWorkbook book = Workbook.createWorkbook(new File("d:\\test.xls "));
			// 生成名为“第一页”的工作表，参数0表示这是第一页
			WritableSheet sheet = book.createSheet(" 第一页 ", 0);
			// 在Label对象的构造子中指名单元格位置是第一列第一行(0,0)
			// 以及单元格内容为test
			Label label = new Label(0, 0, " test ");

			// 将定义好的单元格添加到工作表中
			sheet.addCell(label);

			/*
			 * 生成一个保存数字的单元格 必须使用Number的完整包路径，否则有语法歧义 单元格位置是第二列，第一行，值为789.123
			 */
			jxl.write.Number number = new jxl.write.Number(1, 0, 555.12541);
			sheet.addCell(number);

			// 写入数据并关闭文件
			book.write();
			book.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/**
	 * 导出月总结文本题excle (按班级)
	 * 
	 * @param summaryQuestionList
	 */
	public void writeExcel(List<SummaryQuestion> sumQuesList, List<Map<String, String>> anwserList,
			HttpServletRequest request, HttpServletResponse response) {

		try {
			response.setContentType("application/vnd.ms-excel");
			response.addHeader("Content-Disposition", "attachment;filename=yzj.xls");
			OutputStream os = response.getOutputStream();
			// 打开文件
			WritableWorkbook book = Workbook.createWorkbook(os);

			// 生成名为“第一页”的工作表，参数0表示这是第一页
			WritableSheet sheet = book.createSheet("月总结导出", 0);
			CellView cellView = new CellView();
			cellView.setAutosize(true); // 设置自动大小
			// 在Label对象的构造子中指名单元格位置是第一列第一行(0,0)
			// 设置字体;
			WritableFont font1 = new WritableFont(WritableFont.ARIAL, 14, WritableFont.NO_BOLD, false,
					UnderlineStyle.NO_UNDERLINE, Colour.BLACK);
			WritableCellFormat cellFormat1 = new WritableCellFormat(font1);
			// 设置背景颜色;
			cellFormat1.setBackground(Colour.GREEN);
			// 设置边框;
			cellFormat1.setBorder(Border.ALL, BorderLineStyle.DASH_DOT);
			// 设置文字居中对齐方式;
			cellFormat1.setAlignment(Alignment.CENTRE);
			// 设置垂直居中;
			cellFormat1.setVerticalAlignment(VerticalAlignment.CENTRE);
			// 存放问题及表格位置
			Map<String, Integer> map = new HashMap<String, Integer>();
			List<String> list = new ArrayList<String>();
			// 保存学生id作为一个标示
			String stu_id = "";
			for (int i = 0; i < sumQuesList.size(); i++) {
				map.put(sumQuesList.get(i).getId(), (i + 1));
				list.add(sumQuesList.get(i).getId());
			}
			// 以及单元格内容为test 标题栏
			for (int i = 0; i < sumQuesList.size(); i++) {
				Label label = new Label((i + 1), 0, sumQuesList.get(i).getTitle(), cellFormat1); // 0行
																									// i
																									// 列
				sheet.setColumnView(i, cellView);// 根据内容自动设置列宽
				sheet.addCell(label);
			}
			Label label = new Label(0, 0, "班级", cellFormat1); // 0行 i列
			sheet.setColumnView(0, cellView);// 根据内容自动设置列宽
			sheet.addCell(label);

			// 行号(作为行号的标示)
			int b = 1;
			// 内容区
			for (int i = 0; i < anwserList.size(); i++) {
				if (i == 0) {
					stu_id = anwserList.get(i).get("stu_id");
					// 第一名学生的班级（固定写法）
					jxl.write.Label number1 = new jxl.write.Label(0, 1, anwserList.get(i).get("ORG_NAME"));
					sheet.addCell(number1);
				}
				String trueStu_id = anwserList.get(i).get("stu_id");
				// .....（同一个学生一行，不同换行）
				if (stu_id.equals(trueStu_id)) {
					// 判断该答案要放在哪列(根据key 找)
					String questID = anwserList.get(i).get("id");
					if (list.contains(questID)) {
						// ...找列
						int a = map.get(questID);

						jxl.write.Label number = new jxl.write.Label(a, b, anwserList.get(i).get("answertext"));
						sheet.addCell(number);
					}
				} else {
					// 判断该答案要放在哪列(根据key找)
					String questID = anwserList.get(i).get("id");
					stu_id = trueStu_id;
					if (list.contains(questID)) {
						// ...找列
						int a = map.get(questID);
						// 换行
						b = b + 1;
						jxl.write.Label number1 = new jxl.write.Label(0, b, anwserList.get(i).get("ORG_NAME"));
						sheet.addCell(number1);
						jxl.write.Label number = new jxl.write.Label(a, b, anwserList.get(i).get("answertext"));
						sheet.addCell(number);

					}
				}
			}
			// 写入数据并关闭文件
			book.write();
			book.close();
			os.close();
			response.flushBuffer();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/**
	 * 导出学生详情
	 * 
	 * @param summaryQuestionList
	 */
	public void writeStuExcel(List<Student> stulist, HttpServletRequest request, HttpServletResponse response) {

		try {
			response.setContentType("application/vnd.ms-excel");
			response.addHeader("Content-Disposition", "attachment;filename=xsxx.xls");
			OutputStream os = response.getOutputStream();
			// 打开文件
			WritableWorkbook book = Workbook.createWorkbook(os);

			// 生成名为“第一页”的工作表，参数0表示这是第一页
			WritableSheet sheet = book.createSheet("学生信息导出", 0);
			CellView cellView = new CellView();
			cellView.setAutosize(true); // 设置自动大小
			// 在Label对象的构造子中指名单元格位置是第一列第一行(0,0)
			// 设置字体;
			WritableFont font1 = new WritableFont(WritableFont.ARIAL, 14, WritableFont.NO_BOLD, false,
					UnderlineStyle.NO_UNDERLINE, Colour.BLACK);
			WritableCellFormat cellFormat1 = new WritableCellFormat(font1);
			// 设置背景颜色;
			cellFormat1.setBackground(Colour.GREEN);
			// 设置边框;
			cellFormat1.setBorder(Border.ALL, BorderLineStyle.DASH_DOT);
			// 设置文字居中对齐方式;
			cellFormat1.setAlignment(Alignment.CENTRE);
			// 设置垂直居中;
			cellFormat1.setVerticalAlignment(VerticalAlignment.CENTRE);

			// 以及单元格内容为test
			Label label1 = new Label(0, 0, "班级");
			Label label2 = new Label(1, 0, "姓名");
			Label label3 = new Label(2, 0, "学号");
			Label label4 = new Label(3, 0, "手机号");
			Label label5 = new Label(4, 0, "分组名称");
			Label label6 = new Label(5, 0, "指导老师");
			// 将定义好的单元格添加到工作表中
			sheet.addCell(label1);
			sheet.addCell(label2);
			sheet.addCell(label3);
			sheet.addCell(label4);
			sheet.addCell(label5);
			sheet.addCell(label6);
			// 以及单元格内容为test
			for (int i = 1; i < stulist.size(); i++) {
				Student stu = stulist.get(i);
				Label label = new Label(0, i, DictionaryService.findOrg(stu.getClass_id()).getOrg_name());
				Label label7 = new Label(1, i, stu.getTrue_name());
				Label label8 = new Label(2, i, stu.getStu_code());
				Label label9 = new Label(3, i, stu.getPhone());
				Label label10 = new Label(4, i, stu.getGroup_id());
				Label label11 = new Label(5, i, stu.getTemp3());
				sheet.addCell(label);
				sheet.addCell(label7);
				sheet.addCell(label8);
				sheet.addCell(label9);
				sheet.addCell(label10);
				sheet.addCell(label11);
			}
			// 写入数据并关闭文件
			book.write();
			book.close();
			os.close();
			response.flushBuffer();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/**
	 * 导出月总结文本题excle
	 * 
	 * @param summaryQuestionList
	 */
	public void writeExcel(List<SummaryQuestion> summaryQuestionList, HttpServletRequest request,
			HttpServletResponse response) {

		try {
			response.setContentType("application/vnd.ms-excel");
			response.addHeader("Content-Disposition", "attachment;filename=yzj.xls");
			OutputStream os = response.getOutputStream();
			// 打开文件
			WritableWorkbook book = Workbook.createWorkbook(os);

			// 生成名为“第一页”的工作表，参数0表示这是第一页
			WritableSheet sheet = book.createSheet("月总结导出", 0);
			CellView cellView = new CellView();
			cellView.setAutosize(true); // 设置自动大小
			// 在Label对象的构造子中指名单元格位置是第一列第一行(0,0)
			// 设置字体;
			WritableFont font1 = new WritableFont(WritableFont.ARIAL, 14, WritableFont.NO_BOLD, false,
					UnderlineStyle.NO_UNDERLINE, Colour.BLACK);
			WritableCellFormat cellFormat1 = new WritableCellFormat(font1);
			// 设置背景颜色;
			cellFormat1.setBackground(Colour.GREEN);
			// 设置边框;
			cellFormat1.setBorder(Border.ALL, BorderLineStyle.DASH_DOT);
			// 设置文字居中对齐方式;
			cellFormat1.setAlignment(Alignment.CENTRE);
			// 设置垂直居中;
			cellFormat1.setVerticalAlignment(VerticalAlignment.CENTRE);

			// 以及单元格内容为test
			for (int i = 0; i < summaryQuestionList.size(); i++) {
				Label label = new Label(i, 0, summaryQuestionList.get(i).getTitle(), cellFormat1);
				sheet.setColumnView(i, cellView);// 根据内容自动设置列宽
				sheet.addCell(label);
				List<String> qu = summaryQuestionList.get(i).getAnswerText();
				for (int j = 1; j < qu.size(); j++) {
					jxl.write.Label number = new jxl.write.Label(i, j, qu.get(j));
					sheet.addCell(number);
				}

			}
			// 写入数据并关闭文件
			book.write();
			book.close();
			os.close();
			response.flushBuffer();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public static void readExcel() {
		try {
			Workbook book = Workbook.getWorkbook(new File("d:\\test.xls "));
			// 获得第一个工作表对象
			Sheet sheet = book.getSheet(0);
			// 得到第一列第一行的单元格
			Cell cell1 = sheet.getCell(0, 0);
			String result = cell1.getContents();
			System.out.println(result);
			book.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public static void updateExcel() {
		try {
			// Excel获得文件
			Workbook wb = Workbook.getWorkbook(new File("d:\\test.xls "));
			// 打开一个文件的副本，并且指定数据写回到原文件
			WritableWorkbook book = Workbook.createWorkbook(new File("d:\\test.xls "), wb);
			// 添加一个工作表
			WritableSheet sheet = book.createSheet(" 第二页 ", 1);
			sheet.addCell(new Label(0, 0, " 第二页的测试数据 "));
			book.write();
			book.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/**
	 * 解析学生信息表
	 * 
	 * @param file
	 *            导入文件内容
	 * 
	 * */
	public static List<Student> AnalysisStudent(File file) {
		List<Student> s = new ArrayList<Student>();
		try {
			Workbook book = Workbook.getWorkbook(file);
			// 获得第一个工作表对象
			Sheet sheet = book.getSheet(0);

			for (int r = 1; r < sheet.getRows(); r++) {// 行
				int nullCell = 0;
				int c = 0;// 列
				String result = "";
				Student student = new Student();
				// 学号
				Cell cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();// 去首尾空格
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					student.setStu_code(result);
				// 姓名
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().replaceAll(" ", "");
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					student.setTrue_name(result);

				// 性别
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					student.setSex(result);
				// 身份证号
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					student.setId_card(result);

				// 手机号
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					student.setPhone(result);
				/*
				 * // 班级编号 cell1 = sheet.getCell(c++, r); result =
				 * cell1.getContents().trim(); if (result.equalsIgnoreCase(""))
				 * nullCell++; else student.setClass_id(result);//去首尾空格
				 */
				// 家庭住址
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					student.setHome_addr(result);
				// 家庭电话
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					student.setHome_phone(result);

				// 籍贯
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					student.setBirthplace(result);
				// qq号
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					student.setQqnum(result);
				// 邮箱
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					student.setEmail(result);
				// 空间主页
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase("")) {
					nullCell++;
				} else {
					student.setHomepage(result);
				}
				// 入学年份
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					student.setEntry_year(result);
				if (nullCell == 12)// 本行数据共读取了4个null
					break;
				else
					s.add(student);// 本行记录放入列表
			}
			book.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return s;
	}

	/*
	 * // 输出所有考生到Excel文件 public static void shuChuStudent(StudentService
	 * studentService,File file){ List<Student> sList =
	 * studentService.selectList(new Student());
	 * 
	 * try { // 打开文件 WritableWorkbook book = Workbook.createWorkbook(file); //
	 * 生成名为“考生信息”的工作表，参数0表示这是第一页 WritableSheet sheet = book.createSheet("学生信息",
	 * 0);
	 * 
	 * Label label = new Label(0, 0, "身份证号"); sheet.addCell(label);
	 * 
	 * label = new Label(1, 0, "姓名"); sheet.addCell(label);
	 * 
	 * label = new Label(2, 0, "班级"); sheet.addCell(label);
	 * 
	 * label = new Label(3, 0, "学号"); sheet.addCell(label);
	 * 
	 * label = new Label(4, 0, "籍贯"); sheet.addCell(label);
	 * 
	 * label = new Label(5, 0, "qq"); sheet.addCell(label);
	 * 
	 * int r = 1,c; for(Student s : sList){ c = 0;
	 * 
	 * label = new Label(c++, r, s.getId_card()+""); sheet.addCell(label); label
	 * = new Label(c++, r, s.getTrue_name()); sheet.addCell(label); label = new
	 * Label(c++, r, s.getClass_code()); sheet.addCell(label); label = new
	 * Label(c++, r, s.getStu_code()+""); sheet.addCell(label); label = new
	 * Label(c++, r, s.getBirthplace()); sheet.addCell(label); label = new
	 * Label(c++, r, s.getQqnum()+""); sheet.addCell(label);
	 * 
	 * 
	 * r++; } // for(c=0;c) // 在Label对象的构造子中指名单元格位置是第一列第一行(0,0) // 以及单元格内容为test
	 * 
	 * // 将定义好的单元格添加到工作表中
	 * 
	 * 
	 * 
	 * // * 生成一个保存数字的单元格 必须使用Number的完整包路径，否则有语法歧义 单元格位置是第二列，第一行，值为789.123
	 * 
	 * // jxl.write.Number number = new jxl.write.Number(1, 0, 555.12541); //
	 * sheet.addCell(number);
	 * 
	 * // 写入数据并关闭文件 book.write(); book.close();
	 * 
	 * } catch (Exception e) { System.out.println(e); } }
	 */
	/**
	 * 暂不清楚用途
	 * 
	 * @param file
	 *            导入文件内容
	 * 
	 * */
	public static List<TeaStu> AnalysisTeaStu(File file) {
		List<TeaStu> ts = new ArrayList<TeaStu>();
		try {
			Workbook book = Workbook.getWorkbook(file);
			// 获得第一个工作表对象
			Sheet sheet = book.getSheet(0);

			for (int r = 1; r < sheet.getRows(); r++) {// 行
				int nullCell = 0;// 存储空单元格的数量
				int c = 0;// 列
				String result = ""; // 存储单元格内容
				TeaStu t = new TeaStu();// 存储单行数据
				// 获取第一个单元格数据，即实习编号
				Cell cell1 = sheet.getCell(c++, r);// 取得第c列第r行单元格
				result = cell1.getContents();// 取值并赋值给result
				if (result.equalsIgnoreCase(""))// 判断相等，忽略大小写
					nullCell++;
				else
					t.setPractice_code(result);
				System.out.println(result);
				// 实习名称
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					t.setPractice_name(result);

				// 学号
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					t.setStu_code(result);

				// 姓名
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					t.setStu_name(result);
				// 开始时间
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					t.setBegin_time(result);
				// 截止时间
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					t.setEnd_time(result);
				// 班级编号
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					t.setClass_code(result);
				// 班级名称
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					t.setClass_name(result);
				// 教师编号
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					t.setTea_code(result);
				// 指导教师
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					t.setTea_name(result);
				System.out.println(result + "teaname");
				if (nullCell == 11)// 本行数据共读取了9个null
					break;
				else
					ts.add(t);// 本行记录放入列表

			}
			book.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return ts;

	}

	/**
	 * 暂不清楚用途
	 * 
	 * @param file
	 * @return
	 */
	public static List<Org> AnalysisClass(File file) {
		List<Org> tc = new ArrayList<Org>();
		try {
			Workbook book = Workbook.getWorkbook(file);
			// 获得第一个工作表对象
			Sheet sheet = book.getSheet(0);

			for (int r = 1; r < sheet.getRows(); r++) {// 行
				int nullCell = 0;// 存储空单元格的数量
				int c = 0;// 列
				String result = ""; // 存储单元格内容
				Org t = new Org();// 存储单行数据
				// 获取第一个单元格数据，即班级编号
				Cell cell1 = sheet.getCell(c++, r);// 取得第c列第r行单元格
				result = cell1.getContents().trim();// 取值并赋值给result
				if (result.equalsIgnoreCase(""))// 判断相等，忽略大小写
					nullCell++;
				else
					// 班级编号
					t.setOrg_code(result);
				System.out.println(result);
				// 组织名称
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().replaceAll(" ", "");

				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					t.setOrg_name(result);

				// 组织级别
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					t.setOrg_level(result);
				// 电话
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					t.setPhone(result);
				// 系部
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					t.setOrg_name(result);
				// 联系人
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					t.setContacts(result);
				if (nullCell == 6)// 本行数据共读取了7个null
					break;
				else
					tc.add(t);// 本行记录放入列表

			}
			book.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return tc;

	}

	/**
	 * 解析教师信息表
	 * 
	 * @param file
	 * @return
	 */
	public static List<Teacher> AnalysisTeacher(File file) {
		List<Teacher> tc = new ArrayList<Teacher>();
		try {
			Workbook book = Workbook.getWorkbook(file);
			// 获得第一个工作表对象
			Sheet sheet = book.getSheet(0);

			for (int r = 1; r < sheet.getRows(); r++) {// 行
				int nullCell = 0;// 存储空单元格的数量
				int c = 0;// 列
				String result = ""; // 存储单元格内容
				Teacher t = new Teacher();// 存储单行数据
				// 获取第一个单元格数据，即教师编号
				Cell cell1 = sheet.getCell(c++, r);// 取得第c列第r行单元格
				result = cell1.getContents().trim();// 取值并赋值给result
				if (result.equalsIgnoreCase(""))// 判断相等，忽略大小写
					nullCell++;
				else
					t.setTea_code(result);
				System.out.println(result);
				// 真实名字
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().replaceAll(" ", "");

				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					t.setTrue_name(result);

				// 性别
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					t.setSex(result);
				// 手机号
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					t.setPhone(result);
				/*
				 * // 部门编号 cell1 = sheet.getCell(c++, r); result =
				 * cell1.getContents().trim(); if (result.equalsIgnoreCase(""))
				 * nullCell++; else t.setDept_id(result);
				 */

				// 职责
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					t.setDuties(result);
				// 特长
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					t.setExpertise(result);
				// 所教课程
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					t.setCourse_id(result);

				if (nullCell == 7)// 本行数据共读取了7个null
					break;
				else
					tc.add(t);// 本行记录放入列表

			}
			book.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return tc;

	}

	/**
	 * 导入班级
	 * 
	 * @param file
	 * @return
	 */
	public static List<Org> AnalysisOrg(File file) {
		List<Org> classList = new ArrayList<Org>();
		try {
			Workbook book = Workbook.getWorkbook(file);
			// 获得第一个工作表对象
			Sheet sheet = book.getSheet(0);
			for (int r = 1; r < sheet.getRows(); r++) {// 行
				int nullCell = 0;// 存储空单元格的数量
				int c = 0;// 列
				String result = ""; // 存储单元格内容
				Org org = new Org();// 存储单行数据
				// 获取第一个单元格数据，即组织编码
				Cell cell1 = sheet.getCell(c++, r);// 取得第c列第r行单元格
				result = cell1.getContents().trim();// 取值并赋值给result
				if (result.equalsIgnoreCase(""))// 判断相等，忽略大小写
					nullCell++;
				else
					org.setOrg_code(result);
				// 组织名称
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					org.setOrg_name(result);
				// 辅导员姓名
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					org.setCounselorName(result);
				// 辅导员编码
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					org.setCounselor_code(result);

				// 班主任姓名
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					org.setHead_tea_Name(result);
				// 班主任编码
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					org.setHead_code(result);

				// 上级组织名称
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					org.setParentOngName(result);

				// 年级
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					org.setTime(result);

				if (nullCell == 8)// 本行数据共读取了10个null
					break;
				else
					classList.add(org);// 本行记录放入列表

			}
			book.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return classList;

	}

	// 联系电话
	/*
	 * cell1 = sheet.getCell(c++, r); result = cell1.getContents().trim(); if
	 * (result.equalsIgnoreCase("")) nullCell++; else org.setPhone(result);
	 */
	// 联系人所在系别：组织级别
	/*
	 * cell1 = sheet.getCell(c++, r); result = cell1.getContents().trim(); if
	 * (result.equalsIgnoreCase("")) nullCell++; else org.setOrg_level(result);
	 */
	// 联系人
	/*
	 * cell1 = sheet.getCell(c++, r); result = cell1.getContents().trim(); if
	 * (result.equalsIgnoreCase("")) nullCell++; else org.setContacts(result);
	 */
	// 联系人编码
	/*
	 * cell1 = sheet.getCell(c++, r); result = cell1.getContents().trim(); if
	 * (result.equalsIgnoreCase("")) nullCell++; else
	 * org.setContacts_code(result);
	 */

	/**
	 * 导入实训安排
	 * 
	 * @param file
	 * @return
	 */
	public static List<TrainDetail> AnalysisTrainDetail(File file) {
		List<TrainDetail> ts = new ArrayList<TrainDetail>();
		DateFormat format1 = new SimpleDateFormat("yyyy/MM/dd");
		Calendar ca = Calendar.getInstance();
		ca.set(Calendar.HOUR_OF_DAY, 0);
		ca.set(Calendar.MINUTE, 0);
		ca.set(Calendar.SECOND, 0);
		Timestamp stamp = new Timestamp(ca.getTime().getTime());
		// Timestamp tst = new Timestamp(System.currentTimeMillis());
		try {
			Workbook book = Workbook.getWorkbook(file);
			// 获得第一个工作表对象
			Sheet sheet = book.getSheet(0);

			for (int r = 1; r < sheet.getRows(); r++) {// 行
				int nullCell = 0;// 存储空单元格的数量
				int c = 0;// 列
				String result = ""; // 存储单元格内容
				TrainDetail t = new TrainDetail();// 存储单行数据

				// 获取第一个单元格数据，实训任务名称
				Cell cell1 = sheet.getCell(c++, r);// 取得第c列第r行单元格
				result = cell1.getContents().trim();// 取值并赋值给result,trim()去首尾空格。
				if (result.equalsIgnoreCase("")) {// 判断相等，忽略大小写
					nullCell++;
				} else {
					if (DictionaryService.findPracticeTaskByName(result) != null) {
						String practiceId = DictionaryService.findPracticeTaskByName(result).getId();
						t.setTask_id(practiceId);// 通过任务名称得到任务id，存入记录列中
					} else {
						t.setTask_id("null" + result);
					}
					System.out.println(result);
				}
				// 得到分组名称
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();// 去空
				if (result.equalsIgnoreCase("")) {
					nullCell++;
				} else {
					if (DictionaryService.findGroupByName(result) != null) {
						String groupId = DictionaryService.findGroupByName(result).getId();
						t.setGroup_id(groupId);// 得到分组名称，转换成小组id存入表记录列中
					} else {
						t.setGroup_id("null" + result);
					}
				}
				// 课程名称
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase("")) {
					nullCell++;
				}
				// 得到课程编码
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase("")) {
					nullCell++;
				} else {
					if (DictionaryService.findCoursesByCode(result) != null) {
						String courseId = DictionaryService.findCoursesByCode(result).getId();
						t.setCourse_id(courseId);// 得到课程编码，得到课程id，存入记录列。
					} else {
						t.setCourse_id("null" + result);
					}
				}
				// 得到教工号
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase("")) {
					nullCell++;
				} else {
					if (DictionaryService.findTeacherByCode(result) != null) {
						String teacherId = DictionaryService.findTeacherByCode(result).getId();
						t.setTea_id(teacherId);// 通过教工号得到教工id存入记录列。。
					} else {
						t.setTea_id("null" + result);
					}
				}
				// 教师名称
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase("")) {
					nullCell++;
				}
				// 实训时间
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase("")) {
					nullCell++;
				} else {
					try {
						stamp = new Timestamp(format1.parse(result).getTime());
					} catch (ParseException e) {
						e.printStackTrace();
					}
					t.setTrain_time(stamp);
				}
				// 实训周次
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase("")) {
					nullCell++;
				} else {
					t.setWeek_num(Integer.parseInt(result));
				}
				// 实训节次
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase("")) {
					nullCell++;
				} else {
					t.setClass_num(result);
				}
				// 实训地点
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase("")) {
					nullCell++;
				} else {
					t.setTrain_place(result);
				}
				System.out.println(result + "teaname");

				if (nullCell == 10) {// 本行数据共读取了10个null
					break;
				} else {
					ts.add(t);// 本行记录放入列表
				}
			}
			book.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return ts;

	}

	/**
	 * 导入企业信息
	 * 
	 * @param file
	 * @return
	 */
	public static List<Company> AnalysisCompany(File file) {
		List<Company> cs = new ArrayList<Company>();
		try {
			Workbook book = Workbook.getWorkbook(file);
			// 获得第一个工作表对象
			Sheet sheet = book.getSheet(0);

			for (int r = 1; r < sheet.getRows(); r++) {// 行
				int nullCell = 0;
				int c = 0;// 列
				String result = "";
				Company company = new Company();
				// 企业所属的行业
				Cell cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();// 去首尾空格
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					company.setIndustry(result);
				// 适用的学院
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();// 去首尾空格
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					company.setApplicable_scope(result);
				// 企业名称
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();// 去首尾空格
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					company.setCom_name(result);
				// 企业代码
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();// 去首尾空格
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					company.setCom_code(result);

				// 企业短名
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();// 去首尾空格
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					company.setShort_name(result);
				// 联系人
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();// 去首尾空格
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					company.setContacts(result);

				// 联系电话
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					company.setPhone(result);
				// 企业地址
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();// 去首尾空格
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					company.setAddress(result);

				// email
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();// 去首尾空格
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					company.setEmail(result);
				if (nullCell == 9) {// 本行数据共读取了9个null
					break;
				} else {
					cs.add(company);// 本行记录放入列表
				}
			}
			book.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return cs;
	}

	/**
	 * 导入指标
	 * 
	 * @param file
	 * @return
	 */
	public static List<EvalsIndex> AnalysisEvalsIndex(File file) {
		List<EvalsIndex> eis = new ArrayList<EvalsIndex>();
		try {
			Workbook book = Workbook.getWorkbook(file);
			// 获得第一个工作表对象
			Sheet sheet = book.getSheet(0);

			for (int r = 1; r < sheet.getRows(); r++) {// 行
				int nullCell = 0;
				int c = 0;// 列
				String result = "";
				EvalsIndex evalsIndex = new EvalsIndex();
				// 指标编码
				Cell cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					evalsIndex.setIndex_code(result);

				// 指标名称
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					evalsIndex.setIndex_name(result);
				// 描述
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					evalsIndex.setDescription(result);

				// 分值
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				Double score = Double.parseDouble(result);
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					evalsIndex.setScore(score);
				// 标准名称
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					evalsIndex.setTemp2(result);
				if (nullCell == 5)// 本行数据共读取了4个null
					break;
				else
					eis.add(evalsIndex);// 本行记录放入列表
			}
			book.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return eis;
	}

	/**
	 * 导入分组的学生成员
	 * 
	 * @param file
	 * @return
	 */
	public static List<GroupMembers> AnalysisGroupMembers(File file) {
		List<GroupMembers> gms = new ArrayList<GroupMembers>();
		try {
			Workbook book = Workbook.getWorkbook(file);
			// 获得第一个工作表对象
			Sheet sheet = book.getSheet(0);
			for (int r = 1; r < sheet.getRows(); r++) {// 行
				int nullCell = 0;
				int c = 0;// 列
				String result = "";
				String stuId;
				GroupMembers groupMembers = new GroupMembers();
				// 班级
				Cell cell1 = sheet.getCell(c++, r);
				result = cell1.getContents();
				if (result.equalsIgnoreCase("")) {
					nullCell++;
				}
				// 姓名
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents();
				if (result.equalsIgnoreCase("")) {
					nullCell++;
				}
				// 学号
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();// trim去首尾空格，防止因为数据出错。
				if (result.equalsIgnoreCase("")) {
					nullCell++;
				} else {
					if (DictionaryService.findStudentByCode(result) != null) {
						stuId = DictionaryService.findStudentByCode(result).getId();
						groupMembers.setUser_id(stuId);
					} else {
						groupMembers.setUser_id(result + " 有误");
					}

				}
				// 小组名称
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();// trim去首尾空格，防止因为数据出错。
				if (result.equalsIgnoreCase("")) {
					nullCell++;
				} else {
					groupMembers.setTemp2(result);
				}
				if (nullCell == 4) {// 本行数据共读取了4个null
					break;
				} else {
					gms.add(groupMembers);// 本行记录放入列表
				}
			}
			book.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return gms;
	}

	/*
	 * 
	 * 
	 * 
	 * // 输出所有考生到Excel文件 public static List<Kaoshijilu>
	 * daoChuKaoShiJiLu(KaoshijiluService ksjlService,File file){
	 * List<Kaoshijilu> jlList = ksjlService.selectKaoshijilu();
	 * 
	 * try { // 打开文件 WritableWorkbook book = Workbook.createWorkbook(file); //
	 * 生成名为“考生信息”的工作表，参数0表示这是第一页 WritableSheet sheet = book.createSheet("考试记录",
	 * 0);
	 * 
	 * Label label = new Label(0, 0, "标识"); sheet.addCell(label); label = new
	 * Label(1, 0, "机器ip"); sheet.addCell(label); label = new Label(2, 0,
	 * "开始时间"); sheet.addCell(label); label = new Label(3, 0, "交卷时间");
	 * sheet.addCell(label); label = new Label(4, 0, "考生标识");
	 * sheet.addCell(label); label = new Label(5, 0, "考场标识");
	 * sheet.addCell(label); label = new Label(7, 0, "试卷标识");
	 * sheet.addCell(label); label = new Label(8, 0, "信息确认");
	 * sheet.addCell(label);
	 * 
	 * int r = 1,c; for(Kaoshijilu jl : jlList){ c = 0;
	 * 
	 * label = new Label(c++, r, ""+jl.getBiaoShi()); sheet.addCell(label);
	 * label = new Label(c++, r, jl.getJiQiIp()); sheet.addCell(label); label =
	 * new Label(c++, r, jl.getKaiShiShiJian()); sheet.addCell(label); label =
	 * new Label(c++, r, jl.getJiaoJuanShiJian()); sheet.addCell(label); label =
	 * new Label(c++, r, ""+jl.getStudentBiaoShi()); sheet.addCell(label); label
	 * = new Label(c++, r, ""+jl.getKaoChangBiaoShi()); sheet.addCell(label);
	 * label = new Label(c++, r, ""+jl.getShiJuanBiaoShi());
	 * sheet.addCell(label); label = new Label(c++, r, ""+jl.getXinXiQueRen());
	 * sheet.addCell(label);
	 * 
	 * r++; }
	 * 
	 * // 写入数据并关闭文件 book.write(); book.close();
	 * 
	 * } catch (Exception e) { System.out.println(e); } return jlList; }
	 * 
	 * public static List<Kaoshijilu> jieXiKaoShiJiLu(File file) {
	 * List<Kaoshijilu> jilus = new ArrayList<Kaoshijilu>(); try { Workbook book
	 * = Workbook.getWorkbook(file); // 获得第一个工作表对象 Sheet sheet =
	 * book.getSheet(0);
	 * 
	 * for (int r = 1; r < 5000; r++) { int nullCell = 0; int c = 0; String
	 * result = ""; Kaoshijilu jl = new Kaoshijilu();
	 * 
	 * // 标识 Cell cell1 = sheet.getCell(c++, r); result = cell1.getContents();
	 * if (result.equalsIgnoreCase("")) nullCell++;
	 * 
	 * // 机器ip cell1 = sheet.getCell(c++, r); result = cell1.getContents(); if
	 * (result.equalsIgnoreCase("")) nullCell++; else jl.setJiQiIp(result);
	 * 
	 * // 开始时间 cell1 = sheet.getCell(c++, r); result = cell1.getContents(); if
	 * (result.equalsIgnoreCase("")) nullCell++; else
	 * jl.setKaiShiShiJian(result);
	 * 
	 * // 交卷时间 cell1 = sheet.getCell(c++, r); result = cell1.getContents(); if
	 * (result.equalsIgnoreCase("")) nullCell++; else
	 * jl.setJiaoJuanShiJian(result);
	 * 
	 * // 考生标识 cell1 = sheet.getCell(c++, r); result = cell1.getContents(); if
	 * (result.equalsIgnoreCase("")) nullCell++; else
	 * jl.setStudentBiaoShi(Integer.parseInt(result));
	 * 
	 * // 考场标识 cell1 = sheet.getCell(c++, r); result = cell1.getContents(); if
	 * (result.equalsIgnoreCase("")) nullCell++; else
	 * jl.setKaoChangBiaoShi(Integer.parseInt(result));
	 * 
	 * // 试卷标识 cell1 = sheet.getCell(c++, r); result = cell1.getContents(); if
	 * (result.equalsIgnoreCase("")) nullCell++; else
	 * jl.setShiJuanBiaoShi(Integer.parseInt(result));
	 * 
	 * // 信息确认 cell1 = sheet.getCell(c++, r); result = cell1.getContents(); if
	 * (result.equalsIgnoreCase("")) nullCell++; else jl.setXinXiQueRen(result);
	 * 
	 * if (nullCell == 9) break; else jilus.add(jl); } book.close(); } catch
	 * (Exception e) { System.out.println(e); }
	 * 
	 * return jilus; }
	 * 
	 * // 输出所有考生成绩到Excel文件 public static void
	 * shuChuStudentChengJi(StudentService studentService,File file){
	 * List<StudentChengJi> ksChengJi = studentService.selectStudentChengJi();
	 * 
	 * try { // 打开文件 WritableWorkbook book = Workbook.createWorkbook(file); //
	 * 生成名为“考生信息”的工作表，参数0表示这是第一页 WritableSheet sheet = book.createSheet("考生信息",
	 * 0);
	 * 
	 * Label label = new Label(0, 0, "准考证号"); sheet.addCell(label);
	 * 
	 * label = new Label(1, 0, "身份证号"); sheet.addCell(label);
	 * 
	 * label = new Label(2, 0, "姓名"); sheet.addCell(label);
	 * 
	 * label = new Label(3, 0, "分数"); sheet.addCell(label);
	 * 
	 * label = new Label(4, 0, "未阅试题数"); sheet.addCell(label);
	 * 
	 * int r = 1,c; for(StudentChengJi ks : ksChengJi){ c = 0;
	 * 
	 * label = new Label(c++, r, ks.getZhunKaoZhengHao()); sheet.addCell(label);
	 * label = new Label(c++, r, ks.getShenFenZhangHao()); sheet.addCell(label);
	 * label = new Label(c++, r, ks.getXingMing()); sheet.addCell(label); label
	 * = new Label(c++, r, ks.getFenShu()); sheet.addCell(label); label = new
	 * Label(c++, r, ks.getXuYaoChongPing()); sheet.addCell(label);
	 * 
	 * r++; } // for(c=0;c) // 在Label对象的构造子中指名单元格位置是第一列第一行(0,0) // 以及单元格内容为test
	 * 
	 * // 将定义好的单元格添加到工作表中
	 * 
	 * 
	 * 
	 * 生成一个保存数字的单元格 必须使用Number的完整包路径，否则有语法歧义 单元格位置是第二列，第一行，值为789.123
	 * 
	 * // jxl.write.Number number = new jxl.write.Number(1, 0, 555.12541); //
	 * sheet.addCell(number);
	 * 
	 * // 写入数据并关闭文件 book.write(); book.close();
	 * 
	 * } catch (Exception e) { System.out.println(e); } }
	 */

	/*
	 * 功能：　将课程和 老师信息　都封装到老师对象里面 时间： 2016-03-22 作者： 鲁雪艳 注释： temp1 用户存放 错误信息
	 * temp2用于存放课程编号 temp3 用于存放课程名称
	 */
	public static List<Teacher> analysisTeaCourses(File file) {

		List<Teacher> teaList = new ArrayList<Teacher>();
		Teacher teacher = null;
		// TeaCourses teaCourses = null;
		try {
			Workbook book = Workbook.getWorkbook(file);
			// 获得第一个工作表对象
			Sheet sheet = book.getSheet(0);
			for (int r = 1; r < sheet.getRows(); r++) {// 行
				int nullCell = 0;
				int c = 0;// 列
				String result = "";
				// String courseId = null;
				// String teaId = null;
				String promptInfo = "";
				teacher = new Teacher();
				// teaCourses = new TeaCourses();
				// 课程编号
				Cell cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase("")) {
					nullCell++;
				} else {
					teacher.setTemp2(result);
					if (DictionaryService.findCoursesByCode(result) != null) {
						// courseId =
						// DictionaryService.findCoursesByCode(result).getId();
						// teaCourses.setCourses_id(courseId);
					} else {
						promptInfo = result + "课程编号在数据库中不存在";
						teacher.setTemp1(promptInfo);
					}
				}

				// 课程名称
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					teacher.setTemp3(result);

				// 教师名称
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();// trim去首尾空格，防止因为数据出错。
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					teacher.setTrue_name(result);

				// 教工号
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();// trim去首尾空格，防止因为数据出错。
				if (result.equalsIgnoreCase("")) {
					nullCell++;
				} else {
					teacher.setTea_code(result);
					if (DictionaryService.findTeacherByCode(result) != null) {
						/*
						 * teaId =
						 * DictionaryService.findTeacherByCode(result).getId();
						 * teaCourses.setTea_id(teaId); // 判断数据库中 老师是否有该课程 int
						 * num =
						 * teaCoursesService.selectList(teaCourses).size(); if
						 * (num > 0) { promptInfo = promptInfo + "," + result +
						 * "老师已经分配该课程"; teacher.setTemp1(promptInfo); }
						 */
					} else {
						promptInfo = promptInfo + "," + result + "教工编号在数据库中不存在";
						teacher.setTemp1(promptInfo);

					}
				}

				if (nullCell > 0)
					break;
				else
					teaList.add(teacher);
			}
			book.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		/*
		 * String promptInfo2 = ""; // 验证 用户导入数据表中否用重复数据 for (Teacher tea :
		 * teaList) { promptInfo2 = tea.getTemp1();
		 * 
		 * }
		 */
		return teaList;
	}

	public static List<Student> analysisStrUnionOrAssciationSutdent(File file) {
		List<Student> stuList = new ArrayList<Student>();
		try {
			Workbook book = Workbook.getWorkbook(file);
			Sheet sheet = book.getSheet(0);

			for (int r = 1; r < sheet.getRows(); r++) {// 行

				int nullCell = 0;
				int c = 0;// 列
				String result = "";

				Student student = new Student();
				// 学号
				Cell cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();// 去首尾空格
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					student.setStu_code(result);
				// 姓名
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().replaceAll(" ", "");
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					student.setTrue_name(result);

				// 性别
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					student.setSex(result);

				// 职责
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					student.setTemp2(result);
				// 是否为管理员权限
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					student.setTemp3(result);

				if (nullCell > 0)// 本行数据共读取了4个null
					break;
				else
					stuList.add(student);// 本行记录放入列表
			}
			book.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return stuList;
	}

	/**
	 * 功能：解析课程信息表的规则
	 * 
	 */
	public static List<Courses> analysisCourse(File file) {
		List<Courses> courseList = new ArrayList<Courses>();
		Courses courses = null;
		try {
			Workbook book = Workbook.getWorkbook(file);
			// 获得第一个工作表对象
			Sheet sheet = book.getSheet(0);
			for (int r = 1; r < sheet.getRows(); r++) {// 行
				int nullCell = 0;// 存储空单元格的数量
				int c = 0;// 列
				String result = "";// 存储单元格内容
				String promptInfo = "";// 存储单行数据
				courses = new Courses();
				// 课程编号
				Cell cell1 = sheet.getCell(c++, r);// 取得第c列第r行单元格
				result = cell1.getContents().trim();// 取值并赋值给result
				if (result.equalsIgnoreCase("")) {
					nullCell++;
				} else {
					courses.setCourse_code(result);
				}
				// 课程名称
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					courses.setCourse_name(result);
				// 组织名称
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();// trim去首尾空格，防止因为数据出错。
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					courses.setOrg_name(result);

				// 授课对象
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();// trim去首尾空格，防止因为数据出错。
				if (result.equalsIgnoreCase("")) {
					nullCell++;
				} else {
					courses.setClass_object(result);
				}
				if (nullCell == 4)
					break;
				else
					courseList.add(courses);
			}
			book.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return courseList;
	}

	/**
	 * 导入教室信息
	 * 
	 * @param file
	 *            导入文件内容
	 * 
	 * */
	public static List<ClassRoom> AnalysisClassRoom(File file) {
		List<ClassRoom> classRoom = new ArrayList<ClassRoom>();
		try {
			Workbook book = Workbook.getWorkbook(file);
			// 获得第一个工作表对象
			Sheet sheet = book.getSheet(0);
			for (int r = 1; r < sheet.getRows(); r++) {// 行
				int nullCell = 0;// 存储空单元格的数量
				int c = 0;// 列
				String result = ""; // 存储单元格内容
				ClassRoom cl = new ClassRoom();// 存储单行数据
				// Teacher tea=new Teacher();
				// 获取第一个单元格数据，即教室编号
				Cell cell1 = sheet.getCell(c++, r);// 取得第c列第r行单元格
				result = cell1.getContents().trim();// 取值并赋值给result

				if (result.equalsIgnoreCase(""))// 判断相等，忽略大小写
					nullCell++;
				else
					cl.setScr_code(result);
				System.out.println(result);
				// 教室名称
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().replaceAll(" ", "");

				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					cl.setScr_name(result);
				// 楼层
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					cl.setScr_floor(result);
				// 楼号
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				/* int i=Integer.parseInt(result); */
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					cl.setScr_num(result);
				// 可容纳人数
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					cl.setScr_capabilit(result);
				// 负责人教工号--暂时存放在temp2里面
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					cl.setTemp2(result);
				// 负责人
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					cl.setScr_contacat(result);
				// 配套描述
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					cl.setScr_devices(result);

				// 备注
				cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();
				if (result.equalsIgnoreCase(""))
					nullCell++;
				else
					cl.setScr_note(result);

				if (nullCell > 0)// 本行数据共读取了10个null
					break;
				else
					classRoom.add(cl);// 本行记录放入列表

			}
			book.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return classRoom;
	}

	/**
	 * 导入教学班信息
	 * 
	 * @param file
	 *            导入文件内容 temp1存放教工号 temp2存放教师姓名 temp3存放课程姓名 temp4存放课程编号
	 *            author:丁乐晓 time:2016-05-28
	 * 
	 * */
	public static List<TeachingClass> AnalysisTeachingClass(File file) {
		List<TeachingClass> teachingClass = new ArrayList<TeachingClass>();
		try {
			Workbook book = Workbook.getWorkbook(file);
			// 获得第一个工作表对象
			Sheet sheet = book.getSheet(0);
			System.out.println("---------------------------------" + sheet.getRows());
			for (int r = 1; r < sheet.getRows(); r++) {// 行
				int nullCell = 0;// 存储空单元格的数量
				int c = 0;// 列
				String result = ""; // 存储单元格内容
				TeachingClass tc = new TeachingClass();// 存储单行数据
				// 教工号
				Cell cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();// trim去首尾空格，防止因为数据出错。
				if (result.equalsIgnoreCase("")) {
					nullCell++;
				} else {
					if (DictionaryService.findTeacherByCode(result) != null) {
						String teaId = DictionaryService.findTeacherByCode(result).getId();
						tc.setTea_id(teaId);
						tc.setTemp1(result);
					} else {
						/*
						 * promptInfo = promptInfo + "," + result +
						 * "教工编号在数据库中不存在";
						 */tc.setTemp1(result);
					}
					// 教师名称
					cell1 = sheet.getCell(c++, r);
					result = cell1.getContents().trim();// trim去首尾空格，防止因为数据出错。
					if (result.equalsIgnoreCase("")) {
						nullCell++;
					} else {
						tc.setTemp2(result);
					}
					// 课程编号
					cell1 = sheet.getCell(c++, r);
					result = cell1.getContents().trim();
					if (result.equalsIgnoreCase("")) {
						nullCell++;
					} else {
						if (DictionaryService.findCoursesByCode(result) != null) {
							String courseId = DictionaryService.findCoursesByCode(result).getId();
							tc.setCourses_id(courseId);
							tc.setTemp4(result);
						} else {
							// /*promptInfo = result + "课程编号在数据库中不存在";
							tc.setTemp4(result);
						}
					}

					// 课程名称
					cell1 = sheet.getCell(c++, r);
					result = cell1.getContents().trim();
					if (result.equalsIgnoreCase("")) {
						nullCell++;
					} else {
						tc.setTemp3(result);
					}
					// 学时
					cell1 = sheet.getCell(c++, r);
					result = cell1.getContents().trim();
					if (result.equalsIgnoreCase(""))// 判断相等，忽略大小写
						nullCell++;
					else
						tc.setHours(Integer.parseInt(result));
					// 学分
					cell1 = sheet.getCell(c++, r);
					result = cell1.getContents().trim();
					if (result.equalsIgnoreCase(""))
						nullCell++;
					else
						tc.setCredit(Double.parseDouble(result));
					// 课程性质
					cell1 = sheet.getCell(c++, r);
					result = cell1.getContents().trim();
					if (result.equalsIgnoreCase(""))
						nullCell++;
					else
						tc.setCourses_type(result);
					// 开始日期
					cell1 = sheet.getCell(c++, r);
					result = cell1.getContents().trim();
					if (result.equalsIgnoreCase(""))
						nullCell++;
					else {
						if (cell1.getType() == CellType.DATE) {// 单元格的格式是否为日期格式
							if (result != null) {
								SimpleDateFormat ds = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
								DateCell dc = (DateCell) cell1;
								Date date = dc.getDate();
								Calendar ca = Calendar.getInstance();
								ca.setTime(date);
								ca.add(Calendar.HOUR, -8);// 解析excel的时候会默认当前输入的时间为格林威治时间，需要转为当前时区的时间（之前8小时）
								tc.setBegin_time(Timestamp.valueOf(ds.format(ca.getTime())));
							}
						}
					}
					// 周数描述
					cell1 = sheet.getCell(c++, r);
					result = cell1.getContents().trim();
					if (result.equalsIgnoreCase(""))
						nullCell++;
					else
						tc.setWeek_desc(result);
					// 上课班级
					cell1 = sheet.getCell(c++, r);
					result = cell1.getContents().trim();
					if (result.equalsIgnoreCase(""))
						nullCell++;
					// 教学班名称
					cell1 = sheet.getCell(c++, r);
					result = cell1.getContents().trim();
					if (result.equalsIgnoreCase(""))
						nullCell++;
					else
						tc.setTc_name(result);

					if (nullCell > 11)// 本行数据共读取了11个null
						break;
					else
						teachingClass.add(tc);// 本行记录放入列表

				}
			}
			book.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return teachingClass;
	}

	/**
	 * 导入教学班成员信息
	 * 
	 * @param file
	 *            导入文件内容 temp1存放学号 temp2存姓名 temp3存放学生班级 temp4存放教学班名称 author:丁乐晓
	 *            time:2016-05-28
	 * 
	 * */
	public static List<TeachingClassMembers> AnalysisTeaClassMember(File file) {
		List<TeachingClassMembers> teachingClassMembers = new ArrayList<TeachingClassMembers>();
		try {
			Workbook book = Workbook.getWorkbook(file);
			// 获得第一个工作表对象
			Sheet sheet = book.getSheet(0);
			for (int r = 1; r < sheet.getRows(); r++) {// 行
				int nullCell = 0;// 存储空单元格的数量
				int c = 0;// 列
				String result = ""; // 存储单元格内容
				TeachingClassMembers tcm = new TeachingClassMembers();// 存储单行数据
				// 学号
				Cell cell1 = sheet.getCell(c++, r);
				result = cell1.getContents().trim();// trim去首尾空格，防止因为数据出错。
				if (result.equalsIgnoreCase("")) {
					nullCell++;
				} else {
					if (DictionaryService.findStudentByCode(result) != null) {
						String stuId = DictionaryService.findStudentByCode(result).getId();
						tcm.setStudent_id(stuId);
						tcm.setTemp1(result);
					} else {
						/*
						 * promptInfo = promptInfo + "," + result +
						 * "教工编号在数据库中不存在";
						 */tcm.setTemp1(result);
					}
					// 姓名
					cell1 = sheet.getCell(c++, r);
					result = cell1.getContents().trim();// trim去首尾空格，防止因为数据出错。
					if (result.equalsIgnoreCase("")) {
						nullCell++;
					} else {
						tcm.setTemp2(result);
					}
					// 班级
					cell1 = sheet.getCell(c++, r);
					result = cell1.getContents().trim();
					if (result.equalsIgnoreCase("")) {
						nullCell++;
					} else {
						tcm.setTemp3(result);
					}

					// 教学班名称
					cell1 = sheet.getCell(c++, r);
					result = cell1.getContents().trim();
					if (result.equalsIgnoreCase("")) {
						nullCell++;
					} else {
						tcm.setTemp4(result);
					}

					if (nullCell > 4)// 本行数据共读取了4个null
						break;
					else
						teachingClassMembers.add(tcm);// 本行记录放入列表
				}
			}
			book.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return teachingClassMembers;
	}

	/*
	 * 
	 * 功能：读取xlsx文件 张文琪 2016-05-26
	 */
	public static List<Student> readXlsx(File file) throws IOException {
		InputStream is = new FileInputStream(file);
		XSSFWorkbook xssfWorkbook = new XSSFWorkbook(is);
		Student student = null;
		List<Student> list = new ArrayList<Student>();
		// Read the Sheet
		for (int numSheet = 0; numSheet < xssfWorkbook.getNumberOfSheets(); numSheet++) {
			XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(numSheet);
			if (xssfSheet == null) {
				continue;
			}

			// Read the Row Bug
			for (int rowNum = 1; rowNum <= xssfSheet.getLastRowNum(); rowNum++) {

				XSSFRow xssfRow = xssfSheet.getRow(rowNum);
				if (xssfRow != null) {
					student = new Student();
					XSSFCell xuehao = xssfRow.getCell(0);
					XSSFCell name = xssfRow.getCell(1);
					XSSFCell sex = xssfRow.getCell(2);
					XSSFCell shenfen = xssfRow.getCell(3);
					XSSFCell phone_self = xssfRow.getCell(4);
					XSSFCell address = xssfRow.getCell(5);
					XSSFCell phone_home = xssfRow.getCell(6);
					XSSFCell jiguan = xssfRow.getCell(7);
					XSSFCell qq = xssfRow.getCell(8);
					XSSFCell email = xssfRow.getCell(9);
					XSSFCell index = xssfRow.getCell(10);
					XSSFCell grade = xssfRow.getCell(11);
					student.setStu_code(getValue(xuehao));
					student.setTrue_name(getValue(name));
					student.setSex(getValue(sex));
					student.setId_card(getValue(shenfen));
					student.setPhone(getValue(phone_self));
					student.setHome_phone(getValue(phone_home));
					student.setHome_addr(getValue(address));
					student.setBirthplace(getValue(jiguan));
					student.setQqnum(getValue(qq));
					student.setEmail(getValue(email));
					student.setHomepage(getValue(index));
					student.setEntry_year(getValue(grade));
					list.add(student);

				}
			}
		}
		return list;
	}

	/*
	 * 
	 * 功能：将XSS数据转化成String 类型 张文琪 2016-05-26
	 */

	private static String getValue(XSSFCell xssfRow) {
		if (xssfRow.getCellType() == xssfRow.CELL_TYPE_BOOLEAN) {
			return String.valueOf(xssfRow.getBooleanCellValue());
		} else if (xssfRow.getCellType() == xssfRow.CELL_TYPE_NUMERIC) {
			return String.valueOf(xssfRow.getNumericCellValue());
		} else {
			return String.valueOf(xssfRow.getStringCellValue());
		}
	}
}
