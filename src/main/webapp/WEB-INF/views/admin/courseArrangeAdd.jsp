<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<!DOCTYPE HTML >
<html>
<head>
<base href="<%=basePath%>">
<title>添加课程</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--	
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>

<script type="text/javascript">
	/* ajax获得选择系部的老师 */
	function getTeacher() {

		$.ajax({
			type : "post",
			url : "admin/ajaxPk_teacher.do",
			data : getSendData(),
			dataType : "text",
			success : function(ajaxData) {
				showData(ajaxData);
			},
			error : function(error) {
				if (error == "error") {
					alert("错误");
				}
			}

		});
	}
	/* 得到所选择的系部id */
	function getSendData() {
		var xibu = $("#collegeId").val();
		var data = "xibu=" + xibu;
		return data;
	}
	/* 	讲ajax获得的所选系部老师 显示出来 */
	function showData(ajaxData) {
		$("#teaId").children().remove();
		$("#teaId").html(ajaxData);
	}
	/* 	表单验证成功  提交 */
	function checkForm() {
		var teaId = $("#teaId").val();
		var courseId = $("#courseId").val();
		if (teaId == null && teaId == "") {
			alter("请选择该课程的老师");
		}

		if (courseId == null && courseId == "") {
			alter("请选择课程");
		}

		$("#form1").submit();
	}

	function getCourses() {

		$.ajax({
			type : "post",
			url : "admin/ajaxCourseByOrg.do",
			data : getSendData1(),
			dataType : "text",
			success : function(ajaxData) {
				showData1(ajaxData);
			},
			error : function(error) {
				if (error == "error") {
					alert("错误");
				}
			}

		});
	}

	/* 得到所选择的系部id */
	function getSendData1() {
		var xibu = $("#college").val();
		var data = "xibu=" + xibu + "&flag=" + "flag";
		return data;
	}
	/* 	讲ajax获得的所选系部老师 显示出来 */
	function showData1(ajaxData) {
		$("#courseId").children().remove();
		$("#courseId").html(ajaxData);
	}
</script>
</head>
<body>
	<h2 style="text-align:'left'">课程信息添加</h2>
	<form name="form1" id="form1" method="post" action="admin/saveCourseArrangement.do">
		<input type="hidden" name="id" name="id" value="${course.id}">
		<table border="0" width="400">
			<tr>
				<td width="100">学年：</td>
				<td width="300"><select id="year" name="year" style="width:110px">
						<option value="2014">2014-2015</option>
						<option value="2015">2015-2016</option>
						<option value="2016">2016-2017</option>
					</select></td>
			</tr>
			<tr>
				<td width="100">学期：</td>
				<td width="300"><select id="semester" name="semester" style="width:110px">
						<option value="1">1</option>
						<option value="2">2</option>
					</select></td>
			</tr>
			<tr>
				<td width="100">课程范围：</td>
				<td width="300"><select id="college" name="college" style="width:110px" onblur="getCourses()">
						<c:forEach var="org" items="${orgList}" varStatus="status">
							<option value="${org.id}">${org.org_name}</option>
						</c:forEach>
					</select></td>
			</tr>
			<tr>
				<td width="100">课程名称：</td>
				<td width="300"><select name="courseId" id="courseId" style="width:110px">

					</select>
			</tr>
			<tr>
				<td width="100">院系：</td>
				<td width="300"><select id="collegeId" name="collegeId" style="width:110px" onblur="getTeacher()">
						<c:forEach var="org" items="${orgList}" varStatus="status">
							<option value="${org.id}">${org.org_name}</option>
						</c:forEach>
					</select></td>
			</tr>
			<tr>
				<td width="100">教师：</td>
				<td width="300"><select id="teaId" name="teaId" style="width:110px">

					</select></td>
			</tr>
		</table>
		<div style="margin-top:20px;">
			<input type="button" value="保存" onclick="checkForm()" />
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="window.location='admin/showTeaCourses.do'">返回</button>
		</div>
	</form>
</body>
</html>
