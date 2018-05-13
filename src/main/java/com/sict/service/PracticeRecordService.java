package com.sict.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.PracticeRecordDao;
import com.sict.entity.GroupMembers;
import com.sict.entity.PracticeRecord;
import com.sict.entity.Student;
import com.sict.util.Common;

/**
 * 功能：..相关的service 使用 @Repository 注释 PracticeRecordDao by王磊20140927 *
 * 
 * */
@Repository(value = "practiceRecordService")
@Transactional
public class PracticeRecordService {
	@Autowired
	PracticeRecordDao practiceRecordDao;
	@Resource(name = "groupMembersService")
	private GroupMembersService groupMembersService;
	/**
	 * 注入practiceRecordService by王磊20140925 *
	 * 
	 * */
	@Resource(name = "practiceRecordService")
	private PracticeRecordService practiceRecordService;

	/**
	 * 功能实现查询实习记录
	 * 
	 * @param o
	 * @return
	 */
	public List<PracticeRecord> selectList(Object o) {
		PracticeRecord p = (PracticeRecord) o;
		return practiceRecordDao.getPracticeRecord(p);
	}

	/**
	 * 功能：查询审核通过或未通过申请记录
	 * 
	 * @param o
	 * @return
	 */
	public List selectListPart(Object o) {
		PracticeRecord p = (PracticeRecord) o;
		return practiceRecordDao.getPartPracticeRecord(p);
	}

	/**
	 * 功能实现审核功能
	 * 
	 * @param o
	 * @return
	 */
	public Object update(Object o) {
		PracticeRecord p = (PracticeRecord) o;
		practiceRecordDao.updatePracticeRecord(p);
		DictionaryService.updatePracticeRecord(p);
		return null;
	}

	public Object selectByID(String id) {
		return this.practiceRecordDao.selectById(id);
	}

	public int selectCount(Object o) {
		return this.practiceRecordDao.selectCount(o);
	}

	/**
	 * 功能实现查询实习记录by teaCode
	 * 
	 * @param String
	 *            teaCode
	 * @return List
	 */
	public List<PracticeRecord> selectListByTeaId(String tea_id) {
		return practiceRecordDao.selectListByTeaId(tea_id);

	}

	/**
	 * 功能：根据企业Id获得在企业实习的学生 by：孙磊 2015年5月26日
	 * 
	 */
	public int insertPracticeRecord(PracticeRecord practiceRecord) {
		practiceRecord.setId(Common.returnUUID());
		Timestamp d = new Timestamp(System.currentTimeMillis());
		practiceRecord.setApply_time(d);
		DictionaryService.updatePracticeRecord(practiceRecord);
		return this.practiceRecordDao.insertPracticeRecord(practiceRecord);
	}

	/**
	 * 
	 */
	public int updatePr(PracticeRecord practicerecord) {
		DictionaryService.updatePracticeRecord(practicerecord);
		return practiceRecordDao.updatetime(practicerecord);

	}

	/**
	 * 功能：根据企业Id获得在企业实习的学生 by：孙磊 2015年5月26日
	 * 
	 */
	public PracticeRecord selectByStu_id(String stu_id) {
		return this.practiceRecordDao.selectByStu_id(stu_id);
	}

	/**
	 * 
	 * @param stu_id
	 * @return 查询未结束的实习申请 邢志武 2015年6月30日 11:35:26
	 */
	public PracticeRecord getPrecordUndimission_time(String stu_id) {
		return this.practiceRecordDao.getPrecordUndimission_time(stu_id);
	}

	/**
	 * 根据实习任务的id得到这个任务的所有实习就业记录 by吴敬国 2015-3-27
	 * 
	 * @param String
	 *            practice_id
	 * @return List<PracticeRecord>
	 */
	public List<PracticeRecord> selectPracticeRecordByPracticeTaskId(
			String practice_id) {
		List<PracticeRecord> practiceRecordList = new ArrayList<PracticeRecord>();
		List<GroupMembers> studentList = groupMembersService
				.selectStuIdListByPracticeId(practice_id);
		for (GroupMembers gm : studentList) {
			PracticeRecord practiceRecord = practiceRecordDao
					.selectPracticeRecordByPracticeTaskId(practice_id,
							gm.getUser_id());
			if (practiceRecord != null) {
				practiceRecordList.add(practiceRecord);
			}
		}
		return practiceRecordList;
	}

	/**
	 * 功能：根据企业Id获得在企业实习的学生 by：孙磊 2015年5月26日
	 * 
	 */
	public List<PracticeRecord> selectPrecord(String stu_id) {
		return this.practiceRecordDao.selectPrecord(stu_id);
	}

	/**
	 * 功能：根据企业Id获得在企业实习的学生 by：孙磊 2015年5月26日
	 * 
	 */
	public List<PracticeRecord> selectPrecordByCheck_time(String stu_id,
			String practice_id) {
		return this.practiceRecordDao.selectPrecordByCheck_time(stu_id,
				practice_id);
	}

	/**
	 * 功能：根据学号选出实习申请 同时判断条件：是否审核 ccc 2015年1月19号
	 * 
	 */
	public PracticeRecord selectPrecordBypraid(String stu_id, String practice_id) {
		return this.practiceRecordDao.selectPrecordBypraid(stu_id, practice_id);
	}

	/**
	 * 功能：根据企业Id获得在企业实习的学生 by：孙磊 2015年5月26日
	 * 
	 */
	public int updatePracticeRecord(PracticeRecord practiceRecord) {
		return this.practiceRecordDao.updatePracticeRecord(practiceRecord);
	}

