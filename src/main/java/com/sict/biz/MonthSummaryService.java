package com.sict.biz;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.MonthSummaryDao;
import com.sict.dao.StudentDao;
import com.sict.entity.MonthSummary;
import com.sict.entity.Student;

@Service
public class MonthSummaryService {

	@Resource
	MonthSummaryDao monthSummaryDao;
	@Resource@Qualifier("studentDao")
	StudentDao studentDao;

	public List<MonthSummary> isMonthSummary(String time, String wx_code) {
		List<Student> stu = studentDao.selectByWx(wx_code);

		if (stu.size() == 1) {
			return this.monthSummaryDao.isMonthSummary(time, stu.get(0)
					.getStu_code());
		} else {
			return null;
		}

	}

	public void upPhoto(MonthSummary monthSummary) {

		this.monthSummaryDao.upPhoto(monthSummary);
	}
}
