package com.sict.service.campus;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.campus.AssociationDao;
import com.sict.entity.Association;
import com.sict.service.BasicService;
import com.sict.service.DictionaryService;

@Service
@Repository(value = "associationService")
@Transactional
public class AssociationService implements BasicService<Association> {

	@Autowired
	private AssociationDao associationDao;

	public List<Association> selectList(Association t) {

		return associationDao.selectList(t);
	}

	public Association insert(Association t) {
		associationDao.insert(t);
		DictionaryService.updateAssociation(t);
		return null;
	}

	public int update(Association t) {
		DictionaryService.updateAssociation(t);
		return associationDao.update(t);
	}

	public int delete(Association t) {
		DictionaryService.deleteAssociation(t.getId());
		return associationDao.delete(t);
	}

	public Association selectByID(String id) {

		return associationDao.selectById1(id);
	}

	public Association insertOrUpdate(Association t) {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectCount(Association t) {
		// TODO Auto-generated method stub
		return associationDao.selectCount(t);
	}

	public List<Association> SelectBySaCategory(Association asso) {
		return associationDao.SelectBySaCategory(asso);
	}

	/**
	 * 
	 */
	public int checkAssNameRepeat(String sa_name) {
		Association sa = new Association();
		sa.setSa_name(sa_name);
		int a = associationDao.selectCount(sa);
		return a;
	}

	/**
	 * 
	 */

	public Association selectMaxCode(String collage_id) {
		// TODO Auto-generated method stub
		return associationDao.selectMaxCode(collage_id);
	}

	public Association selectById1(String id) {
		// TODO Auto-generated method stub
		return associationDao.selectById1(id);
	}

	/**
	 * 功能：通过上级部门id查出该部门所有学生会 by 李达、师杰 20160329
	 */
	public List<Association> selectByParentId(String PraentId) {
		Association ass = new Association();
		ass.setSa_category("1");
		ass.setSa_parent_id(PraentId);
		return associationDao.selectList(ass);
	}
}
