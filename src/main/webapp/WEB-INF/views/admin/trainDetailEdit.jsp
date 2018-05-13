<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.1.min.js"
	type="text/javascript"></script>
<script language="javascript" type="text/javascript"
	src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
<title>修改实训安排</title>
<style type="text/css">
    h2 {
	   width: 100%;
	   height: 20px;
	   text-align: left;
        }
    </style>
    <script type="text/javascript">
     function doAdd(){
	 		if($("#new_time").val()==""){
		 		alert("时间不能为空");
		 		return null;
		 	}else if($("#train_place").val()==""){
		 		alert("地点不能为空");
		 		return null;
		 	}else if($("#week_num").val()==""){
		 		alert("周次不能为空");
		 		return null;
		 	}else if($("#week_num").val()==""){
		 		alert("周次不能为空");
		 		return null;
		 	}else if(isNaN($("#week_num").val())==true){
	 			alert("周次只能为数字");
			 }else if($("#class_num").val()==""){
		 		alert("节次不能为空");
		 		return null;
		 	}else{
		 		document.Form2.submit();
		 	
		 	}
		 	}
    </script>
</head>
<body>
	<form name="Form2" action="doEditTrainDetail.do" method="post"
		enctype="multipart/form-data">

		<input type="hidden" name="id" value="${td.id}">
		<h2>修改实训安排</h2><br>
	<table border="1" width="450">
			<tr>
				<td width="100">任务：</td>
				<td width="350">
					<c:set var="task_id" value="${td.task_id}" scope="request"></c:set>
					<c:set var="course_id" value="${td.course_id}" scope="request"></c:set>
					<c:set var="tea_id" value="${td.tea_id}" scope="request"></c:set>
					<%-- <input type="text" name="task_id"
					value="<% 
					String task_id=(String)request.getAttribute("task_id");
					out.print(DictionaryService.findPracticeTask(task_id).getTask_name()); %>" style="width:100%;"> --%>
					<% 
					String task_id=(String)request.getAttribute("task_id");
					if(DictionaryService.findPracticeTask(task_id).getTask_name() !=null){
					out.print(DictionaryService.findPracticeTask(task_id).getTask_name()); 
					}
					%>
				</td>
			</tr>
			<%-- <tr>
				<td width="100">班级：</td>
				<td width="350"><input type="text" name="org_id"
					value="${td.org_id}" style="width:100%;">
				</td>
			</tr> --%>
			<tr>
				<td width="100">课程：</td>
				<td width="350"><% 
					String course_id=(String)request.getAttribute("course_id");
					if(DictionaryService.findCourses(course_id) !=null){
						out.print(DictionaryService.findCourses(course_id).getCourse_name()); 
					}
					%>
				</td>
			</tr>
			
			<tr>
				<td width="100">教工姓名：</td>
				<td width="350"><% 
					String tea_id=(String)request.getAttribute("tea_id");
					if(DictionaryService.findTeacher(tea_id).getTrue_name() !=null){
					out.print(DictionaryService.findTeacher(tea_id).getTrue_name());
					} %>
				</td>
			</tr>
			
			<tr>
				<td width="100">实训时间：</td>
				<td width="350"><input type="text" name="new_time" id="new_time"
					value="${td.train_time}" style="width:100%;" onClick="WdatePicker()">
				</td>
			</tr>
				
			<tr>
				<td width="100">实训地点：</td>
				<td width="350"><input type="text" name="train_place" id="train_place"
					 value="${td.train_place}" style="width:100%;">
				</td>
			</tr>
				<tr>
				<td width="100">周次：</td>
				<td width="350"><input type="text" name="week_num" id="week_num"
					 value="${td.week_num}" onkeyup="value=value.replace(/[^\d]/g,'')" style="width:100%;">
				</td>
			</tr>
				<tr>
				<td width="100">节次：</td>
				<td width="350">
					 <select name="class_num" id="class_num">
						<c:forEach var="class_nums" items="${class_nums}" varStatus="stauts">
						<option value="${class_nums}">${class_nums}</option>
					</c:forEach>
				</select>
				</td>
			</tr>
			
		</table>
		<div style="margin-top:20px;">
			<input type="button" value="保存" onclick="doAdd()"/>&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button"
				onclick="window.location='./trainDetailList.do'">返回</button>
		</div>
	</form>
</body>
</html>