<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ page import="com.sict.entity.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css"
	media="screen" type="text/css" />
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<title>参数列表</title>
<script type="text/javascript">
	//查询
	function getLeaders() {
		$.ajax({
			type : "get",
			url : "ajaxGetSchoolLeaders.do?",
			data : getSendData(),
			dataType : "text",
			success : function(data) {
				showClass(data);
			},
			error : function(result, status) {
				if (status == 'error') {
					alert(status);
				}
			}
		});
	}
	function showClass(ajaxData) {
		$("tr[id='tbody']").remove();
		$("#biaotou").after(ajaxData);
	};
	function getSendData() {
		var dept = $("#dept").val();
		var dataSend = "dept=" + dept;
		return dataSend;
	}

	//添加
	function add() {
		window.location.href = "schoolLeadersAdd.do";
	}
	//修改
	function doEdit(id) {
		window.location.href = "schoolLeadersEdit.do?teaId=" + id;
	}
</script>
</head>
<body>
	<h2 align='left'>校级领导管理</h2>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<p>
		<b>条件查询：</b> <select id="dept" name="dept" style="width:100px">
			<option value="">请选择部门</option>
			<c:forEach var="org" items="${org}" varStatus="stauts">
				<option value="${org.id}">${org.org_name}</option>
			</c:forEach>
		</select>
		<button onclick="getLeaders()" id="button">查询</button>
		&nbsp; <input type="button" value="添加" id="seacher"
			onclick="javascript:add();" />
	</p>
	<table id="orgListTable" border="1" width="1300"
		style="overflow-x:hidden;overflow-y:hidden;" class="sjjx-table"
		cellspacing="0" cellpadding="0">
		<thead>
			<tr id="biaotou">
				<th width="150" align="center">序号</th>
				<th width="150" align="center">教工号</th>
				<th width="150" align="center">姓名</th>
				<th width="150" align="center">性别</th>
				<th width="150" align="center">电话</th>
				<th width="150" align="center">部门名称</th>
				<th width="150" align="center">职务</th>
				<th width="150" align="center">状态</th>
				<th width="150" align="center">操作</th>
			</tr>
		</thead>
	</table>
</body>
</html>
