<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css"
	media="screen" type="text/css" />
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript">
	function doSetWorkload(org_code) {
		if (window.confirm("确定修改此学院状态?")) {
			window.location.href = "doSetWorkload.do?org_code=" + org_code;
		}
	}
</script>
<title>菜单列表</title>
</head>
<body>
	<h2>教师工作量参数管理</h2>
	<h3>
		学院内教师不需交工作总结请点击按钮修改，工作量系数设置为1。<br />
		默认设置学院内教师不需交工作总结请，工作量系数设置为交工作总结为1，未交工作总结为0.7。<br /> 
	</h3>
	<table border="1" width="1000" id="praTable" class="sjjx-table"
		cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="130">组织编码</th>
			<th width="130">组织名称</th>
			<th width="130">组织级别</th>
			<th width="130">联系人</th>
			<th width="130">联系电话</th>
			<th width="130">上级部门</th>
			<th width="130">当前状态</th>
			<th width="130">操作</th>
		</tr>
		<c:forEach var="org" items="${orgList}" varStatus="stauts">
			<tr>
				<td>${org.org_code}</td>
				<td>${org.org_name}</td>
				<td><c:if test="${org.org_level=='2'}">
				 院级
				</c:if> <c:if test="${org.org_level=='3'}">
				 系级
				</c:if> <c:if test="${org.org_level=='5'}">
				 班级
				</c:if></td>
				<c:set var="contacts" value="${org.contacts}" scope="request"></c:set>
				<%
					String contacts = (String) request.getAttribute("contacts");
				%>
				<td>
					<%
						try {
								out.println(DictionaryService.findTeacher(contacts)
										.getTrue_name());
							} catch (Exception e) {
								// TODO: handle exception
								out.println("无");
							}
					%>
				</td>
				<td>${org.phone}</td>
				<c:set var="department_id" value="${org.parent_id}" scope="request"></c:set>
				<%
					String department_id = (String) request
								.getAttribute("department_id");
				%>
				<td>
					<%
						out.println(DictionaryService.findOrg(department_id)
									.getOrg_name());
					%>
				</td>
				<td><c:if test="${org.head_tea_id== false}">
				不需交工作总结
				</c:if> <c:if test="${org.head_tea_id!= false}">
				 需交工作总结
				</c:if></td>
				<td>
					<button onclick="doSetWorkload('${org.org_code}')">修改状态</button> <br />
				</td>

			</tr>
		</c:forEach>
</body>
</html>
