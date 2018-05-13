package com.sict.entity;

import java.sql.Timestamp;

public class Files {
	private String id;
	private String file_name;//文件名称
	private String file_code;//文件编码
	private String file_type;//文件类型
	private Timestamp upload_time;//上传时间
	private String description;//描述
	private String position;//文件位置
	private float file_size;//文件大小
	private  String stu_id;//学生id
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_code() {
		return file_code;
	}
	public void setFile_code(String file_code) {
		this.file_code = file_code;
	}
	public String getFile_type() {
		return file_type;
	}
	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}
	public Timestamp getUpload_time() {
		return upload_time;
	}
	public void setUpload_time(Timestamp upload_time) {
		this.upload_time = upload_time;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public float getFile_size() {
		return file_size;
	}
	public void setFile_size(float file_size) {
		this.file_size = file_size;
	}
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	
}
