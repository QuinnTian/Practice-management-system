<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../titlebar.jsp"%>
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

<title>在线测验</title>
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
			问卷标题：<small>${summary.title}</small>
		</h3>
		<h4>
			选项标题：<small>${summary.summaryQuestion.title}</small>
		</h4>
		<a style="width: 12%" class="btn btn-lg btn-info"
			href="<%=path %>/summary/option/${summary.summaryQuestion.id}/new.htm">添加选项</a>
		<a style="width: 12%" class="btn btn-lg btn-info"
			href="<%=path%>/summary/user/home.htm">返回控制面板</a>



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
						<c:forEach var="option"
							items="${summary.summaryQuestion.summaryOptions}"
							varStatus="stauts">
							<tr>
								<td>${stauts.index+1}</td>
								<td><a
									href="<%=path %>/summary/option/${summary.summaryQuestion.id}/new.htm?optionID=${option.id}">${option.title}</a>
								</td>
								<td><a
									href="<%=path %>/summary/option/${option.id}/delete.do?questionID=${summary.summaryQuestion.id}"
									onclick="return confirm('确认删除问卷吗')">删除</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>