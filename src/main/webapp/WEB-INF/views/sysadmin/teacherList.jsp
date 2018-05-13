<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css"
	media="screen" type="text/css" />
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<title>教师列表</title>
<script type="text/javascript">
	//添加
	function add() {
		window.location.href = "addTeacher.do";
	}

	//删除
	function doDel(id) {
		if (window.confirm("确定删除此教师?")) {
			window.location.href = "deleteTeacher.do?id=" + id;
		}
	}
	//修改
	function doEdit(id) {
		window.location.href = "editTeacher.do?id=" + id;
	}
	//重置密码
	function rePass(tea_id) {
		if (window.confirm("确定重置此教师密码?")) {
			window.location.href = "resetPassword.do?tea_id=" + tea_id;
		}
	}
	function ajaxSearch() {
		var college_id = $("#college_id").val();
		if (college_id == null || college_id == "") {
			alert("请选择学院");
			return null;
		} else {
			$.ajax({
						type : "get",
						/* contentType : "application/json", */
						url : "ajaxSearchTeacher.do?",
						data : "college_id=" + college_id, //设置发送参数，即使参数为空，也需要设置
						contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
						dataType : "text", //返回的类型为json                
						success : function(data) { //成功时执行的方法					
							$("#teaTable").html(data);
						},
						error : function(result, status) { //出错时会执行这里的回调函数                     
							if (status == 'error') {
								alert(status);
							}
						}
					});
		}
	}
		function ajaxGetPerson() {
		var name = $("#name").val();
		if (name == null || name == "") {
			alert("请输入姓名或教工号");
			return null;
		} else {
			$.ajax({
						type : "get",
						/* contentType : "application/json", */
						url : "ajaxGetPerson.do?",
						data : "name=" + name, //设置发送参数，即使参数为空，也需要设置
						contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
						dataType : "text", //返回的类型为json                
						success : function(data) { //成功时执行的方法					
							$("#teaTable").html(data);
						},
						error : function(result, status) { //出错时会执行这里的回调函数                     
							if (status == 'error') {
								alert(status);
							}
						}
					});
		}
	}
</script>
</head>
<body>
	请选择二级学院&nbsp;&nbsp;&nbsp;&nbsp;
	<select id="college_id">
		<option></option>
		<c:forEach var="o" items="${orgs}" varStatus="stauts">
			<option value="${o.id}">${o.org_name}</option>
		</c:forEach>
	</select>
	<button onclick="ajaxSearch()">查询</button>
	请输入教工号或姓名
	<input type="text" id="name"/> 
	<button onclick="ajaxGetPerson()">详细查询</button>
	<h2 align='left'>教师列表</h2>
	<p>
		<input type="button" onclick="javascript:add();" value="新增教师用户" />
	</p>
	<table border="1" width="1300" id="teaTable"
		style="overflow-x:hidden;overflow-y:hidden;" class="sjjx-table"
		cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="150" align="center">教工号</th>
			<th width="150" align="center">姓名</th>
			<th width="150" align="center">性别</th>
			<th width="150" align="center">电话</th>
			<th width="150" align="center">部门名称</th>
			<th width="100" align="center">重置密码</th>
			<th width="50" align="center">修改</th>
			<th width="50" align="center">操作</th>
		</tr>

		<c:forEach var="t" items="${teaList}" varStatus="stauts">
			<tr>
				<td align="center">${t.tea_code}</td>
				<td align="center">${t.true_name}</td>
				<td align="center">${t.sex}</td>
				<td align="center"><c:choose>
						<c:when test="${empty t.phone}">
							<%="无"%>
						</c:when>
						<c:otherwise>
			    ${t.phone}
				</c:otherwise>
					</c:choose></td>
				<td align="center">${t.temp1}</td>
				<td align="center"><input type="button" value="重置密码"
					onclick="rePass('${t.id}');"></td>
				<td align="center"><input type="button" value="修改"
					onclick="doEdit('${t.id}');"></td>
				<td align="center"><input type="button" value="删除"
					onclick="doDel('${t.id}');"></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
