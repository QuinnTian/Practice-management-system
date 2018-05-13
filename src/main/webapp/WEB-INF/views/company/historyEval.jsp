<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<title>历史评价列表</title>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script>
function doBack() {
		window.history.go(-1);
	}
	</script>
</head>
<body>
	<h2 align="left">历史评价列表</h2>
	<table border="1" width="1000" id="praTable" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr>
			<th width="80">员工姓名</th>
			<th width="30">性别</th>
			<th width="60">员工电话</th>
			<th width="60">评价标题</th>
			<th width="60">评价教师姓名</th>
			<th width="100">所在公司</th>
			<th width="60">评价时间</th>
			<th width="30">分数</th>
			<th width="150">简评内容</th>
		</tr>
		 <c:forEach var="s" items="${eval}" varStatus="eval">
		<tr>
			<td>
			<c:set var="ss" value="${s.stu_id}" scope="request">
			</c:set>
			<%
					String stu_id = (String) request.getAttribute("ss");
				%>
				<%
					out.println(DictionaryService.findStudent(stu_id).getTrue_name());
				%>
				</td>
					<td>
			<%
					String sex = (String) request.getAttribute("ss");
				%>
				<%
					out.println(DictionaryService.findStudent(sex).getSex());
				%>
				</td>
				<td>
			<%
					String phone = (String) request.getAttribute("ss");
				%>
				<%
					out.println(DictionaryService.findStudent(phone).getPhone());
				%>
				</td>
				<td>${s.eval_title}</td>
				<td>${s.tea_name}</td>
				<td>${s.company_name}</td>
				<td><fmt:parseDate value="${s.eval_time}" var="eval_time"/>
					<fmt:formatDate value="${s.eval_time}" pattern="yyyy/MM/dd"/></td>
			<td>${s.eval_score}</td>
			<td>${s.eval_content}</td>
		</tr>
	 </c:forEach>
</table>
<div align="right">
<input  type="button" value="返回" onclick="doBack()">
</div>
</body>
</html>
