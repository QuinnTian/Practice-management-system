<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<title>添加职务</title>
<script type="text/javascript">
	function doAdd(){
	 	document.dutiesForm.submit();
	}
</script>
</head>
<body>
	<h2 align='left'>职务添加</h2>
	<form name="dutiesForm" id="dutiesForm" method="post" action="doAddDuties.do">
		<table border="0" width="1300">
			<tr>
				<td width="70">职务号：</td>
				<td width="700">
				<input type="text" name="id">
				</td>
			</tr>
			<tr>
				<td width="100">名称：</td>
				<td width="700"><input type="text" name="name">
				</td>
			</tr>
			<tr>
				<td width="70">职务描述：</td>
				<td width="700">
				<input type="text" name="desc" id="desc" />
				</td>
			</tr>
			<tr>
				<td width="70">职务类别：</td>
				<td width="700">
				<select name="type">
						<option value="1">教师类</option>
						<option value="2">学生班级类职务</option>
						<option value="3">学生社团类职务</option>
				</select>
			</tr>
		</table>
		<div style="margin-top:20px;">
			<input type="button" onclick="doAdd();" value="保存" />
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="window.location='./teacherList.do'">返回</button>
		</div>
	</form>
</body>
</html>


