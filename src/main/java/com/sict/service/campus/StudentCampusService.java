package com.sict.service.campus;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.campus.StudentCampusDao;
import com.sict.service.StudentService;


/**
 * 功能：在校生相关的service,继承StudentService
 * 
 * */
@Repository(value = "studentCampusService")
@Transactional
public class StudentCampusService extends StudentService{
	@Autowired @Qualifier("studentCampusDao")
	private StudentCampusDao studentCampusDao;
	
	
}
