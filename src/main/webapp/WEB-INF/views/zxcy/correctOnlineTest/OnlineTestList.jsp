<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ include file="../../titlebar.jsp"%>
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
			href="<%=path%>/zxcy/home.htm">返回控制面板</a>



		<div class="row">
			<div class="col-md-6">
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>学号</th>
							<th>姓名</th>
							<th><select onchange="changeClass()" id="className" name="className"><option value="">全部班级</option><c:forEach var="list" items="${classList}" varStatus="status"><option <c:if test="${orgID == list.orgID}">selected</c:if> value="${list.orgID}">${list.className}</option></c:forEach></select></th>
							<th>主观成绩</th>
							<th>客观成绩</th>
							<th>总得分</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ot" items="${otQnAnswers}"
							varStatus="stauts">
							<tr>
								<td>${stauts.index+1}</td>
								<td>${ot.user.s_t_code}</td>
								<td>${ot.user.true_name }</td>
								<td>${ot.user.class_name }</td>
								<td>${scoreByTypeText[stauts.count - 1]}分</td>
								<td>${scoreByTypeChoice[stauts.count - 1]}分</td>
								<td>${ot.score}分</td>
								<td>
									<c:if test="${ot.enddate != null}"><a href="<%=path %>/zxcy/${ot.id}/onlineTestCorrect.htm">批改测验</a></c:if>
									<c:if test="${ot.enddate == null}">测验未完成</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
		function changeClass(){
			var orgID = document.getElementById("className").value;
			window.location.href = "<%=path%>/zxcy/${cy.id}/queryStudentOnlineTestList.htm?orgID=" +orgID;
		}
	
	</script>
</body>
</html>