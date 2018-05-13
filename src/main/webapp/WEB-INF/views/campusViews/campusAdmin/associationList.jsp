<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>学生会社团管理</title>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css"
	media="screen" type="text/css" />
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript">
	//添加
	function add() {
		window.location.href = "CampusAdmin/web/addAssociation.do";
	}

	//修改

	function editAss(obj) {
		var id = obj.id;
		window.location.href = "CampusAdmin/web/editAsso.do?id=" + id;
	}
	//删除

	function deleteAss(obj) {
/* 		 confirm("确定删除吗？")
 */			var id = obj.id;
			window.location.href = "CampusAdmin/web/deleteAsso.do?id=" + id;
	}
	//查看成员
	function seeStuUnionMemberDetail(obj) {
		var id = obj.id;
		window.location.href = "CampusAdmin/web/seeStuUnionMemberDetail.do?id=" + id;
	}

	function getAssociation() {
		if ($("#dept").val() == 0) {
			alert("请选择条件！");
			return;
		}
		$.ajax({
			type : "get",
			url : "CampusAdmin/web/ajaxGetAssociation.do?",
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

	function getSendData() {
		var dept = $("#dept").val();
		var dataSend = "dept=" + dept;
		return dataSend;
	}
	function showClass(ajaxData) {
		$("table[id='praTable'] tr[id!='biaotou']").remove();
		$("#biaotou").after(ajaxData);
	};
</script>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
	<h2 align="left">学生会社团管理</h2>
	<p>
		<b>条件查询：</b>
		<select id="dept" name="dept" style="width:100px" onchange="getAss()">
			<option value="0">请选择</option>
			<option value="1">学生会</option>
			<option value="2">社团</option>
		</select>
		<button onclick="getAssociation()" id="but">查询</button>
		&nbsp; &nbsp;
		<input type="button" onclick="javascript:add();" value="添加学生会社团"/>
	</p>
	<table border="1" width="1000" id="praTable" class="sjjx-table" cellspacing="0"
		cellpadding="0">
		<tr id="biaotou">
			<th width="130">编码</th>
			<th width="130">名称</th>
			<th width="130">级别</th>
			<th width="130">负责教师</th>
			<th width="130">负责学生</th>
			<th width="130">描述</th>
			<th width="130">上级部门</th>
			<th width="130">成员</th>
			<th width="130">操作</th>
		</tr>
		
	</table>
</body>
</html>
