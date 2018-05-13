package com.sict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.entity.Role;
import com.sict.entity.SummaryQnAnswer;
import com.sict.entity.User;

/**
 * 功能：相关的数据库操作 使用 @Repository 注释 RoleDao bywtt20141103 *
 * 
 * */
@Repository
public class RoleDao extends BasicDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 根据学院id和角色类型查询
	 * @param	String college_id,String role_type
	 * @return  List<Role>
	 */
	public List<Role> selectByCollegeId(String college_id,String role_type){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("college_id", college_id);
		map.put("role_type", role_type);
		return sqlSession.selectList("com.sict.dao.RoleDao.selectByCollegeId",map);
		
	}
	
	public int deleteById(String roleid){
		return sqlSession.delete("com.sict.dao.RoleDao.deleteById",roleid);
		
	}
	
	
	/**
	 * 根据角色的多个级别查询角色
	 * @param	String roleLevel1,String roleLevel2
	 * @return  List<Role>
	 */
	public List<Role> getRoleByRoleLevel(String roleLevel1,String roleLevel2){
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("roleLevel1", roleLevel1);
		map.put("roleLevel2", roleLevel2);
		return sqlSession.selectList("com.sict.dao.RoleDao.getRoleByRoleLevel",map);
		
	}
	
	/**
	 * 根据学院id查询学生全部角色 张文琪
	 * 
	 * @param String
	 *            college_id,String role_type
	 * @return List<Role>
	 */
	public List<Role> selectByOnlyCollegeId(String college_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("college_id", college_id);
		return sqlSession.selectList(
				"com.sict.dao.RoleDao.selectByOnlyCollegeId", map);

	}
	/**
	 * 根据UseID和Rolecode查询sj_Role表
	 * @param UseID  用户ID
	 * @param Rolecode 权限角色代码
	 * @return Role
	 * PS:贾建昶   2016年9月2日
	 */
    public Role selectRoleByUseID(String UseID,String Rolecode){
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("UseID", UseID);
    	map.put("Rolecode", Rolecode);
    	return sqlSession.selectOne("com.sict.dao.RoleDao.selectRoleByUseID", map);
    }
}
