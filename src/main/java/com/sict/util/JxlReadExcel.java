package com.sict.util;

import jxl.Workbook;
import java.io.*;
import jxl.Sheet;
import jxl.Cell;
import jxl.read.biff.BiffException;

public class JxlReadExcel {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String filepath = "C:\\demo.xls";
		try {
			Workbook workbook = Workbook.getWorkbook(new File(filepath));
			Sheet sheet = workbook.getSheet(0);
			// j为行数，getCell("列号","行号")
			for (int i = 1, j = sheet.getRows(); i < j; i++) {
				Cell c1 = sheet.getCell(0, i);
				String name = c1.getContents();
				Cell c2 = sheet.getCell(1, i);
				String score = c2.getContents();
				System.out.println(" 姓名:" + name + ",成绩:" + score);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (BiffException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