	/**
	 * 功能：根据学号选出实习申请 同时判断条件：是否离职 ccc 2015年1月19号实习状态时候用
	 * 
	 */
	public List<PracticeRecord> selectByStu_idDisstime(String stu_id) {
		return this.practiceRecordDao.selectByStu_idDisstime(stu_id);
	}

	/**
	 * 功能：根据学号和实习id得到该生的岗位信息 by王磊2015年5月22日
	 * 
	 */
	public PracticeRecord selectPost(String practice_id, String stu_id) {
		return this.practiceRecordDao.selectPost(practice_id, stu_id);
	}

	/**
	 * @author 王磊 2015年5月29日 通过实习id查出学生最近的一次就业记录情况
	 * @param 实习id
	 */
	public List<PracticeRecord> getPracticeRecord(String practice_id) {
		return this.practiceRecordDao.getPracticeRecord(practice_id);
	}

	/**
	 * 功能：根据企业Id获得在企业实习的学生 by：孙磊 2015年5月26日
	 * 
	 */
	public List<PracticeRecord> selectByComTeacherId(Map<String, Object> map) {
		return this.practiceRecordDao.selectByComTeacherId(map);
	}

	/**
	 * 功能： by：吴敬国 2015-6-24
	 * 
	 */
	public int updateComteacher(Map<String, Object> map) {
		return this.practiceRecordDao.updateComteacher(map);
	}

	/**
	 * 功能：查出学生的最近的实习记录根据学生id by：吴敬国 2015-6-24
	 * 
	 */
	public PracticeRecord selectPracticeRecordByStuId(String stu_id) {
		return this.practiceRecordDao.selectPracticeRecordByStuId(stu_id);
	}

	/**
	 * 功能：查出学生的最近的实习记录根据学生id by：吴敬国 2015-6-24
	 * 
	 */
	public List<PracticeRecord> selectCountPracticeRecordByStuId(String stu_id) {
		PracticeRecord practiceRecord = new PracticeRecord();
		practiceRecord.setStu_id(stu_id);
		return this.practiceRecordDao.selectList(practiceRecord);
	}

	/**
	 * 
	 * */
	public static Map<String, Object> getPracticeRecordListAndCount(
			List<PracticeRecord> practiceRecordList, String check_state) {

		Map<String, Object> map = new HashMap<String, Object>();
		List<PracticeRecord> modelList = new ArrayList<PracticeRecord>();
		int nonChecked = 0, Haspassed = 0, Nopassed = 0;
		for (PracticeRecord pr : practiceRecordList) {
			if (pr.getCheck_state().equals("0")
					&& pr.getDimission_time() == null) {
				// 未审核的个数
				nonChecked = nonChecked + 1;
			} else if (pr.getCheck_state().equals("1")) {
				// 审核通过的个数
				Haspassed = Haspassed + 1;
			} else if (pr.getCheck_state().equals("2")) {
				// 审核不通过的个数
				Nopassed = Nopassed + 1;
			}
			// 如果为0，要找到未审核的所有实习申请
			if (check_state.equals("0")) {
				if (pr.getCheck_state().equals("0")
						&& pr.getDimission_time() == null) {
					modelList.add(pr);
				}
			} else if (check_state.equals("1")) {
				if (pr.getCheck_state().equals("1")) {
					modelList.add(pr);
				}
			} else if (check_state.equals("2")) {
				if (pr.getCheck_state().equals("2")) {
					modelList.add(pr);
				}
			}
		}
		map.put("nonChecked", nonChecked);
		map.put("Haspassed", Haspassed);
		map.put("Nopassed", Nopassed);
		map.put("modelList", modelList);
		return map;
	}

	/**
	 * 功能：查出学生的最近的实习记录根据学生id by：吴敬国 2015-6-24
	 * 
	 */
	public int getUnCommitStuCount(String practice_id) {
		List<Student> studentList = groupMembersService
				.getStuListByPraId(practice_id);
		List<Student> unCommitStuList = new ArrayList<Student>();
		int num = 0;
		for (Student s : studentList) {
			List<PracticeRecord> practiceRecordList = practiceRecordService
					.selectCountPracticeRecordByStuId(s.getId());
			if (practiceRecordList.size() == 0) {
				num++;
			}
		}
		return num;
	}

	/**
	 * 功能：根据学号判断，是否有有效的实习任务
	 * 
	 */
	public PracticeRecord getValidPracticeTask(String stu_id) {
		PracticeRecord p = practiceRecordDao.getValidPracticeTask(stu_id);
		return p;
	}

	/**
	 * 功能：插入一条记录
	 */
	public Object insert(Object o) {
		int a = 0;
		PracticeRecord p = (PracticeRecord) o;
		a = this.practiceRecordDao.insertPracticeRecord(p);
		DictionaryService.updatePracticeRecord(p);
		DictionaryService.updatePracticeRecordByPrd(p);
		return a;
	}

	/**
	 * 根据实习任务ID，添加离职信息 李泽20160411
	 */
	public int resignBypracticeId(PracticeRecord practiceRecord) {
		return practiceRecordDao.resignBypracticeId(practiceRecord);
	}

	/**
	 * 根据学号查出学生通过审核的实习记录 李泽2016/4/12
	 * 
	 * @param stu_id
	 *            学生ID
	 * @return
	 */
	public PracticeRecord selectByStuid(String stu_id) {
		return practiceRecordDao.selectByStuid(stu_id);
	}
}
