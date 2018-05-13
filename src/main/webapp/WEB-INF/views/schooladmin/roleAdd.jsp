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
<title>用户角色添加</title>
<script type="text/javascript">
	$(function() {
		$("#college").hide();
	});
	
	function showCollege(){
		var roleType =$("#roleType").val();
		if (roleType == "学院角色") {
			$("#college").show();
		} else if(roleType == "学校角色"){
			$("#college").hide();	
		}
	}
	function getSysMenu() {
		getRoleCode();
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
	
	function getRoleCode() {
		var role_type = $("#role_type").val();
		var schoolCode = $("#schoolCode").val();
		var collegeCode = $("#collegeCode").val();
		//alert(collegeCode);
		var roleType =$("#roleType").val();
		
		var roletype;
		if(role_type=="1"){
			roletype="ROLE_ADMIN";
		}else if(role_type=="2"){
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
		var RoleCode;
		if (roleType == "学院角色") {
			RoleCode=roletype+"_"+schoolCode+collegeCode+"_";
		} else if(roleType == "学校角色"){
			RoleCode=roletype+"_"+schoolCode+"_";	
		}
		
		$("#basicRole").val(RoleCode);
	}
	
	function setCollegeCode( name, value )
	{
		var college_id = $("#college_id").val();
		var arr=college_id.split("-"); 
		alert(arr);
		$("#collegeCode").val(arr[1]);
	}
	
	 function allSelect( name, value )
	{
		var selectedBox = $("tr[id="+name+"] input:checkbox");
		for(var i=0; i<selectedBox.length; i++)
		{
			selectedBox[i].checked = value;
		}
	}
	
	
	
</script>
</head>
<body>
<h2 align='center'>用户角色添加</h2>
	<form name="form1" id="myform" method="post" action="doAddRole.do">
		 
		 <table border="0" width="1000">
		 <input type="hidden" name="schoolCode" id="schoolCode" value="${schoolCode}"/>
		 <input type="hidden" name="collegeCode" id="collegeCode" value=""/>
		 	<tr>
				<td width="100">类别：</td>
				<td width="1000">
				<select id="roleType" name="roleType" style="width:200px" onchange="showCollege();">
						<option value="学校角色">学校角色</option>
						<option value="学院角色">学院角色</option>
				</select> 
				</td>
			</tr>
			<tr id="college">
				<td width="100">所属学院：</td>
				<td width="700">
				<select id="college_id" name="college_id" style="width:200px" onchange="setCollegeCode();">
						<c:forEach var="collegeList" items="${collegeList}" varStatus="stauts">
							<option value="${collegeList.id}">${collegeList.org_name}-${collegeList.org_code}</option>
						</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<td width="100">角色所属类别：</td>
				<td width="700">
				<select name="role_type" id="role_type" onchange="getSysMenu();">
						<option value="请选择">请选择</option>
						<option value="1">管理员</option>
						<option value="2">教师</option>
						<option value="4">领导</option>
						<option value="3">学生</option>
						<option value="5">公司</option>
				</select></td>
			</tr>
			<tr>
				<td width="100">角色编码：</td>
				<td width="300">
				<input id="basicRole" name="basicRole" type="text" value="" readonly>
				<input type="text" name="role_code" id="role_code"/>
				<font color="red" size="2px" id="font1">&lt;-角色编码：角色类别_学校二级学院_**. ROLE_ADMIN_SZDZXXXY_要加的角色</font>
				</td>
			</tr>
			<tr>
				<td width="100">角色名称：</td>
				<td width="300"><input type="text" name="role_name" style="width:300px"/>
				</td>
			</tr>
			<tr>
				<td width="100">角色描述：</td>
				<td width="300"><input type="text" name="role_desc" style="width:600px" />
				</td>
			</tr>
			<tr>
				<td width="100">状态：</td>
				<td width="300">
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
</body>
</html>