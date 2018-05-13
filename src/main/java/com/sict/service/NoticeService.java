package com.sict.service;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.sict.dao.NoticeDao;
import com.sict.dao.StudentDao;
import com.sict.dao.TeacherDao;

import com.sict.entity.Notice;
import com.sict.entity.PracticeTask;
import com.sict.entity.Student;
import com.sict.entity.Teacher;
import com.sict.util.Common;

/**
 * 功能：通知相关的service 使用 @Repository 注释 TeacherDao by郑春光20140910 *
 * 
 * */
@Repository(value = "noticeService")
@Transactional
public class NoticeService implements BasicService {	
	@Autowired
	NoticeDao noticeDao;
	public List selectList(Object o) {
		return noticeDao.selectList(o);
	}

	public Object insert(Object o) {
		int a = 0;
		Notice p = (Notice) o;
		p.setId(Common.returnUUID());
		a = noticeDao.insert(p);
		DictionaryService.updateNotice(p);//更新查询操作
		return a;
	}

	public int update(Object o) {
		int a = 0;
		Notice p = (Notice) o;
		a = noticeDao.update(p);
		DictionaryService.updateNotice(p);
		return a;
	}

	public int delete(Object o) {
		int a = 0;
		Notice p = (Notice) o;
		a = noticeDao.delete(p);
		DictionaryService.deleteNotice(p.getId());
		return a;
	}

	public Object selectByID(String id) {
		return this.noticeDao.selectByID(id);
	}

	public Object insertOrUpdate(Object o) {
		return null;
	}
	public int selectCount(Object o) {
		return this.noticeDao.selectCount(o);
	}
	public Object selectByCode(String code) {
		return this.noticeDao.selectByCode(code);
	}
    /**
     * 功能：获取通知表中最大的通知编码
     * by王磊20150121
     * 
     * */
	public String getMaxNoticCode(String notice_cur_code){
		return this.noticeDao.getMaxNoticCode(notice_cur_code);
	}
	/**
     * 功能：通过招聘信息的id得到相关的通知详情
     * by吴敬国  2015-5-12
     * 
     * */
	public List<Notice> selectNoticeByRecruitId(String recruit_id,String tea_id){
		Notice n=new Notice();
		n.setTemp1(recruit_id);
		n.setNotice_type("5");
		n.setTea_id(tea_id);
		return this.noticeDao.selectList(n);
	}
	/**
	 * 查询通知
	 * 2015年6月30日19:07:52
	 * 邢志武
	 * @return
	 */
	public List<Notice> getNoticesList() {
		return noticeDao.getNoticesList();
	}
	
	/**
     * 功能：web 学生查看自己的的通知
     * by吴敬国 2015-9-15
     * 
     * */
	public List<Notice> stuGetMyNotice(String college_id,String stu_id) {
		return noticeDao.stuGetMyNotice(college_id,stu_id);
	}
	
	/**
     * 功能：web 学生查看自己的的通知
     * by吴敬国 2015-9-15
     * 
     * */
	public String getNoticeCode(String practice_id,String stu_id) {
		String notice_code = "";
		PracticeTask practice=DictionaryService.findPracticeTask(practice_id);
		Student stuent=DictionaryService.findStudent(stu_id);  
		String notice_cur_code=practice.getPractice_code()+stuent.getStu_code()+"SY";                                     
		String strNotice_max_code = getMaxNoticCode(notice_cur_code);
		if (strNotice_max_code == null) {//本任务的第一条通知
			notice_code = notice_cur_code + "001";
		} else {//不是第一条，取出最多通知编码的后三位，加2
			int maxCode = Integer.parseInt(strNotice_max_code) + 1;
			if (String.valueOf(maxCode).length() == 1) {//如果是个位数
				notice_code = notice_cur_code + "00" + maxCode;
			} else if (String.valueOf(maxCode).length() == 2) {//如果是两位位数
				notice_code = notice_cur_code + "0" + maxCode;
			} else {//如果是三位数
				notice_code = notice_cur_code + maxCode;
			}
		}
		return notice_code;
	}
	
	/**
     * 功能：教师得到学院的通知
     * by吴敬国 2015-10-7
     * 
     * */
	public List<Notice> getCollegeNoticeList(HttpSession session) {
		Notice n= new Notice();
		String college_id=(String) session.getAttribute("college_id");
		n.setNotice_type("1");
		n.setOrg_id(college_id);
		List<Notice> college_NoticeList= this.selectList(n);//得到学院的通知
		return college_NoticeList;
	}
	/**
     * 功能：教师得到自己发布的学院的通知
     * by吴敬国 2015-10-7
     * 
     * */
	public List<Notice> getCollegeNoticeListByteaid(HttpSession session) {
		Teacher tea = (Teacher) session.getAttribute("current_user");
		String tea_id = tea.getId();
		Notice n= new Notice();
		String college_id=(String) session.getAttribute("college_id");
		n.setNotice_type("1");
		n.setOrg_id(college_id);
		n.setTea_id(tea_id);
		List<Notice> college_NoticeList= this.selectList(n);//得到学院的通知
		return college_NoticeList;
	}
	
	
	
	
}
