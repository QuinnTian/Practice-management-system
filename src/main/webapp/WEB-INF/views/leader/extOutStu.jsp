<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<script type="text/javascript">
	function toExc() {
		var year = $("#year").val();
		var org_id = $("#org_id").val();
		if (org_id=="1") {
			alert("请选择院系！");
			return;
		} 
		window.location.href ="<%=path%>/leader/toExc.do?org_id="+org_id+"&&year="+year;
	}
</script>
<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/starter-template.css" rel="stylesheet">
</head>
</head>

<body>
	<div align="center" style="width: 80%;">
		<div align="center" style="width: 100%;">
			<h1>
				<b>导出学生信息</b>
			</h1>
		</div>
		<br>
		<h2>年级</h2>

		<div style="width: 80% ;">
			<select style="width: 100% ;height:45px; " id="year">
				<option>2013</option>
				<option>2014</option>
				<option>2015</option>
				<option>2016</option>
				<option>2017</option>
			</select>
		</div>
		<h2>院系</h2>
		<div style="width: 80% ;">
			<select id="org_id" style="width: 100% ;height:45px; ">
				<option value="1">请选择</option>
				<c:forEach var="org" items="${org}">
					<option value="${org.id }">${org.org_name }</option>
				</c:forEach>
			</select>
		</div>
		<br>
		<div style="width: 80% ;">
			<button class="btn btn-large btn-block  btn-info" type="button" onclick="toExc()"
				style="height: 50px;">导出</button>
		</div>
	</div>
</body>

</html>
