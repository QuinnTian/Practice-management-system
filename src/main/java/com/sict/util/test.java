package com.sict.util;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.sict.entity.MailSenderInfo;
import com.sict.service.DictionaryService;

public class test {

	@Test
	public void test() {

		//List<String> teaStrList=practiceTaskService.getTeaIdByScope("dzxxxy");
		List<String> teaStrList=new ArrayList<String>();
		String t="674469477@qq.com";
		String t1="3164212745@qq.com";
		String t2="zhengcg007@163.com";
		String t3="243620572@qq.com";
		String t4="961116047@qq.com";
		String t5="1612684882@qq.com";
		String t6="936746728@qq.com";
		String t7="xuluda@163.com";
		teaStrList.add(t1);
		teaStrList.add(t2);
		teaStrList.add(t3);
		teaStrList.add(t4);
		teaStrList.add(t5);
		teaStrList.add(t6);
		teaStrList.add(t7);
		for(int i=0;i<teaStrList.size();i++){
			String address=teaStrList.get(i);
			if(address.length()>3){
				MailSenderInfo mailInfo = new MailSenderInfo();
				mailInfo.setMailServerHost("smtp.163.com");
				mailInfo.setMailServerPort("25");
				mailInfo.setValidate(true);
				mailInfo.setUserName("wugee513@163.com");
				mailInfo.setPassword("wugee6744");// 您的邮箱密码
				mailInfo.setFromAddress("wugee513@163.com");
				mailInfo.setToAddress(address);
				mailInfo.setSubject("我就是测试一下");
				mailInfo.setContent("我就是测试一下我就是测试一下我就是测试一下我就是测试一下我就是测试一下我就是测试一下我就是测试一下我就是测试一下我就是测试一下");
				// 这个类主要来发送邮件
				SimpleMailSender sms = new SimpleMailSender();
				sms.sendTextMail(mailInfo);// 发送文体格式
			}else{
				System.out.println("邮箱是空得~");		
			}
		}
		
	
	}

}
