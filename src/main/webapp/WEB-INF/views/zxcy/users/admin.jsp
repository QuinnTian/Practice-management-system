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
<script language="javascript" type="text/javascript"
	src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
</head>

<body>

	<div class="container-fluid">

		<c:if test="${!empty result}">
			<font size="5" color="red">${result}</font>
		</c:if>
		<br /> <a href="<%=path%>/zxcy/newOnlineTest.htm"
			class="btn btn-lg btn-info" style="width: 12%" role="button">创建测验</a>
					<a href="<%=path%>/zxcy/uploadOnlineTest.htm"
			class="btn btn-lg btn-info" style="width: 12%">导入测验</a>
		
		<br>
		<br>
			
		<div>测验对象：<input id="orgName" name="orgName" value=""> 创建人：<input id="userName" name="userName" value=""> 
			起始日期：<input id="startDate" name="startDate"class="Wdate" type="text" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})">　
			终止日期：<input id="endDate" name="endDate"class="Wdate" type="text" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
			<button style="width: 5%" onclick="search()" class="btn btn-info">查询</button>
		</div>
		<div class="row">
			<div class="col-md-8">
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>测验标题</th>
							<th>创建人</th>
							<th>测验对象</th>
							<th>创建日期</th>
							<th>测验数量</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cy" items="${cy}" varStatus="stauts">
							<tr>
								<td>${stauts.index+1}</td>
								<td><a
									href="<%=path%>/zxcy/newOnlineTest.htm?qn_id=${cy.id}">${cy.title}</a></td>
								<td>${userNames[stauts.count - 1]}</td>
								<td>${orgNames[stauts.count - 1]}</td>
								<td>${cy.createDate }</td>
								<td>${cy.qNum}</td>
								<td>
								|
								<a href="<%=path %>/zxcy/${cy.id}/question.htm">查看、添加问题</a>
								|
								<a href="<%=path %>/zxcy/${cy.id}/onlineTestState.do">
										<c:if test="${cy.state == 1}">
											关闭测验
										</c:if> <c:if test="${cy.state == 0}">
											开启测验
										</c:if>
								</a> 
								|
								<a href="<%=path %>/zxcy/${cy.id}/onlineTestPreview.htm">预览测验</a>
								|
								<a href="<%=path%>/zxcy/${cy.id}/queryStudentOnlineTestList.htm">提交列表</a>
								|
								<a href="<%=path %>/zxcy/deleteOnlineTest.do?id=${cy.id}"
									onclick="return confirm('确认删除 ${cy.title} 问卷吗')">删除</a>
								|
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
		function search(){
			var userName = document.getElementById("userName").value;
			userName = encodeURI(userName);
			var orgName = document.getElementById("orgName").value;
			orgName = encodeURI(orgName);
			var startDate = document.getElementById("startDate").value;
			var endDate = document.getElementById("endDate").value;
			window.location.href = "<%=path%>/zxcy/home.htm?userName=" +userName +"&orgName=" +orgName +"&startDate=" +startDate +"&endDate=" +endDate;
		}
	
	</script>
</body>
</html>

