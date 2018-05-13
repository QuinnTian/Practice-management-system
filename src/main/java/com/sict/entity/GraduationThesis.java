package com.sict.entity;

/**
 * SjGraduationThesis entity. @author MyEclipse Persistence Tools
 * 论文表，实训作品表
 */

public class GraduationThesis implements java.io.Serializable {

	// Fields
	private String id;
	private String practice_id;//任务id
	private String stu_id;//学生id
	private String type;//类型
	private String thesis_name;//论文名称
	private String version;//版本号
	private String thesis_desc;//描述
	private String file_id;//文件id
	private String create_time;//提交时间
	private String review_time;//审阅时间
	private String progress;//论文进展
	private String comment;//评语
	private String score_type;//分数类型
	private String score;//分数
	private String temp1;
	private String temp2;
	private String temp3;

	/**
	 * @return the temp1
	 */
	public String getTemp1() {
		return temp1;
	}

	/**
	 * @param temp1
	 *            the temp1 to set
	 */
	public void setTemp1(String temp1) {
		this.temp1 = temp1;
	}

	/**
	 * @return the temp2
	 */
	public String getTemp2() {
		return temp2;
	}

	/**
	 * @param temp2
	 *            the temp2 to set
	 */
	public void setTemp2(String temp2) {
		this.temp2 = temp2;
	}

	/**
	 * @return the temp3
	 */
	public String getTemp3() {
		return temp3;
	}

	/**
	 * @param temp3
	 *            the temp3 to set
	 */
	public void setTemp3(String temp3) {
		this.temp3 = temp3;
	}


	/**
	 * @return the thesis_desc
	 */
	public String getThesis_desc() {
		return thesis_desc;
	}

	/**
	 * @param thesis_desc
	 *            the thesis_desc to set
	 */
	public void setThesis_desc(String thesis_desc) {
		this.thesis_desc = thesis_desc;
	}



	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}

	/**
	 * @param type
	 *            the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param string
	 *            the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the version
	 */
	public String getVersion() {
		return version;
	}

	/**
	 * @param version
	 */
	public void setVersion(String version) {
		this.version = version;
	}

	/**
	 * @return the create_time
	 */
	public String getCreate_time() {
		return create_time;
	}

	/**
	 * @param create_time
	 *            the create_time to set
	 */
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

	public String getFile_id() {
		return file_id;
	}

	public void setFile_id(String file_id) {
		this.file_id = file_id;
	}

	public String getReview_time() {
		return review_time;
	}

	public void setReview_time(String review_time) {
		this.review_time = review_time;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}

	public String getScore_type() {
		return score_type;
	}

	public void setScore_type(String score_type) {
		this.score_type = score_type;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getThesis_name() {
		return thesis_name;
	}

	public void setThesis_name(String thesis_name) {
		this.thesis_name = thesis_name;
	}

	public String getPractice_id() {
		return practice_id;
	}

	public void setPractice_id(String practice_id) {
		this.practice_id = practice_id;
	}

	public String getStu_id() {
		return stu_id;
	}

	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}


}