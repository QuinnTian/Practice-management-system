<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>教室管理</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css"
	media="screen" type="text/css" />
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript">
	function getTeaCourse() {
		var campus = $("#scr_campus").val();
		var classType = $("#classType").val();
		if (campus == "请选择校区") {
			alert("请选择校区");
			return;
		}
		if (classType == "请选择教室类型") {
			alert("请选择教室类型");
			return;
		}
		$.ajax({
			type : "get",
			url : "schooladmin/getClassroom.do",
			data : getSendDate(),//即使参数为空 也要有该属性 否则会报错
			datatype : "text",
			success : function(ajaxData) {
				/* alert(ajaxData); */
				setData(ajaxData);
			},
			error : function(result, status) {
				if (status == 'error') {
					alert("请选择正确的校区或者教室类型");
				}
			}

		});
	}

	function getSendDate() {
		var campus = $("#scr_campus").val();
		var classType = $("#classType").val();
		return "scr_campus=" + campus + "&classType=" + classType;
	}

	function setData(ajaxData) {
		$("table[id='courseTab'] tr[id!='tableHeader']").remove();
		$("#tableHeader").after(ajaxData);
	}

	function importButton() {
		var campus = $("#scr_campus").val();
		var classType = $("#classType").val();
		if (campus == "请选择校区") {
			alert("请选择校区");
			return;
		}
		
		location.href = "schooladmin/classroomManage.do?campus=" + campus
				+ "&classType=" + classType;
	}
	function editclassRoom(obj) {
		var id = obj.id;
		window.location.href = "schooladmin/classroomEdit.do?id=" + id;
	}
	function deleteclassRoom(obj) {
		alert("确定删除吗？");
		var id = obj.id;
		window.location.href = "schooladmin/doClassroomDelete.do?id=" + id;
	}
	//导入教室信息
	function importClass() {
		var campus = document.getElementById('scr_campus').value;
		var classType = document.getElementById('classType').value;
		if (campus == "请选择校区") {
			alert("请先选择校区！！");
			return null;
		} else if (classType == "请选择教室类型") {
			alert("请先选择教室类型！！");
			return null;
		} else {
			window.location.href = "schooladmin/classroomImport.do?campus=" + campus
					+ "&classType=" + classType;
		}
	}
</script>
</head>
<body>
	<h2>教室管理</h2>
	<b>选择校区：</b>
	<select name="scr_campus" id="scr_campus">
		<option value="请选择校区">请选择校区</option>
		<c:forEach var="campus" items="${selectCampus}">
			<option value="${campus.id}">${campus.scr_name}</option>
		</c:forEach>
	</select>
	&nbsp;&nbsp;
	<b>教室类型：</b>
	<select name="classType" id="classType">
		<option value="请选择教室类型">请选择教室类型</option>
		<option value="2">实训教室</option>
		<option value="3">多媒体教室</option>
		<option value="4">普通教室</option>
	</select>
	&nbsp;&nbsp;
	<input type="button" value="查询" onclick="getTeaCourse()" />
	&nbsp;&nbsp;
	<input type="button" value="添加校区"
		onclick="location.href='schooladmin/schoolClassroomAdd.do'" />
	&nbsp;&nbsp;
	<input type="button" value="添加教室"
		onclick="location.href='schooladmin/classroomAdd.do'" />
	&nbsp;&nbsp;
	<input type="button" value="导入教室" onclick="importClass()" />
	&nbsp;&nbsp;
	<table id="courseTab" name="courseTab" border="1" width="1300"
		style="overflow-x:hidden;overflow-y:hidden;" class="sjjx-table"
		cellspacing="0" cellpadding="0">
		<tr id="tableHeader">
			<th width="100">教室编号</th>
			<th width="100">教室名称</th>
			<th width="100">负责人</th>
			<th width="180">配套描述</th>
			<th width="100">备注</th>
			<th width="80">可容纳人数</th>
			<th width="180">负责人所属部门</th>
			<th width="40">状态</th>
			<th width="60">操作</th>
		</tr>
	</table>
</body>
</html>
