<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%--<%@ include file="../titlebar.jsp"%>
--%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>创建新总结选项</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/starter-template.css" rel="stylesheet">

</head>

<body>
	<c:if test="${!empty result}">
		<font color="red">${result}</font>
	</c:if>

	<br/>
	<br/>
	<br/>


	<form action="<%=path %>/summary/option/insert.do" method="post">
		
		<input type="hidden" name="question_id" id="question_id" value="${summary.summaryQuestion.id}"/>
		<input type="hidden" name="id" id="id" value="${summary.summaryQuestion.summaryOption.id}"/>
		<div class="col-sm-5">
			<table class="table">
				<caption align="top" style="font-size:30px">新建选项</caption>
				<thead>
					<tr>
						<th>选项内容</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" id="title" class="form-control"
							name="title" value="${summary.summaryQuestion.summaryOption.title}" />
						</td>
						<td><input class="btn btn-info" type="submit" value="确定">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<%-- 			依赖关系:
			<select id="depend" name="depend">
			<option value="">无</option>
				<c:forEach items="${summary.question}" var="q" varStatus="status">
					<option value="${q.id}">${q.title}</option>
				</c:forEach>
			</select> --%>
	</form>
</body>
</html>
