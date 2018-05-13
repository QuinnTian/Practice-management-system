package com.sict.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.CompanyDao;
import com.sict.entity.Company;
import com.sict.entity.RecruitInfo;
import com.sict.util.Common;

/**
 * 功能：..相关的service 使用 @Repository 注释 CompanyDao by李瑶婷20141105 *
 * 
 * */
@Repository(value = "companyService")
@Transactional
public class CompanyService implements BasicService {

	@Autowired
	CompanyDao companyDao;

	public List selectList(Object o) {
		Company company = (Company) o;
		return companyDao.selectList(company);
	}

	public Object insert(Object o) {
		Company company = (Company) o;
		company.setId(Common.returnUUID());
		company.setState("1");
		DictionaryService.updateCompany(company);
		return companyDao.insert(company);
	}

	/*
	 * public Object update(Object o) { // TODO Auto-generated method stub
	 * Company company = (Company) o; companyDao.update(company); return null; }
	 */

	public int delete(Object o) {
		Company company = (Company) o;
		DictionaryService.deleteCompany(company.getId());
		return companyDao.delete(company);
	}

	public Object selectByID(String id) {
		return this.companyDao.selectByID(id);
	}
	public Object insertOrUpdate(Object o) {
		return null;
	}
	public int selectCount(Object o) {
		return this.companyDao.selectCount(o);
	}
	/**
	 * 功能：根据id更新企业表记录 company
	 * by 邢志武 20141205
	 * @param companys_id
	 * @return com.sict.entity.Company
	 * */
	public int update(Object o) {
		Company c = (Company) o;
		DictionaryService.updateCompany(c);
		companyDao.updateCompany(c);
		return 0;
	}
	/**
	 * 功能：楚晨晨
	 * 
	 * */
	public List<Company> selectAllCompanys() {
		return this.companyDao.selectAllCompanys();
	}
	/**
	 * 功能：楚晨晨
	 * 
	 * */
	public int insertCompany(Company company) {
		company.setId(Common.returnUUID());
		Timestamp d = new Timestamp(System.currentTimeMillis());
		company.setCreate_time(d);
		company.setState("1");
		DictionaryService.updateCompany(company);
		return this.companyDao.insertCompany(company);
	}
	/**
	 * 功能：根据companys_id 显示创建企业的学生id
	 * by 邢志武 20141205
	 * @param companys_id
	 * @return com.sict.entity.Company
	 * */
	public String selectStuIdByCompanyId(String companys_id) {
		return this.companyDao.selectStuIdByCompanyId(companys_id);
	}
	/**
	 * 功能：根据id 查找审核企业的教师id
	 * by 邢志武 20141205
	 * @param companys_id
	 * @return com.sict.entity.Company
	 * */
	public String selectCheckMan(String id) {
		return this.companyDao.selectCheckMan(id);
	}
	/**
	 * 功能：微信
	 * by 晨晨
	 * @param 
	 * @return List<Company>
	 * */
	public List<Company> selectAllCompanysCheck() {
		return this.companyDao.selectAllCompanysCheck();
	}
	/**
	 * 功能：微信
	 * by 晨晨
	 * @param 
	 * @return List<Company>
	 * */
	public List<Company> getCompany(String applicable_scope, String industry) {
		return this.companyDao.getCompany(applicable_scope, industry);
	}
	/**
	 * 功能：根据行业和学院得到所对应的企业信息 
	 * 2015年3月17日 by王磊
	 * 
	 * */
	public List<Company> selectCompanys(String industry, String xy_id,String content) {
		return this.companyDao.selectCompanys(industry, xy_id ,content );
	}
	/**
	 * 功能：根据院部id得到对应学院的企业 
	 * 2015年3月17日 by王磊
	 * 
	 * */
	public List<Company> getCompanysById(String id) {
		return this.companyDao.getCompanysById(id);
	}
	/**
	 * 功能：通过教师编号查询老师是否存在
	 * by王磊2015-3-23
	 *   wjg 2015-6-21改
	 * */
	public int selectByTeaCode(String com_code){
		Company company=new Company();
		company.setCom_code(com_code);
		int a=companyDao.selectCount(company);
		return a;
	}
	/**
	 * @param industry
	 * @return
	 * 根据INDUSTRY行业 显示企业信息 by 
	 * 邢志武 
	 * 2015年4月8日
	 * 吴敬国 2015-6-21改
	 * 周睿20160601修改
	 */
	public List<Company> getCompanyByIndustry(String industry) {
		return this.companyDao.getCompanyByIndustry(industry);
	}
	/**
	 * @param industry
	 * @return
	 * 根据INDUSTRY 查询公司id 
	 * 邢志武 
	 * 2015年4月8日
	 */
	public List<RecruitInfo> getRecByIndustryAndDept_id(String industry,String dept_id) {
		return this.companyDao.getRecByIndustryAndDept_id(industry,dept_id);
	}
	/**
	 * 根据岗位查询招聘信息 
	 * @param postId
	 * @return
	 * 邢志武
	 * 2015年5月18日 14:53:14
	 */
	public List<RecruitInfo> getRecByPostID(String postId) {
		return this.companyDao.getRecByPostID(postId);
	}
	/**
	 * 根据专业查询招聘信息 
	 * @param postId
	 * @return
	 * 邢志武
	 * 2015年5月18日 14:53:14
	 */
	public List<RecruitInfo> getRecByRecrut_prof(String recrut_prof) {
		return this.companyDao.getRecByRecrut_prof(recrut_prof);
	}
	/**
	 * 根据专业或者企业名称或者岗位名称查询招聘信息 
	 * @param postId
	 * @return
	 * 邢志武
	 * 2015年5月18日 14:53:14
	 */
	public List<RecruitInfo> getRecByRecrut_profOrPostIDOrComName(String recrut_prof) {
		return this.companyDao.getRecByRecrut_profOrPostIDOrComName(recrut_prof);
	}
	
