package com.sict.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.Org;
import com.sict.entity.TreeNode;

/**
 * 功能：学生相关的数据库操作 使用 @Repository 注释 StudentDao by郑春光20140925 *
 * 
 * */
@Repository
public class OrgDao extends BasicDao<Org> {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 功能：没有备注，功能不明 楚晨晨微信端调用 吴敬国 2015-6-10 加的备注
	 * 
	 * */
	public Org selectOrgByCocde(String profession_code, String org_level) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("org_code", profession_code);
		param.put("org_level", Integer.parseInt(org_level));
		List<Org> list = sqlSession.selectList(
				"com.sict.dao.OrgDao.selectOrgByCocde", param);
		return list.get(0);
	}

	/**
	 * 功能： 通过系id和年级过滤班级 xzw 20150121
	 * 
	 * */
	public List<Org> getAllClassByGradeAndDeptId(String grade, String dept_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dept_id", dept_id);
		map.put("grade", grade);
		return sqlSession.selectList(
				"com.sict.dao.OrgDao.getAllClassByGradeAndDeptId", map);
	}

	/**
	 * 功能：目录树相关的数据库操作 20141129 *李瑶婷*
	 * 
	 * */
	public List<TreeNode> getOrgsByParent(String pid) {
		List<TreeNode> li = new ArrayList<TreeNode>();
		List<Object> orgs = sqlSession.selectList(
				"com.sict.dao.OrgDao.selectOrgsByParent", pid);
		for (Object o : orgs) {
			li.add((TreeNode) o);
		}
		return li;
	}

	public int checkdeptId(String deptId, String college_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("deptId", deptId);
		map.put("college_id", college_id);
		int count;
		count = sqlSession.selectOne("com.sict.dao.OrgDao.checkDeptId", map);
		return count;
	}

	/**
	 * 功能：通过学院id查出该院所有的系信息和本学院信息 by王磊 20150120
	 */
	public List<Org> selectByCollegeId(String collegeId) {
		return sqlSession.selectList("com.sict.dao.OrgDao.selectByCollegeId",
				collegeId);
	}

	/**
	 * 获取系及学院自身 by郑春光 2015-2-9
	 * 
	 * @param String
	 *            college_id
	 * @return List<Org>
	 */
	public List<Org> getOrgDeptByCollegeId(String college_id) {
		return sqlSession.selectList(
				"com.sict.dao.OrgDao.getOrgDeptByCollegeId", college_id);
	}

	/**
	 * 查询二级学院by ccc 20150317
	 * 
	 * @return List<Org>
	 */
	public List<Org> selectOrg_Code() {
		return sqlSession.selectList("com.sict.dao.OrgDao.selectCollege");
	}

	/**
	 * 功能：查询学院的id通过班级 by王磊 2015-3-19
	 */
	public String getCollegeIdByClassId(String class_id) {
		return sqlSession.selectOne(
				"com.sict.dao.OrgDao.getCollegeIdByClassId", class_id);
	}

	/**
	 * 查询全校的所有学院 邢志武 20150401
	 * 
	 * @return
	 */
	public List<String> getColleges() {
		return sqlSession.selectList("com.sict.dao.OrgDao.getColleges");
	}

	public String selectListByCode(String org_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".selectListByCode", org_code);
	}

	/**
	 * 功能：通过学院的id和年份得到这一年的所有班级 by wjg2015-4-13
	 */
	public List<Org> getClassByCollegesAndGrade(String coll_id, String grade) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("coll_id", coll_id);
		map.put("grade", grade);
		return sqlSession.selectList(
				"com.sict.dao.OrgDao.getClassByCollegesAndGrade", map);
	}

	/**
	 * 功能：通过学院id查出该所有的系 by王磊 20150118
	 */
	public List<Org> selectByXyId(String XyId) {
		return sqlSession.selectList("com.sict.dao.OrgDao.selectByXyId", XyId);
	}

	/**
	 * 获取班级的创建的年份
	 * 
	 * @author 王磊
	 * @param
	 * @return
	 */
	public List<String> getYears() {
		return sqlSession.selectList("com.sict.dao.OrgDao.getYears");
	}

	/**
	 * 根据班级id查询学院
	 * 
	 * @author
	 * @param
	 * @return
	 */
	public List<Org> selectCollegeByclassId(String class_id) {
		return sqlSession.selectList(
				"com.sict.dao.OrgDao.selectCollegeByclassId", class_id);
	}

	/**
	 * 系统管理员得到组织级别为0 1 2的所有组织和联系人
	 * 
	 * @param
	 * @return
	 */
	public List<Map<String, String>> getTopOrgListAndContacts() {
		return sqlSession
				.selectList("com.sict.dao.OrgDao.getTopOrgListAndContacts");
	}

	/**
	 * 功能：通过组织编号判断班级是否已存在 bysyj 20160326!!!!!!
	 */
	public int selectByOrgCode(String org_code) {
		int count;
		count = sqlSession.selectOne("com.sict.dao.OrgDao.selectByOrgCode",
				org_code);
		return count;
	}

	/**
	 * 功能：通过系统管理员ID查出所有组织和子组织 by 宋浩 20160324
	 */
	public List<Org> getOrgSon() {
		return sqlSession.selectList("com.sict.dao.OrgDao.getOrgSon");
	}

	/**
	 * 查询所有校级部门 by 师杰 20160321
	 */
	public List<String> selectSchoolOrg() {
		return sqlSession.selectList("com.sict.dao.OrgDao.selectSchoolOrg");
	}

	/**
	 * 功能：通过上级部门id查出该部门所有班级 by 李达、师杰 20160301
	 */
	public List<Org> selectClassByXyId(String Xy1Id) {
		return sqlSession.selectList("com.sict.dao.OrgDao.selectClassByXyId",
				Xy1Id);
	}

	/**
	 * 功能：查询所有的部门根据组织级别排序 by
	 */
	public List<Org> selectOrderByOrgLevel(Org org) {
		return sqlSession.selectList(
				"com.sict.dao.OrgDao.selectOrderByOrgLevel", org);
	}

	/**
	 * 根据父组织的id得到所有的子组织
	 */
	public List<Org> getChildOrgListByParentId(String parent_id) {
		return sqlSession.selectList(
				"com.sict.dao.OrgDao.getChildOrgListByParentId", parent_id);
	}

	/**
	 * 系统管理员得到组织级别为0 1 2 3的所有组织
	 */
	public List<Org> getAllOrg3() {
		return sqlSession.selectList("com.sict.dao.OrgDao.getAllOrg3");
	}

	
}
