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
<title>用户角色列表</title>
<script type="text/javascript">
	//添加
	function add() {
		window.location.href = "addRole.do";
	}
	//根据模板生成角色
	function addRoleByRoleTemplate() {
		window.location.href = "addRoleByRoleTemplate.do";
	}
	//删除
	function doDel(id) {
		if (window.confirm("确定删除此角色吗?")) {
			window.location.href = "deleteRole.do?id=" + id;
		}
	}
</script>
</head>
<body>
	<h2 align='center'>用户角色列表</h2>
	<div style="margin-top:10px;margin-left:100px;">
		<input type="button" onclick="javascript:add();" value="添加角色" /> <input
			type="button" onclick="javascript:addRoleByRoleTemplate();"
			value="根据模板生成角色" />
	</div>
	<table border="1" width="1300" class="sjjx-table" cellspacing="0"
		cellpadding="0">
		<tr>
			<th width="">角色编码</th>
			<th width="">角色名称</th>
			<th width="">角色描述</th>
			<th width="">角色类别</th>
			<!-- <th width="">角色级别</th> -->
			<th width="">所属组织</th>
			<!-- <td width="150">状态</td> -->
			<th width="">操作</th>
		</tr>

		<c:forEach var="r" items="${roleList}" varStatus="stauts">
			<tr>
				<td style="text-align:left;">${r.role_code}</td>
				<td><a href="editRole.do?role_id=${r.id}">${r.role_name}</a>
				</td>
				<td>${r.role_desc}</td>
				<td>${r.role_type_name}</td>
				<%-- <td>
				<c:if test="${r.temp1=='1'}">基础角色</c:if>
				<c:if test="${r.temp1=='2'}">角色模板</c:if>
				<c:if test="${r.temp1=='3'}">普通角色</c:if>
				</td> --%>
				<td>${r.college_name}</td>
				<td><a
					href="searchUsersByRole.do?role_id=${r.role_code}&role_name=${r.role_name}">查看所有用户</a>
				</td>
				<%-- <td>${r.state}</td> --%>
				<%-- <td><input type="button" value="删除角色" onclick="doDel('${r.id}');">暂时不用</td> --%>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