	/**
	 * 根据企业名查询招聘信息 
	 * @param postId
	 * @return
	 * 邢志武
	 * 2015年5月18日 14:53:14
	 */
	public List<RecruitInfo> getRecByComName(String comName) {
		return this.companyDao.getRecByComName(comName);
	}
	/**
	 * 
	 * @param comName
	 * @return
	 * 模糊查询 前三十条 根据时间倒排序
	 */
	public List<Company> getSomeCompany(String comName) {
		return this.companyDao.getSomeCompany(comName);
	}
	
	/**
	 * 根据公司的名称和适应的学院查询相应的公司记录
	 * @param String comName,String ApplicableScope
	 * @return List<Company>
	 * 吴敬国 2016-1-12
	 * 
	 */
	public List<Company> getCompanyByComNameAndApplicableScope(String comName,String ApplicableScope) {
		return this.companyDao.getCompanyByComNameAndApplicableScope(comName,ApplicableScope);
	}
	
	/**
	 * 导入企业做的验证业务
	 * @param 
	 * @return 
	 * 吴敬国 2016-1-12
	 * 
	 */
	public List<Company> importCompany(List<Company> companys,String college_id) {
		String infor = "";// 声明变量，存储表格中未按要求的信息存储。
		List<String> comNameList = new ArrayList();// 声明集合，存储企业名称，为了验证表格中的企业名称是否重复。
		Company com = new Company();
		for (Company c : companys) {
			if (DictionaryService.getmapIndustryClassificationCode().get(c.getIndustry()) == null) {
				infor = infor + "没有此行业类型,";
			};
			String colinfor = "";
			int a = 0;
			if (c.getCom_name() == null) {
				infor = infor + "企业名称不能为空,";
			} else {
				List<Company> coms = this.getCompanyByComNameAndApplicableScope(c.getCom_name(),college_id);
				if (coms.size() > 0) {
					infor = infor + "企业已经存在,";
				}
			}
			;
			if (c.getApplicable_scope() == null) {
				infor = infor + "范围不能为空,";
			} else {
				String[] coll_id = c.getApplicable_scope().split(",");
				for (int i = 0; i < coll_id.length; i++) {
					if (DictionaryService.findOrgName(coll_id[i]) == null) {
						a = a + 1;
						colinfor = colinfor + ("该" + coll_id[i] + "不存在 ,");
					} else {
						if (!DictionaryService.findOrgName(coll_id[i]).getOrg_level().equals("2")) {
							colinfor = colinfor + ("此" + coll_id[i] + "不是学院级别,");
						}
					}
				}
				;
				if (colinfor.length() > 0) {
					infor = infor + colinfor;
				}
				;
			}
			if (c.getContacts() == null) {
				infor = infor + "联系人不能为空,";

			}
			;
			if (comNameList.size() != 0) {
				infor = infor + isCodeExist(c.getCom_name(),comNameList, "企业名称");
			}
			;
			if (c.getPhone() == null) {
				infor = infor + "联系电话不能为空,";
			}
			;
			if (c.getAddress() == null) {
				infor = infor + "企业地址不能为空,";
			}
			;
			if (infor.trim().equals("")) {
				infor = "无";
			}
			c.setTemp1(infor.trim());
			infor = "";
			if (c.getCom_name() != null) {
				comNameList.add(c.getCom_name());
			};
			
		}
		return companys;
	}
	
	/**
	 * 功能：检验编号是否在表格中是否重复 by王磊 2014/1/6
	 */
	public static String isCodeExist(String currentCode, List d, String souce) {
		int count = 0;
		String temp = "";
		for (int i = 0; i < d.size(); i++) {
			temp = (String) d.get(i);
			if (temp.equals(currentCode)) {
				count++;
			}
		}
		if (count > 0) {
			return "表格中" + souce + "列不能重复。";
		} else {
			return "";
		}
	}
	
	/**
	 * 根据企业ID查找企业
	 * 
	 * @param 企业ID
	 * @return 一条公司记录   李泽 2016/4/10
	 */
	public Company getCompanyByCompanyId(String companyId) {
		return companyDao.getCompanyByCompanyId(companyId);
	}

	
	
}
