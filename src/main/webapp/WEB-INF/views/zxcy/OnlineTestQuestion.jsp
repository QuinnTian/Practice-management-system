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

<link href="css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

	<div class="container-fluid">

		<c:if test="${!empty result}">
			<font size="5" color="red">${result}</font>
		</c:if>

		<br />
		<h3>
			问卷标题：<small>${cy.title}</small>
		</h3>
		<a class="btn btn-lg btn-info" style="width: 12%"
			href="<%=path %>/zxcy/question/${cy.id}/new.htm">添加问题</a> <a
			class="btn btn-lg btn-info" style="width: 12%"
			href="<%=path%>/zxcy/home.htm">返回控制面板</a>



		<div class="row">
			<div class="col-md-6">
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>选项标题</th>
							<th>问题类型</th>
							<th>选项数量</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cyQuestion" items="${cy.onlineTestQuestions}"
							varStatus="stauts">
							<tr>
								<td>${stauts.index+1}</td>
								<td><a
									href="<%=path %>/zxcy/question/${cy.id}/new.htm?q_id=${cyQuestion.id}">${cyQuestion.title}</a>
								<td><c:if test="${cyQuestion.type == 1}">多选</c:if><c:if test="${cyQuestion.type == 2}">单选</c:if><c:if test="${cyQuestion.type == 3}">文本</c:if><c:if test="${cyQuestion.type == 4}">说明</c:if></td>
								<td>${cyQuestion.oNum}</td>
								<td>
								<a <c:if test="${cyQuestion.type != 1 && cyQuestion.type != 2}">style="display: none;"</c:if>  href="<%=path %>/zxcy/${cyQuestion.id}/option.htm">查看、添加问题选项</a>
								<a
									href="<%=path %>/zxcy/question/${cyQuestion.id}/delete.do?cy_id=${cy.id}"
									onclick="return confirm('确认删除 ${cyQuestion.title} 吗')">删除</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function deleteNum(num) {
			if (num > 0) {
				alert("选项里还有未删除的选项，请删除后再进行此操作");
				return false;
			} else {
				return true;
			}
		}
	</script>
</body>
</html>