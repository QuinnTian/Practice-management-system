<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<title>通过角色模板添加角色</title>
<script>
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

</script>
</head>
<body>
<h2 align='center'>通过角色模板添加角色</h2>
	<form name="form1" id="myform" method="post" action="doAddRoleByRoleTemplate.do">
		 <table border="0" width="1200">
		 	<tr>
				<td width="100">类别：</td>
				<td width="1000">
				<select id="roleType" name="roleType" style="width:200px" onchange="showCollege();">
						<option value="学校角色">学校角色</option>
						<option value="学院角色">学院角色</option>
				</select> 
				</td>
			</tr>
		 	<tr>
				<td width="100">角色模板：</td>
				<td width="1000">
				<select id="roleTemplate_id" name="roleTemplate_id" style="width:200px">
						<c:forEach var="roleTemplateList" items="${roleTemplateList}" varStatus="stauts">
							<option value="${roleTemplateList.id}">${roleTemplateList.role_type_name}--${roleTemplateList.role_name}</option>
						</c:forEach>
				</select> 
				</td>
			</tr>
			<tr>
				<td width="100">学校：</td>
				<td width="700">
				<select id="school_id" name="school_id" style="width:200px">
						<c:forEach var="schoolList" items="${schoolList}" varStatus="stauts">
							<option value="${schoolList.id}">${schoolList.org_name}</option>
						</c:forEach>
				</select>
				</td>
			</tr>
		 	<tr id="college">
				<td width="100">学院：</td>
				<td width="700">
				<%-- <select id="college_id" name="college_id" style="width:200px">
						<c:forEach var="collegeList" items="${collegeList}" varStatus="stauts">
							<option value="${collegeList.id}">${collegeList.org_name}</option>
						</c:forEach>
				</select> --%>
						<c:forEach var="college" items="${collegeList}"
								varStatus="stauts">
								<input type="checkbox" name="college_id" value="${college.id}">${college.org_name}<br/>
						</c:forEach>
				</td>
				<!-- <font>如果添加学院，至少选择一个，这里没有做验证，可以写成ajax</font> -->
			</tr>
			
			
		</table>
		<div style="margin-top:20px;">
			<input type="submit" value="保存" />&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- <button type="button" onclick="window.location='./roleList.do'">返回</button> -->
		</div>
	</form>
</body>
</html>





















