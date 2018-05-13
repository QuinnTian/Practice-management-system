package com.sict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.Company;
import com.sict.entity.RecruitInfo;

/**
 * 功能：企业相关的数据库操作 使用 @Repository 注释 CompanyDao by李瑶婷20141105 *
 * 
 * */
@SuppressWarnings("unused")
@Repository
public class CompanyDao extends BasicDao{

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Company> selectAllCompanys() {
		List<Company> list = sqlSession
				.selectList("com.sict.dao.CompanyDao.selectAllCompanys");
		return list;
	}
	/**
	 * 功能：微信
	 * by 晨晨
	 * @param 
	 * @return List<Company>
	 * */
	public List<Company> selectAllCompanysCheck() {
		List<Company> list = sqlSession
				.selectList("com.sict.dao.CompanyDao.selectAllCompanysCheck");
		return list;
	}
	/**
	 * 功能：楚晨晨 添加
	 * 
	 * */
	public int insertCompany(Company company) {
		return sqlSession.insert("com.sict.dao.CompanyDao.insert", company);
	}
	
	/**
	 * 功能：根据companys_id 显示创建企业的学生id
	 * by 邢志武 20141205
	 * @param companys_id
	 * @return com.sict.entity.Company
	 * */
	public String selectStuIdByCompanyId(String companys_id) {
		return sqlSession.selectOne("com.sict.dao.CompanyDao.selectStuIdByCompanyId", companys_id);
	}
	
	/**
	 * 功能：根据id更新企业表记录 company by 邢志武 20141205*
	 * 
	 * */
	public void updateCompany(Company company) {
		sqlSession.update("com.sict.dao.CompanyDao.update",company);
	}
	
	/**
	 * 功能：根据id 查找审核企业的教师id 
	 * by 邢志武 20141205
	 * @return *
	 *
	 * */
	public String selectCheckMan(String id) {
		return sqlSession.selectOne("com.sict.dao.CompanyDao.selectCheckManById",id);
	}
	/**
	 * 功能：微信
	 * by 晨晨
	 * @param 
	 * @return List<Company>
	 * */
	public List<Company> getCompany(String applicable_scope, String industry) {
		Map<String, String> p=new HashMap<String, String>();
		p.put("applicable_scope", applicable_scope);
		p.put("industry", industry);
		return sqlSession.selectList("com.sict.dao.CompanyDao.getCompanyByScopeAndInd", p);
	}
	
	/**
	 *功能：根据年份和学院得到所对应的企业信息
	 *2015年3月17日
	 *by王磊 
	 * 
	 * */
	public List<Company> selectCompanys(String industry,String xy_id,String content){
		Map<String, String> map=new HashMap<String, String>();
		map.put("industry", industry);
		map.put("xy_id", xy_id);
		map.put("content", content);
		return sqlSession.selectList("com.sict.dao.CompanyDao.getCompanys", map);
	}
	/**
	 *功能：根据院部id得到对应的企业
	 *2015年3月17日
	 *by王磊 
	 * 
	 * */
	public List<Company> getCompanysById(String id){
		return sqlSession.selectList("com.sict.dao.CompanyDao.getCompanysById", id);
	}
	/**
	 * @param industry
	 * @return
	 * 根据INDUSTRY 招聘信息 
	 * 邢志武 
	 * 2015年4月8日
	 */
	public List<RecruitInfo> getRecByIndustryAndDept_id(String industry,String dept_id){
		Map<String, String> map=new HashMap<String, String>();
		map.put("industry", industry);
		map.put("dept_id", dept_id);
		return sqlSession.selectList("com.sict.dao.CompanyDao.getRecByIndustryAndDept_id", map);
	}
	/**
	 * 根据岗位名称查寻招聘信息
	 * @param content
	 * @return
	 */
	public List<RecruitInfo> getRecByPostID(String postId){
		return sqlSession.selectList("com.sict.dao.CompanyDao.getRecByPostID", postId);
	}
	
	/**
	 * 根据专业或者企业名称或者岗位名称查询招聘信息
	 * @param recrut_prof
	 * 将三个查询改为一个  ymx
	 * @return
	 */
	public List<RecruitInfo> getRecByRecrut_profOrPostIDOrComName(String recrut_prof){
		return sqlSession.selectList("com.sict.dao.CompanyDao.getRecByRecrut_profOrPostIDOrComName", recrut_prof);
	}
	/**
	 * 根据专业查询招聘信息
	 * @param recrut_prof
	 * @return
	 */
	public List<RecruitInfo> getRecByRecrut_prof(String recrut_prof){
		return sqlSession.selectList("com.sict.dao.CompanyDao.getRecByRecrut_prof", recrut_prof);
	}
	/**
	 * 根据企业名查询招聘信息
	 * @param recrut_prof
	 * @return
	 */
	public List<RecruitInfo> getRecByComName(String comName){
		return sqlSession.selectList("com.sict.dao.CompanyDao.getRecByComName", comName);
	}
	/**
	 * 
	 * @param comName
	 * @return
	 * 模糊查询 前三十条 根据时间倒排序
	 */
	public List<Company> getSomeCompany(String comName){
		return sqlSession.selectList("com.sict.dao.CompanyDao.getSomeCompany", comName);
	}
	
	/**
	 * 根据公司的名称和适应的学院查询相应的公司记录
	 * @param String comName,String ApplicableScope
	 * @return List<Company>
	 * 吴敬国 2016-1-12
	 * 
	 */
	public List<Company> getCompanyByComNameAndApplicableScope(String comName,String ApplicableScope){
		Map<String, String> map=new HashMap<String, String>();
		map.put("comName", comName);
		map.put("ApplicableScope", ApplicableScope);
		return sqlSession.selectList("com.sict.dao.CompanyDao.getCompanyByComNameAndApplicableScope", map);
	}
	
	/**
	 * 根据学生ID查找企业
	 * 
	 * @param 学生ID
	 * @return 一条公司记录 李泽 2016/4/10
	 */
	public Company getCompanyByCompanyId(String companyId) {
		return sqlSession.selectOne("com.sict.dao.CompanyDao.getCompanyByCompanyId", companyId);
	}
	
	/**
	 * 根据行业id查找企业
	 * 周睿20160601
	 */
	public List<Company> getCompanyByIndustry(String industry) {
		return sqlSession.selectList("com.sict.dao.CompanyDao.getCompanyByIndustry", industry);
	}
	
}
