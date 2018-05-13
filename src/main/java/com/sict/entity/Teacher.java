package com.sict.entity;

/**
 * 教师实体类.
 * 
 * @author wjg 
 * @createDate 2015-7-16
 * @since 5.0
 * 
 */
public class Teacher implements java.io.Serializable {

	// Fields

	private String id;
	/**
	 * 教师编号.
	 */
	private String tea_code;
	private String tea_type;//教师类型
	private String login_name;//登录名
	private String login_pass;//登录密码
	private String wx_code;//微信号
	private String true_name;//真实姓名
	private String sex;//性别
	private String phone;//联系电话
	private String dept_id;//部门id
	private String duties;//职务
	private String expertise;//专长
	private String qqnum;//
	private String email;//
	private String homepage;//云空间主页
	private String state;//
	private String course_id;//教授课程id
	private String temp1;
	private String temp2;
	private String temp3;
	private String score;//用于存放教师的月工作量成绩
	private String parents_tea_id;//上级教师id
	// 月工作量统计用到
	//逻辑字段开始
	private String prac_id;//实习任务id
	private String qualifiedCount;//合格实习人数（合格实习人数以学生上传实习月总结并且老师已批阅的数量为准）
	private String studentSize;//教师所带的实习人数
	private String theoryApicScore;//教师完成度（实际工作量/理想工作量）
	private String yesOrNo;//教师是否上传月总结
	
	//逻辑字段结束
	
	public String getYesOrNo() {
		return yesOrNo;
	}
	public void setYesOrNo(String yesOrNo) {
		this.yesOrNo = yesOrNo;
	}
	public String getQualifiedCount() {
		return qualifiedCount;
	}
	public void setQualifiedCount(String qualifiedCount) {
		this.qualifiedCount = qualifiedCount;
	}
	public String getStudentSize() {
		return studentSize;
	}
	public void setStudentSize(String studentSize) {
		this.studentSize = studentSize;
	}
	public String getTheoryApicScore() {
		return theoryApicScore;
	}
	public void setTheoryApicScore(String theoryApicScore) {
		this.theoryApicScore = theoryApicScore;
	}
	public String getPrac_id() {
		return prac_id;
	}
	public void setPrac_id(String prac_id) {
		this.prac_id = prac_id;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getTea_type() {
		return tea_type;
	}
	public void setTea_type(String tea_type) {
		this.tea_type = tea_type;
	}
	public String getWx_code() {
		return wx_code;
	}
	public void setWx_code(String wx_code) {
		this.wx_code = wx_code;
	}
	public String getQqnum() {
		return qqnum;
	}
	public void setQqnum(String qqnum) {
		this.qqnum = qqnum;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTea_code() {
		return tea_code;
	}
	public void setTea_code(String tea_code) {
		this.tea_code = tea_code;
	}
	public String getLogin_name() {
		return login_name;
	}
	public void setLogin_name(String login_name) {
		this.login_name = login_name;
	}
	public String getLogin_pass() {
		return login_pass;
	}
	public void setLogin_pass(String login_pass) {
		this.login_pass = login_pass;
	}
	public String getTrue_name() {
		return true_name;
	}
	public void setTrue_name(String true_name) {
		this.true_name = true_name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getDept_id() {
		return dept_id;
	}
	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}
	public String getDuties() {
		return duties;
	}
	public void setDuties(String duties) {
		this.duties = duties;
	}
	public String getExpertise() {
		return expertise;
	}
	public void setExpertise(String expertise) {
		this.expertise = expertise;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCourse_id() {
		return course_id;
	}
	public void setCourse_id(String course_id) {
		this.course_id = course_id;
	}
	public String getTemp1() {
		return temp1;
	}
	public void setTemp1(String temp1) {
		this.temp1 = temp1;
	}
	public String getTemp2() {
		return temp2;
	}
	public void setTemp2(String temp2) {
		this.temp2 = temp2;
	}
	public String getTemp3() {
		return temp3;
	}
	public void setTemp3(String temp3) {
		this.temp3 = temp3;
	}
	
	public String getParents_tea_id() {
		return parents_tea_id;
	}
	public void setParents_tea_id(String parents_tea_id) {
		this.parents_tea_id = parents_tea_id;
	}
	@Override
	public String toString() {
		return "Teacher [id=" + id + ", tea_code=" + tea_code + ", tea_type="
				+ tea_type + ", login_name=" + login_name + ", login_pass="
				+ login_pass + ", wx_code=" + wx_code + ", true_name="
				+ true_name + ", sex=" + sex + ", phone=" + phone
				+ ", dept_id=" + dept_id + ", duties=" + duties
				+ ", expertise=" + expertise + ", qqnum=" + qqnum + ", email="
				+ email + ", homepage=" + homepage + ", state=" + state
				+ ", course_id=" + course_id + ", temp1=" + temp1 + ", temp2="
				+ temp2 + ", temp3=" + temp3 + ", score=" + score
				+ ", prac_id=" + prac_id + ", qualifiedCount=" + qualifiedCount
				+ ", studentSize=" + studentSize + ", theoryApicScore="
				+ theoryApicScore + ", yesOrNo=" + yesOrNo
				+ ", parents_tea_id=" + parents_tea_id + "]";
	}
	


}