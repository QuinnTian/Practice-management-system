<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>课程信息修改</title>

<script type="text/javascript">
	function checkForm() {

		var course_code = $("#course_code");
		var course_name = $("#course_name");
		var org_id = $("#org_id");
		var class_hour = $("#class_hour");
		var description = $("#description");

		if (course_code.val() == "") {
			alert("请输入课程编码");
			begin_Time.focus();
			return null;
		}
		if (course_name.val() == "") {
			alert("请输入课程名称");
			end_Time.focus();
			return null;
		}
		if (org_id.val() == "请选择") {
			alert("请选择组织名称");
			return null;
		}
		if (class_hour.val() == "" && class_hour.val() <= 0) {
			alert("请输入课时，必须为数字且大于0！");
			return null;
		}
		if (class_hour.val() >= 100) {
			alert("请核实您的课时数目");
			return null;
		}
		//alert(teacher.value);
		if (description.val() == "") {
			alert("请添加对课程的描述");
			return null;
		}

		else {
			document.forms[0].submit();
		}
	}
</script>
</head>
<body>
	<h2 style="text-align:'left'">课程信息修改</h2>
	<form name="form1" method="post" action="doEditCourses.do">
		<input type="hidden" name="id" name="id" value="${course.id}">
		<table width="800">
			<tr>
				<td width="100">课程编码 ：</td>
				<td width="700"><input type="text" name="course_code"
					id="course_code" value="${course.course_code}"></td>
			</tr>

			<tr>
				<td width="100">课程名称：</td>
				<td width="700"><input type="text" name="course_name"
					id="course_name" value="${course.course_name}" maxlength="20">
				</td>
			</tr>
			<c:set var="org_id" value="${course.org_id}" scope="request"></c:set>
			<%
				String org_id = (String) request.getAttribute("org_id");
			%>

			<td width="100">所属组织：</td>
			<td width="700"><input type="text" readonly="readonly"
				org_id" id="org_id"
				value=" <%=DictionaryService.findOrg(org_id).getOrg_name()%>">
			</td>

			</tr>
			<tr>
				<td width="100">授课对象：</td>
				<td width="700"><input type="text" name="class_object" readonly="readonly"
					value="${course.class_object}" ></td>
			</tr>
			<tr>
				<td width="100">课时：</td>
				<td width="700"><input type="number" name="class_hour"
					id="class_hour" value="${course.class_hour}" /></td>
			</tr>
			<tr>
				<td width="100">描述：</td>
				<td width="700"><!-- <input type="text" name="description"
					id="description"  /> -->
					<textarea rows="5" cols="40" name="description" id="description" 
					value="${course.description}"></textarea>
				</td>
			</tr>
			<%-- <tr>
				<td width="100">状态：</td>
				<td width="300"><input type="text" name="state"
					value="${course.state}" /></td>
			</tr> --%>
		</table>

		<div style="margin-top:20px;">
			<input type="button" value="保存" onclick="checkForm()" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="window.location='./courseList.do'">返回</button>
		</div>
	</form>
</body>
</html>

s



















