package com.sict.service;

import java.util.List;
import com.sict.service.DirectRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.sict.dao.EvalStuDao;
import com.sict.entity.EvalStu;

@Repository(value = "evalstuService")
@Transactional
public class EvalStuService implements BasicService {
	@Autowired
	private EvalStuDao evalstuDao;
	
	public List selectList(Object t) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object insert(Object t) {
		// TODO Auto-generated method stub
		return this.evalstuDao.insert(t);
	}

	public int update(Object t) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(Object t) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Object selectByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object insertOrUpdate(Object t) {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectCount(Object t) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<EvalStu> selectByStuid(String stu_id) {
		
		List<EvalStu> evalList=evalstuDao.selectByStuid(stu_id);
		for(EvalStu e:evalList){
			e.setTea_name(DictionaryService.findTeacher(e.getTea_id()).getTrue_name());
			e.setCompany_name(DictionaryService.findCompany(DictionaryService.findTeacher(e.getTea_id()).getDept_id()).getCom_name());
		}
		
		return evalList;
	}

}
