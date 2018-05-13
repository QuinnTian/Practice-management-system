<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>导入指导教师分配表</title>
</head>
<body>
	<h2 align='center'>导入指导教师分配表</h2>
	<form action="doGuidenceTeacherImport.do" method="post"
		enctype="multipart/form-data">
			<input type="hidden" id="type" name="type" value="excelGuidenceTeacher">
		<table border="1" width="800">
			<tr>
				<td width="150"><input type="hidden" name="_method"
					value="post"> 指导教师分配表(*.xls): <input type="file" name="file">
					<br>
				</td>
				<td width="150"><input type="submit" value=" 提 交 "> <br>
				</td>
			</tr>
		</table>
		<table border="1" width="800">
			<tr>
				<td width="150">实习编号</td>
				<td width="550">实习任务</td>
				<td width="150">学号</td>
				<td width="150">姓名</td>
				<td width="150">开始时间</td>
				<td width="150">截止时间</td>
				<td width="150">班级编号</td>
				<td width="150">班级名称</td>
				<td width="150">教师编号</td>
				<td width="150">指导教师</td>
			</tr>
			<c:forEach var="t" items="${lists}" varStatus="stauts">
				<tr>
					<td>${t.practice_code}</td>
					<td>${t.practice_name}</td>
					<td>${t.stu_code}</td>
					<td>${t.stu_name}</td>
					<td><fmt:parseDate value="${t.begin_time}" var="begin_time" />
						<fmt:formatDate value="${begin_time}" pattern="yyyy/MM/dd" /></td>
					<td><fmt:parseDate value="${t.end_time}" var="end_time" /> <fmt:formatDate
							value="${end_time}" pattern="yyyy/MM/dd" /></td>
					<td>${t.class_code}</td>
					<td>${t.class_name}</td>
					<td>${t.tea_code}</td>
					<td>${t.tea_name}</td>
				</tr>
			</c:forEach>
		</table>
	</form>
	<h3>保存至数据库</h3>
	<form action="doSaveTeachers.do" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="fileName" value="${fileName}">
		<input type="hidden" name="type" value="${type}"> <input
			type="submit" value="保存到数据库"><br>
	</form>
</body>
</html>


