<%@ page language="java" import="java.util.*" pageEncoding="utf-8" errorPage="errorPage.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<title>My JSP 'showScore.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	//确定权重为100%，并转到后台生成综合成绩
	function docheck() {
		var a = document.getElementById("month").value;
		var b = document.getElementById("thesis").value;
		var c = document.getElementById("Evaluate").value;
		var d=parseFloat(a);
		var f=parseFloat(b);
		var g=parseFloat(c);
		if (d+ f + g == 1) {

			var url = "teacher/totalscore.do";
			document.form1.action = url;
			document.form1.submit();

		} else {
			alert("请正确填写权重！");
		}
	}
</script>
</head>

<body>
	<form action="" name="form1">
		<table border="1" width="900">
			<tr>
				<td width="80">选择权重<input type="hidden" id="k" name="practice_id" value="${practice_id}">
				<input type="hidden" id="r" name="myYear" value="${myYear}">
				<input type="hidden" id="t" name="term" value="${term}">
				</td>
			

				<td style="width: 379px; ">月总结:<select id="month" name="month"><option
							value="0.1">10%</option>
						<option value="0.2">20%</option>
						<option value="0.3">30%</option>
						<option value="0.4">40%</option>
						<option value="0.5">50%</option>
						<option value="0.6">60%</option>
						<option value="0.7">70%</option>
						<option value="0.8">80%</option></select> 论文 ：<select id="thesis"
					name="thesis"><option value="0.1">10%</option>
						<option value="0.2">20%</option>
						<option value="0.3">30%</option>
						<option value="0.4">40%</option>
						<option value="0.5">50%</option>
						<option value="0.6">60%</option>
						<option value="0.7">70%</option>
						<option value="0.8">80%</option></select> 奖惩 ：<select id="Evaluate"
					name="Evaluate"><option value="0.1">10%</option>
						<option value="0.2">20%</option>
						<option value="0.3">30%</option>
						<option value="0.4">40%</option>
						<option value="0.5">50%</option>
						<option value="0.6">60%</option>
						<option value="0.7">70%</option>
						<option value="0.8">80%</option></select>
				</td>
				<td><input type="button" id="score" name="score"
					onclick="docheck()" value="生成总成绩"></input>
					</td>
			</tr>
			<tr>
				<td width="80">学号</td>
				<td width="80">姓名</td>
				<td width="80">班级</td>
				<td width="80">月总结成绩</td>
				<td width="80">论文成绩</td>
				<td width="80">奖惩成绩</td>
			</tr>
			<c:forEach var="s" items="${result}" varStatus="stauts">
				<tr>
					<td>${s.STU_CODE}</td>
					<TD>${s.TRUE_NAME}</TD>
					<TD>${s.ORG_NAME}</TD>
					<TD>${s.monthscore}</TD>
					<TD>${s.thesisscore}</TD>
					<TD>${s.evaluatescore}</TD>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>
