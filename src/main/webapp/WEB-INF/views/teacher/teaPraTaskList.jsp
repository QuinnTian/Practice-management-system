<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>教师实习 实训任务列表</title>
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css"
	media="screen" type="text/css" />
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript">
	//设置h2和按钮的value值
	$(function() {
		var type = $("#task_type").val();
		if (type == "1") {
			$("h1").text("实习任务列表");
		} else {
			$("h1").text("实训任务列表");
		}
	});

	//根据年级ajax得到实践任务
	function ajaxGetPraTask() {
		$.ajax({
			type : "get",
			url : "ajaxGetPraTask.do?",
			data : getSendData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text",
			success : function(data) { //成功时执行的方法					
				showPractice(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert(status);
				}
			}
		});
	}
	function getSendData() {
		var grade = $("#grade").val();
		var dataSend = "grade=" + grade;
		return dataSend;
	}

	function showPractice(ajaxData) {
		$("table[id='praTable'] tr[id!='biaotou']").remove();
		$("#biaotou").after(ajaxData);
	};
</script>
</head>
<body>
	<h1 id="title"></h1>
	<p>
		<b>条件查询：</b>
		<c:set var="task_grade" value="${task_grade}" scope="request"></c:set>
		<%
			String task_grade = (String) request.getAttribute("task_grade");
		%>
		入学年份 <select name="grade" id="grade" id="selector">
			<option value="2012" <%="2012".equals(task_grade) ? "selected" : ""%>>2012</option>
			<option value="2013" <%="2013".equals(task_grade) ? "selected" : ""%>>2013</option>
			<option value="2014" <%="2014".equals(task_grade) ? "selected" : ""%>>2014</option>
			<%-- <option value="2015" <%="2015".equals(task_grade) ? "selected" : ""%>>2015</option> --%>
		</select> <input type="button" value="查询" id="seacher"
			onclick="ajaxGetPraTask();" />
	</p>
	<input type="hidden" name="task_type" id="task_type" value="${task_type}">
	<table border="1" width="1300" id="praTable" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<!-- <th width="150">任务编码</th> -->
			<th width="300">任务名称</th>
			<th width="100">创建时间</th>
			<th width="100">开始时间</th>
			<th width="100">结束时间</th>
			<th width="300">任务描述</th>
			<th width="100">任务地点</th>
			<th width="100">文件下载</th>
			<th width="100">操作</th>
		</tr>
		<c:forEach var="p" items="${praTask_List}" varStatus="stauts">
			<tr>
				<%-- <td>${p.practice_code}</td> --%>
				<td align="left">${p.task_name}</td>
			
				<td><fmt:parseDate value="${p.create_time}" var="create_time" /> <fmt:formatDate
						value="${create_time}" pattern="yyyy/MM/dd" />
				</td>
				<td><fmt:parseDate value="${p.begin_time}" var="begin_time" />
					<fmt:formatDate value="${begin_time}" pattern="yyyy/MM/dd" />
				</td>
				<td><fmt:parseDate value="${p.end_time}" var="end_time" /> <fmt:formatDate
						value="${end_time}" pattern="yyyy/MM/dd" />
				</td>
				<td>${p.task_desc}</td>
				<td>${p.task_place}</td>
				<td><c:if test="${p.file_id==null}">
				    没有文件
				</c:if> <c:if test="${p.file_id!=null}">
						<a href="downloadFile.do?file_id=${p.file_id}">下载</a>
					</c:if>
				</td>
				<td><a href="seeStudent.do?practice_id=${p.id}">查看学生</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
