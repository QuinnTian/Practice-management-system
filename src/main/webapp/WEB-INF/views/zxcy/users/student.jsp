<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../../titlebar.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

	<div class="container-fluid">

		<c:if test="${!empty result}">
			<font size="5" color="red">${result}</font>
		</c:if>
		<br />

		<div class="row">
			<div class="col-md-6">
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>测验标题</th>
							<th>测验数量</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cy" items="${cy}" varStatus="stauts">
							<tr>
								<td>${stauts.index+1}</td>
								<td>${cy.title}<c:if test="${isAnswer[stauts.count-1]}">(必答)</c:if></td>
								<td>${cy.qNum}</td>
								<td>
								<c:if test="${isSumbit[stauts.count-1]}">
									<a href="<%=path %>/zxcy/${cy.id}/onlineTest.htm" onclick="return confirm('重新回答测验将清空之前的测验信息，确认重新答题吗？')">重新答题</a>
								</c:if>
								<c:if test="${!isSumbit[stauts.count-1]}">
									<a href="<%=path %>/zxcy/${cy.id}/onlineTest.htm">开始答题</a>
								</c:if>
								<a href="<%=path %>/zxcy/studentOnlintestFruit.htm?cy_id=${cy.id}">查看测验结果</a>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>

