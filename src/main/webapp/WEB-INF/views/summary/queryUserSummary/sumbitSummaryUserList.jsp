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
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">

<title>总结提交列表</title>
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
		<a class="btn btn-info btn-lg" href="javascript:history.go(-1);" style="width: 12%">返回</a>
		<div class="row">
			<div class="col-md-8">
				<table class="table">
					<thead>
						<tr>
							<th>序号</th>
							<th>学号</th>
							<th>姓名</th>
							<th>性别</th>
							<!-- <th>QQ</th> -->
							<th>手机号</th>
							<th>提交时间</th>
							<th>总结成绩</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${users}" varStatus="stauts">
							<tr>
								<td>${stauts.index+1}</td>
								<td>${user.stu_code}</td>
								<td>${user.true_name}</td>
								<td>${user.sex}</td>
								<%-- <td>${user.qqnum}</td> --%>
								<td>${user.phone}</td>
								<td>${user.summarystartDate}</td>
								<td>${user.summaryScore}</td>
								<c:if test="${user.summaryScore!='已征兵'}">
								<td><a onclick="doUserSumbit('${user.summarystartDate}','${summaryQnAnswer.questionnaire_id}','${user.id}');">审阅</a></td>
								</c:if>
								<c:if test="${user.summaryScore=='已征兵'}">
								<td><a>征兵不需要审阅</a></td>
								</c:if>
								<%-- href="<%=path %>/summary/queryUserSummary/userSumbitSummary.htm?answerDate=${user.answerDate}&questionnaire_id=${summaryQnAnswer.questionnaire_id}&user_id=${user.id} --%>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
  function doUserSumbit(summarystartDate,questionnaire_id,id) {
  		if(summarystartDate=="未提交"){
			alert("该学生还没有提交。");
		}else{
			window.location.href = "<%=path %>/summary/queryUserSummary/userSumbitSummary.htm?answerDate="+summarystartDate+"&questionnaire_id="+questionnaire_id+"&user_id="+id;
		} 
	}
	</script>
</body>
</html>
