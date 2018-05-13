<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ include file="../titlebar.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
	<div class="container-fluid">

		<c:if test="${!empty result}">
			<font size="5" color="red">${result}</font>
		</c:if>

		<br />
		<h3>
			↓问卷标题：<small>${cy.title}</small>
		</h3>
		<h4>
			　→→↓选项标题：<small>${cy.onlineTestQuestion.title}</small>
		</h4>
		　　　　→→
		<a class="btn btn-lg btn-info" style="width: 12%"
			href="<%=path %>/zxcy/option/${cy.onlineTestQuestion.id}/new.htm">添加选项</a> <a
			class="btn btn-lg btn-info" style="width: 12%"
			href="<%=path%>/zxcy/home.htm">返回控制面板</a>

		<div class="row">
			<div class="col-md-6">
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>选项标题</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="option" items="${cy.onlineTestQuestion.onlineTestOptions}"
							varStatus="stauts">
							<tr>
								<td>${stauts.index+1}</td>
								<td><a
									href="<%=path %>/zxcy/option/${cy.onlineTestQuestion.id}/new.htm?o_id=${option.id}">${option.title}</a>
								</td>
								<td>
								<a href="<%=path%>/zxcy/option/${option.id}/optionAnswer.do">
									<c:if test="${option.answer == '0' || option.answer == null}">
										设为正确答案
									</c:if>
									<c:if test="${option.answer == 1}">
										撤销正确答案
									</c:if>
								</a>
								<a href="<%=path %>/zxcy/option/${option.id}/delete.do?q_id=${cy.onlineTestQuestion.id}"
									onclick="return confirm('确认删除 ${option.title} 吗')">删除</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>