<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>查看校外实习学生</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>

<style>
label.error {
	color: red;
	font-size: 16px;
	font-weight: normal;
	line-height: 1.4;
	margin-top: 0.5em;
	width: 100%;
	height: 100%;
	float: none;
}

@media screen and (orientation: portrait) {
	label.error {
		margin-left: 0;
		display: block;
	}
}

@media screen and (orientation: landscape) {
	label.error {
		display: inline-block;
		margin-left: 22%;
	}
}

em {
	color: red;
	font-weight: bold;
	padding-right: .25em;
}
</style>

<script>
	//ajax 获取学生
	function getStudents() {
		$.ajax({
			type : "get",
			url : "ajaxGetStudents.do?",
			data : getPk_id(), //设置发送参数，即使参数为空，也需要设置     
			dataType : "text", //返回的类型为json  
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			scriptCharset : "utf-8",
			success : function(data) { //成功时执行的方法		

				setStudents(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert(status);
				}
			}
		});

	}
	function setStudents(ajaxData) {//根据返回数据显示搜索结果
		$("#studentslist").find("li").remove();
		var studentslist = document.getElementById("studentslist");
		$("#studentslist").html(ajaxData);
	};
	function getPk_id() {
		var practiceTask_id = $("#practiceTask").val();
		var dataSend = "practiceTask_id=" + practiceTask_id;
		return dataSend;
	}
</script>

</head>
<body onload="is_weixin()">
	<div data-role="page">
		<form method="post" action="demoform.asp">
			<fieldset data-role="fieldcontain">
				<h4>选择校外实习任务</h4>
				<select name="practiceTask" id="practiceTask"
					onchange="getStudents()">
					<option value="1">请选择</option>
					<c:forEach var="outSchollPracticeTask"
						items="${outSchollPracticeTask}" varStatus="stauts">
						<option value="${outSchollPracticeTask.id}">${outSchollPracticeTask.task_name}</option>
					</c:forEach>
				</select>
				<div data-role="content" >
					<ol data-role="listview" id="studentslist" data-autodividers="true" data-inset="true">
					
					</ol>
				</div>

			</fieldset>
		</form>
	</div>
</body>
</html>




