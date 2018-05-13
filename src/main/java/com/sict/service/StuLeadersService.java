package com.sict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.StuLeadersDao;
import com.sict.entity.Association;
import com.sict.entity.StuLeaders;
import com.sict.util.Common;

@Repository(value = "stuLeadersService")
@Transactional
public class StuLeadersService implements BasicService<StuLeaders> {
	@Autowired
	StuLeadersDao stuLeadersDao;

	public List<StuLeaders> selectList(StuLeaders t) {
		return stuLeadersDao.selectList(t);
	}

	public StuLeaders insert(StuLeaders t) {
		String now = Common.getNowTimeYearMonthDay();
		String month = now.substring(5, 7);
		int months = Integer.valueOf(month);
		if ((months >= 9 && months <= 12) || months == 1)
			t.setSsl_term("1");

		if (months > 1 && months <= 7)
			t.setSsl_term("2");

		t.setId(Common.returnUUID());
		t.setSsl_year(now.substring(0, 4));
		t.setBegin_time(Common.getNowTime());
		t.setSsl_create_time(Common.getNowTime());
		t.setState("1");
		stuLeadersDao.insert(t);

		return t;
	}

	public int update(StuLeaders t) {
		return stuLeadersDao.update(t);
	}

	public int delete(StuLeaders t) {
		return stuLeadersDao.delete(t);
	}

	public StuLeaders selectByID(String id) {

		return stuLeadersDao.selectByID(id);
	}

	// 暂时没有使用
	public StuLeaders insertOrUpdate(StuLeaders t) {
		return null;
	}

	public int selectCount(StuLeaders t) {
		return stuLeadersDao.selectCount(t);
	}

	// 通过年份和当前老师ID查出所对应的学生干部信息。
	public List<StuLeaders> selectListByCOUNSELOR_IDAndYear(String COUNSELOR_ID, String Year) {
		return this.stuLeadersDao.selectListByCOUNSELOR_IDAndYear(COUNSELOR_ID, Year);
	}

	/**
	 * 功能：查询学生会干部、社团干部所在的部门
	 * 
	 * @author 张向杨
	 * @createDate：2016年6月4日 上午8:18:40 @ param stuId 学生id @ param roleId 用户角色id
	 * @throws RuntimeException
	 * @return 学生所在的部门
	 */
	public Association getStuLeadersAssociation(String stuId, String roleId) {
		StuLeaders stuLeaders = new StuLeaders();
		stuLeaders.setSsl_stu_id(stuId);
		stuLeaders.setSsl_role_id(roleId);
		stuLeaders.setState("1");
		List<StuLeaders> stuLeaderList = stuLeadersDao.selectList(stuLeaders);
		if (stuLeaderList.size() == 0)
			throw new RuntimeException();
		return DictionaryService.findAssociation(stuLeaderList.get(0).getSsl_org_id());

	}
}
