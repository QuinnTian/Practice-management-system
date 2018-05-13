<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen"
		type="text/css" />
	<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<title>指导记录列表</title>
<script type="text/javascript">
	//ajax 获取系级别的老师
	function ajaxTeacher() {// 向服务器发送搜索请求

		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "ajaxPk_teacher.do?",
			data : getXiData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法

				showTeachers(data);

			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {

				}
			}
		});
	}
	function showTeachers(ajaxData) {
		console.log(ajaxData);
		$("#teacher").html(ajaxData);

	}
	function getXiData() {
		var val = $("#xibu").val();
		var dataSend = "xibu=" + val;
		return dataSend;
	}
</script>

<script type="text/javascript">
	function ajaxTeasDieRecs() {
		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "ajaxTeasDieRecs.do?",
			data : getTeaData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法

				showTeasDieRecs(data);

			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {

				}
			}
		});
		
		function getTeaData() {
		var val = $("#teacher").val();
		var dataSend = "tea_id=" + val;
		return dataSend;
	}
		
		function showTeasDieRecs(ajaxData) {
		console.log(ajaxData);
		/* $("#teacher").html(ajaxData); */
		$("table[id='table'] tr[id!='tr']").remove();
		$("#tr").after(ajaxData);
	}
		
		
	}
</script>


</head>
<body>
	<h2 align="left">教师指导记录管理</h2>
	选择条件：院系
	<select id="xibu" name="xibu" onchange="ajaxTeacher()">
		<option value="0">请选择</option>
		<c:forEach var="org" items="${org}">
			<option value="${org.id }">${org.org_name }</option>
		</c:forEach>
	</select> 教师
	<select id="teacher" name="teacher" >
		<option value="0">请选择</option>
	</select>
	<input type="button"  value="查询" onclick="ajaxTeasDieRecs()"> 
	<table id="table" border="1" width="1000" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="tr">
			<td width="115">实习任务</td>
			<td width="115">标题</td>
			<td width="80">指导时间</td>
			<td width="100">指导地点</td>
			<td width="120">指导组织</td>
			<td width="250">指导学生</td>
			<td width="170">文字描述</td>
		</tr>

		</table>

</body>
</html>
