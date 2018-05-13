<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css"
	media="screen" type="text/css" />
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<title>用户列表</title>
<script type="text/javascript">
	//删除
	function doDel(user_id, role_id) {
		if (window.confirm("确定删除此角色吗?")) {
			window.location.href = "deleteUserInRole.do?user_id=" + user_id
					+ "&role_id=" + role_id;
		}
	}
	//返回
	function ret() {
		window.location.href = "roleList.do";
	}
</script>
</head>
<body>
	<h2 align='center'>${role_name}用户列表</h2>
	<div style="margin-top:10px;margin-left:100px;">
		<input type="button" onclick="javascript:ret();" value="返回" />
	</div>
	<table border="1" width="1300" class="sjjx-table" cellspacing="0"
		cellpadding="0">
		<tr>
			<th width="">用户身份</th>
			<th width="">用户名称</th>
			<th width="">用户性别</th>
			<th width="">用户联系方式</th>
			<!-- <th width="">角色级别</th> -->
			<!-- <td width="150">状态</td> -->
			<th width="">操作</th>
		</tr>

		<c:forEach var="s" items="${stus}" varStatus="stauts">
			<tr>
				<td style="text-align:left;" align="center">学生</td>
				<td>${s.true_name}</td>
				<td>${s.sex}</td>
				<td>${s.phone}</td>
				<td><button onclick="doDel('${s.id}','${role_id }')">删除</button>
				</td>
				<%-- <td>
				<c:if test="${r.temp1=='1'}">基础角色</c:if>
				<c:if test="${r.temp1=='2'}">角色模板</c:if>
				<c:if test="${r.temp1=='3'}">普通角色</c:if>
				</td> --%>
			</tr>
		</c:forEach>
		<c:forEach var="t" items="${teas}" varStatus="stauts">
			<tr>
				<td style="text-align:left;">教师</td>
				<td>${t.true_name}</td>
				<td>${t.sex}</td>
				<td>${t.phone}</td>
				<td><button onclick="doDel('${t.id}','${role_id }')">删除</button>
				</td>
				<%-- <td>
				<c:if test="${r.temp1=='1'}">基础角色</c:if>
				<c:if test="${r.temp1=='2'}">角色模板</c:if>
				<c:if test="${r.temp1=='3'}">普通角色</c:if>
				</td> --%>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
