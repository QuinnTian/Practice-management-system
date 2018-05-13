<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<title>角色模板添加</title>
<script type="text/javascript">
//ajax 获取系级别的老师
	function getSysMenu() {
		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "getSysMenuByRoletype.do?",
			data : getSend(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法
				showSysMenu(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
				}
			}
		});
	}
	function showSysMenu(ajaxData) {
		$("#sysMenu").html(ajaxData);
	}
	function getSend() {
		var val = $("#role_type").val();
		var dataSend = "role_type=" + val;
		return dataSend;
	}
	
	 function allSelect( name, value )
	{
		var selectedBox = $("tr[id="+name+"] input:checkbox");
		for(var i=0; i<selectedBox.length; i++)
		{
			selectedBox[i].checked = value;
		}
	}
	/* function getRoleCode() {
		var role_type = $("#role_type").val();
		var collegeCode = $("#collegeCode").val();
		var roletype;
		if(role_type=="2"){
			roletype="ROLE_TEACHER";
		}else if(role_type=="3"){
			roletype="ROLE_STUDENT";
		}else if(role_type=="4"){
			roletype="ROLE_LEADER";
		}else if(role_type=="5"){
			roletype="ROLE_COMPANY";
		}else {
			roletype="ROLE_OTHER";
		}
		
		var RoleCode=roletype+"_"+collegeCode+"_";
		$("#basicRole").val(RoleCode);
	} */
	
</script>
</head>
<body>
<h2 align='center'>角色模板添加</h2>
	<form name="form1" id="myform" method="post" action="doAddRoleTemplate.do">
		 <table border="0" width="1200">
			<tr>
				<td width="100">角色所属类别：</td>
				<td width="700">
				<select name="role_type" id="role_type" onchange="getSysMenu();">
						<option value="0">请选择</option>
						<option value="1">管理员ROLE_ADMIN_</option>
						<option value="2">教师ROLE_TEACHER_</option>
						<option value="4">领导ROLE_LEADER_</option>
						<option value="3">学生ROLE_STUDENT_</option>
						<option value="5">公司ROLE_COMPANY_</option>
				</select></td>
			</tr>
			<tr>
				<td width="100">角色编码：</td>
				<td width="900"><input type="text" name="role_code"  style="width:300px"/>
				<!-- <font>ROLE_ADMIN_ ROLE_TEACHER_ ROLE_LEADER_ ROLE_STUDENT_ ROLE_COMPANY_</font> -->
				</td>
			</tr>
			<tr>
				<td width="100">角色名称：</td>
				<td width="900"><input type="text" name="role_name" style="width:300px"/>
				</td>
			</tr>
			<tr>
				<td width="100">角色描述：</td>
				<td width="700"><input type="text" name="role_desc" style="width:600px" />
				</td>
			</tr>
			<tr>
				<td width="100">状态：</td>
				<td width="700">
				<select name="state" id="state">
						<option value="1">有效</option>
						<option value="2">无效</option>
				</select>
				</td>
			</tr>
		</table>
		<div id="sysMenu"></div>
		<div style="margin-top:20px;">
			<input type="submit" value="保存" />&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- <button type="button" onclick="window.location='./roleList.do'">返回</button> -->
		</div>
	</form>
	<div>
	ROLE_SYS_ADMIN			超级管理员<br/>
ROLE_ADMIN_SCHOOL      学校管理员<br/>
ROLE_ADMIN_COLLEGE      学院管理员<br/>
ROLE_ADMIN_DEPT      系部管理员<br/>
ROLE_ADMIN_EMPLOYMENT  学院就业管理员<br/>
ROLE_COMPANY_TEACHER    企业教师<br/>
------------------------------------ <br/>
ROLE_LEADER_ DEPT	  系级领导<br/>
ROLE_LEADER_COLLEGE	  院级领导<br/>
ROLE_LEADER_SCHOOL 	  校级领导<br/>
------------------------------------ <br/>
ROLE_TEACHER_COUNSELLOR 	辅导员<br/>
ROLE_TEACHER_HEADTEA    	班主任<br/>
ROLE_TEACHER_LESSON    	任课教师<br/>
ROLE_TEACHER_CONTEST    	大赛指导教师<br/>
ROLE_TEACHER_ASSOCIATION   学生社团指导教师<br/>
ROLE_TEACHER_PRACTICE		实习指导教师<br/>
------------------------------------ <br/>
ROLE_STUDENT_PRACTICE		校外实习学生<br/>
ROLE_STUDENT_SCHOOL	普通在校生<br/>
ROLE_STUDENT_ASSOCIATION_MANAGER 	学生社团 管理人员角色<br/>
ROLE_STUDENT_CLASS_MANAGER	班级管理人员<br/>
------------------------------------ <br/>
ROLE_STUDENT_UNION_MANAGER	    学生会  管理人员角色<br/>
ROLE_STUDENT_PRESIDIUM_MANAGER	    学生会主席团部长<br/>
ROLE_STUDENT_PRESIDIUM_MEMBER	    学生会主席团成员<br/>
ROLE_STUDENT_SECRETARIAT_MANAGER	    学生会秘书处部长<br/>
ROLE_STUDENT_SECRETARIAT_MEMBER	    学生会秘书处成员<br/>
ROLE_STUDENT_PE_MANAGER	   学生会体育部部长<br/>
ROLE_STUDENT_PE_MEMBER	   学生会体育部成员<br/>
ROLE_STUDENT_STUDY_MANAGER	    学生会学习部部长<br/>
ROLE_STUDENT_STUDY_MEMBER	    学生会学习部成员<br/>
ROLE_STUDENT_HOUSEPARENT_MANAGER	    学生会宿管部部长<br/>
ROLE_STUDENT_HOUSEPARENT_MEMBER	    学生会宿管部成员<br/>
ROLE_STUDENT_INSPECT_MANAGER	    学生会纪检部部长<br/>
ROLE_STUDENT_INSPECT_MEMBER	    学生会纪检部成员<br/>
	</div>
</body>
</html>





















