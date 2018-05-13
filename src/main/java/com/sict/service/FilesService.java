package com.sict.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sict.common.Constant;
import com.sict.dao.FilesDao;
import com.sict.entity.Files;
import com.sict.util.Constants;
import com.sict.util.PropertiesUtil;

@Repository(value = "filesService")
public class FilesService implements BasicService {
	@Autowired
	FilesDao filesDao;

	public List<Files> selectList(Object o) {
		return this.filesDao.selectList(o);
	}
	public Object insert(Object o) {
		Files f=(Files) o;
		DictionaryService.updateFiles(f);
		return this.filesDao.insert(o);
	}

	public int update(Object o) {
		Files f=(Files) o;
		DictionaryService.updateFiles(f);
		return this.filesDao.update(o);

	}

	public int delete(Object o) {
		Files f=(Files) o;
		DictionaryService.deleteFiles(f.getId());
		return this.filesDao.delete(f.getId());
	}
	public Files selectByID(String id) {
		Files s= (Files) this.filesDao.selectByID(id);
		return s;
	}
	public Object insertOrUpdate(Object o) {

		return null;
	}

	public int selectCount(Object o) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteById(String id) {
		// TODO Auto-generated method stub
		return this.filesDao.deleteById(id);
	}

	public static String getZuoPinDirectory(HttpSession session,
			Integer kcBiaoShi, Integer ksBiaoShi) {
		PropertiesUtil pUtil = PropertiesUtil
				.createPropertiesUtil(Constant.UPLOADPATH_FILE);
		String uploadpath = session.getServletContext().getRealPath(
				pUtil.getProperty(Constant.UPLOADPATH_PATH));

		uploadpath += "\\";
		uploadpath += kcBiaoShi;
		uploadpath += "\\";
		uploadpath += ksBiaoShi;

		System.out.println("------:" + uploadpath);

		return uploadpath;
	}

	// path 最后要以 / 结尾  String path,  path +
	public void downloadfile(String fName, String path,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		java.io.BufferedInputStream bis = null;
		java.io.BufferedOutputStream bos = null;
		String downLoadPath = path + fName;
		System.out.println(downLoadPath);
		try {
			long fileLength = new File(downLoadPath).length();
			response.setContentType("application/x-msdownload;");
			response.setHeader("Content-disposition", "attachment; filename="
					+ new String(fName.getBytes("utf-8"), "ISO8859-1"));
			response.setHeader("Content-Length", String.valueOf(fileLength));
			bis = new BufferedInputStream(new FileInputStream(downLoadPath));
			bos = new BufferedOutputStream(response.getOutputStream());
			byte[] buff = new byte[2048];
			int bytesRead;
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (bis != null)
				bis.close();
			if (bos != null)
				bos.close();
		}
	}
	
	/**
	 * zcg 20141009 获取文件
	 * 
	 * @param file_id
	 * @return
	 */
	public Files getFile(String file_id) {
		Files file1 = new Files();
		file1 = (Files) this.filesDao.selectByID(file_id);
		return file1;
	}
	/**
	 * 楚晨晨 上传照片
	 * @param file_id
	 * @return
	 */
	public void insertFiles(Files files) {
		Timestamp d = new Timestamp(System.currentTimeMillis());
		files.setUpload_time(d);
		DictionaryService.updateFiles(files);
		this.filesDao.insertFiles(files);
	}
	/**
	 * 根据学号，查看学生照片根据学生学号  
	 * by 李俊泽 2014-12-13
	 * wjg 2015-6-20
	 * @param stu_code
	 * */
	public List<Map<String, String>> selectPhoto(String stu_code) {
		return this.filesDao.selectPhoto(stu_code);
	}

	/**
	 * 根据分组，教师ID，日期查询，查看学生照片 
	 *  李俊泽 2014-12-13
	 *  吴敬国 2015年6月20日
	 * @param tea_id ,begin_upload_time,end_upload_time,group_name
	 * */
	public List<Map<String, String>> selectPhotoList(String tea_id,String begin_upload_time, String end_upload_time, String group_name) {
		return this.filesDao.selectPhotoList(tea_id, begin_upload_time,end_upload_time, group_name);
	}

	/**
	 *根据学生id 查询学生的实习照片 
	 *by 2015-01-26 邢志武
	 *   wjg 2015-6-20
	 * */
	public List<Files> selectStuPhotoByStu_id(String stu_id) {
		return this.filesDao.selectStuPhotoByStu_id(stu_id);
	}
	
	/**
	 * @param start_time
	 * @param end_time
	 * @param tea_id
	 * @return
	 */
	public int getTeacherGuideCount(String start_time,String end_time,String pric) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start_time", start_time);
		map.put("end_time", end_time);
		map.put("pric", pric);
		return this.filesDao.getTeacherGuideCount(map);
	}
	
	/**
	 * 功能：删除文件表的数据，删除磁盘中的文件
	 * 吴敬国2015-10-7
	 * */
	public void deleteFile(String file_id,HttpServletRequest request) {
		if(file_id!=null){//try catch
			Files file=selectByID(file_id);
			delete(file);//删除数据库中表的数据
			String position=file.getPosition();
			String project_path = request.getSession().getServletContext().getRealPath("/");
			String real_path=Constants.FILE_ROUTE;
			String file_path =project_path+ real_path + position;
			File fie = new File(file_path); // 路径为文件且不为空则进行删除
			if (fie.isFile() &&fie.exists()) { 
				fie.delete();
			}
		}
	}
	
	/**
	 *根据帖子id查询文件
	 *by 2015-01-26 邢志武
	 *   wjg 2015-6-20
	 * */
	public List<Files> getFileByInid(String id) {
		return this.filesDao.getFileByInid(id);
	}
	
	
}
