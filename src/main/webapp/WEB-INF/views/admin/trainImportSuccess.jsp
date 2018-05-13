<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<title>成功导入实训安排列表</title>
<style type="text/css">
    h2 {
	   width: 100%;
	   height: 20px;
	   text-align: center;
        }
    </style>

	<script type="text/javascript">
		//返回到首页
		function backList(){
			window.location.href="trainDetailList.do?type="+"1";
		}
</script>
</head>
<body>	
    <h2>成功导入实训安排列表</h2>
    <input type="button" value="返回首页" onclick="backList()">
	<table border="1" width="1200" id="table" style="overflow-x:hidden;overflow-y:hidden;" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="40">序号</th>
			<th width="250">任务名称</th>
			<th width="200">小组名称</th>
			<th width="100">课程名称</th>
			<th width="60">教师</th>
			<th width="120">实训时间</th>
			<th width="150">实训地点</th>
			<th width="50">周次</th>
			<th width="100">节次</th>
		</tr>	
	 	<c:forEach var="t" items="${trainImportSuccess}" varStatus="stauts">
	 	<c:set var="task_id" value="${t.task_id}" scope="request"></c:set>
	 	<c:set var="group_id" value="${t.group_id}" scope="request"></c:set>
	 	<c:set var="course_id" value="${t.course_id}" scope="request"></c:set>
	 	<c:set var="tea_id" value="${t.tea_id}" scope="request"></c:set>
			<tr>
				<td align="center">${stauts.index+1}</td>
				<td align="center">
				<% String task_id=(String)request.getAttribute("task_id");
				   String group_id=(String)request.getAttribute("group_id");
				   String course_id=(String)request.getAttribute("course_id");
				   String tea_id=(String)request.getAttribute("tea_id");
				   out.println(DictionaryService.findPracticeTask(task_id).getTask_name()); 
				%>
				</td>
				<td align="center">
				<%
					 out.println(DictionaryService.findGroups(group_id).getGroup_name());
				 %>
				</td>			
				<td align="center">
				<%
					 out.println(DictionaryService.findCourses(course_id).getCourse_name());
				 %>
				 </td>
				<td align="center">
				<%
					 out.println(DictionaryService.findTeacher(tea_id).getTrue_name());
				 %>
				</td>
                <td align="center"><fmt:parseDate value="${t.train_time}" var="train_time"/><fmt:formatDate value="${train_time}" pattern="yyyy/MM/dd"/></td>
				<td align="center">${t.train_place}</td>	
				<td align="center">${t.week_num}</td>
				<td align="center">${t.class_num}</td>
			</tr>
		</c:forEach> 
	</table>
</body>
</html>
