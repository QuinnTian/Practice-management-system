package com.sict.service;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.GroupsDao;
import com.sict.dao.InfoCheckRecordDao;
import com.sict.dao.PracticeTaskDao;
import com.sict.entity.InfoCheckRecord;
import com.sict.entity.PracticeTask;
import com.sict.util.Common;

/**
 * 功能：信息核对相关的service  by吴敬国20141123 *
 */
@Repository(value = "checkInfoService")
@Transactional
public class InfoCheckRecordService implements BasicService {
	@Autowired
	PracticeTaskDao practiceTaskDao;
	@Autowired
	GroupsDao groupsDao;
	@Autowired
	InfoCheckRecordDao infoCheckRecordDao;
	
	public List selectList(Object o) {
		return this.infoCheckRecordDao.selectList(o);
	}

	public Object insert(Object o) {
		int a = 0;
		InfoCheckRecord p = (InfoCheckRecord) o;
		p.setId(Common.returnUUID());
		a = infoCheckRecordDao.insert(p);
		DictionaryService.updateInfoCheckRecord(p);
		return a;
	}
	public int update(Object o) {
		int a = 0;
		InfoCheckRecord p = (InfoCheckRecord) o;
		a = infoCheckRecordDao.update(p);
		DictionaryService.updateInfoCheckRecord(p);
		return a;
	}
	public int delete(Object o) {
		int a = 0;
		InfoCheckRecord p = (InfoCheckRecord) o;
		a = infoCheckRecordDao.delete(p);
		DictionaryService.deleteInfoCheckRecord(p.getId());
		return a;
	}
	
	public Object selectByID(String id) {
		return this.infoCheckRecordDao.selectByID(id);
	}
	
	public Object insertOrUpdate(Object o) {
		return null;
	}
	public int selectCount(Object o) {
		return 0;
	}

		/**
		 * 根据教师id和年级 ，实习任务查询信息核对任务，操作实践任务表
		 * by吴敬国
		 * 2015-2-9
		 * @param	String tea_id,String grade,String praID
		 * @return List<PracticeTask>
		 */
		public List<PracticeTask> selectCheckInfoListByTeaIdAndGrade(String tea_id,String grade,String praID) {
			return practiceTaskDao.selectCheckInfoListByTeaIdAndGrade(tea_id,grade,praID);
		}
		/**
		 * 修改核对信息
		 * by楚晨晨
		 * 2015-2-9
		 * @param	InfoCheckRecord info
		 * @return int
		 */
		public int updateInfo(InfoCheckRecord info){
			Timestamp d = new Timestamp(System.currentTimeMillis());
			info.setCheck_time(d);
			return this.infoCheckRecordDao.updateInfo(info);
		}
		/**
		 * 根据老师的id和实践任务的id获取到相应的小组的学生的信息核对情况   吴敬国检查2015-6-4  没有方法调用，暂时保留
		 * by楚晨晨
		 * 2015-2-9
		 *   
		 * @param	String tea_id,String practice_id
		 * @return List<InfoCheckRecord>
		 */
			public List<InfoCheckRecord> selectStudentByteaID(String tea_id,String practice_id) {
				return this.infoCheckRecordDao.selectStudentByteaID(tea_id,practice_id);
			}
		/**
		 * 根据实践任务任务的id得到这个实践任务所有的信息核对任务的list
		 * bywjg
		 * 2015-2-9
		 * @param	String checktask_id
		 * @return List<InfoCheckRecord>
		 */
			public List<InfoCheckRecord> selectCheckInfoByChecktask_id(String checktask_id) {
				InfoCheckRecord checkinfo=new InfoCheckRecord();
				checkinfo.setChecktask_id(checktask_id);
				List<InfoCheckRecord> infocheckList=infoCheckRecordDao.selectList(checkinfo);
				return infocheckList;
			}
}
