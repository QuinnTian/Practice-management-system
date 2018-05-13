package com.sict.util;

import java.io.FileWriter;
import java.io.PrintWriter;

public class OwnLog {
	public static void infoOut(String inf) {
		try {
			FileWriter fw = new FileWriter("c:/gaokao_log.txt", true); // 追加
			PrintWriter out = new PrintWriter(fw);
			out.println(DateService.formatNowTime() + ":" + inf);
			out.close();
			fw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
