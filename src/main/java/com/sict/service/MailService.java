package com.sict.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sict.entity.MailSenderInfo;
import com.sict.util.SimpleMailSender;



/*
 * 功能：管理员相关的service
 * 使用 @Repository 注释 TeacherDao
 * by郑春光20140910	 * 
 * 
 * */
@Service
public class MailService {
	@Resource
	TeacherService teacherService;
	@Resource
	PracticeTaskService practiceTaskService;
	
	/**
	 * 定期发送邮件给老师
	 */
	
	public void sendMail(){
		List<String> teaStrList=practiceTaskService.getTeaIdByScope("dzxxxy");
		for(int i=0;i<teaStrList.size();i++){
			String tea_id=teaStrList.get(i);
				String address=null;
				address=DictionaryService.findTeacher(tea_id).getEmail();
				if(address==null){
					address="0";
				}
			if(address.equals("0")){
				System.out.println("邮箱是空得~");	
			}else{
				MailSenderInfo mailInfo = new MailSenderInfo();
				mailInfo.setMailServerHost("smtp.163.com");
				mailInfo.setMailServerPort("25");
				mailInfo.setValidate(true);
				mailInfo.setUserName("wugee513@163.com");
				mailInfo.setPassword("wugee6744");// 您的邮箱密码
				mailInfo.setFromAddress("wugee513@163.com");
				mailInfo.setToAddress(address);
				mailInfo.setSubject("月总结通知");
				mailInfo.setContent("本月月总结已发布，请各位老师要求学生尽快完成");
				// 这个类主要来发送邮件
				SimpleMailSender sms = new SimpleMailSender();
				sms.sendTextMail(mailInfo);// 发送文体格式
			}
		}
		
	}
	
	
}
