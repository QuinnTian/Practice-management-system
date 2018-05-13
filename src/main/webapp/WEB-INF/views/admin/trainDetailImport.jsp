<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>导入实训安排</title>
	<style type="text/css">
    h2 {
	   width: 100%;
	   height: 20px;
	   text-align: left;
        }
    </style>
   <script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
	<script type="text/javascript">
	 $(function() {
		var a = 0;
   		$('#table1 tr').find('td:last').each(function() {
			//判断错误信息列的内容是否"无"
			if ($(this).text().trim() != "无") {
				a++;
			}
		});
		var rowCount = $('#table1 tr').length;
		if ((a == 1 && rowCount>2) || (a == 1 && rowCount==2)) {
		//去除灰色不可用属性
		$("#sb").removeAttr("disabled");
		}
	});
	function Check(){
		 	var s=document.form1.file.value; 
            if(s==""){
                alert("请选择一个文件");
                document.form1.file.focus();
                return;
            }else{
            	document.form1.submit();
            }
        }
    function fileChange(target, id) {
	 	var filetypes = ["xls"];
		var filepath = target.value;
		if (filepath) {
			var isnext = false;
			var fileend=(filepath.substring(filepath.lastIndexOf(".")+1,filepath.length)).toLowerCase();
			if (filetypes && filetypes.length > 0) {
				for ( var i = 0; i < filetypes.length; i++) {
					if (filetypes[i] == fileend) {
						isnext = true;
						break;
					}
				}
			}
			if (!isnext) {
				alert("暂不支持此类型,暂只接受xls格式的表格");
				target.value = "";
				return false;
			}
		} else {
			return false;
		}
		}
	</script>
</head>
<body>
 
	<form action="doGuidenceTeacherImport.do" method="post" name="form1"
		enctype="multipart/form-data">
		<input type="hidden" id="type" name="type" value="excelTrain">
		<h2>导入实训安排</h2>
		<div style="float:left">
		<table border="1" width="800">
			<tr>
				<td width="150"><input type="hidden" name="_method"
					value="post">实训安排文件(*.xls): <input type="file" name="file" onchange="fileChange(this);">
					<input type="button" value=" 提 交 " onclick="Check()">  <br>
				</td>
			</tr>
		</table>
		</div>
	</form>
	<div style="float:left">
		<form action="doSaveTeachers.do" method="post"
			enctype="multipart/form-data">
			<table border="1" width="200">
				<tr>
					<td><input type="hidden" name="fileName" value="${fileName}"> <input
							   type="hidden" name="type" value="${type}"><input
							   type="submit" value="保存到数据库" disabled="disabled" id="sb">
					</td>
					<td><input type="button" value="返回" onclick="window.location='./trainDetailList.do'"/>
					</td>
				</tr>
			</table>
		</form>
	</div>

		<table border="1" width="1320" id="table1">
			<tr>
				<td width="250" align="center"><b>实训任务</b></td>
				<td width="200" align="center"><b>分组名称</b></td>
				<td width="100" align="center"><b>课程名称</b></td>
				<td width="100" align="center"><b>教师姓名</b></td>
				<td width="120" align="center"><b>实训时间</b></td>
				<td width="100" align="center"><b>实训学期</b></td>
				<td width="50" align="center"><b>实训周次</b></td>
				<td width="100" align="center"><b>实训节次</b></td>
				<td width="150" align="center"><b>实训地点</b></td>
				<td width="150" align="center"><b>数据表问题</b></td>
			</tr>
			<c:forEach var="t" items="${tds}" varStatus="stauts">
				<c:set var="task_id" value="${t.task_id}" scope="request"></c:set>
	 	<c:set var="group_id" value="${t.group_id}" scope="request"></c:set>
	 	<c:set var="course_id" value="${t.course_id}" scope="request"></c:set>
	 	<c:set var="tea_id" value="${t.tea_id}" scope="request"></c:set>
				<tr>
					<td align="center">
					<% 
						String task_id=(String)request.getAttribute("task_id");
				   		String group_id=(String)request.getAttribute("group_id");
				   		String course_id=(String)request.getAttribute("course_id");
				  		String tea_id=(String)request.getAttribute("tea_id");
				  		if(task_id !=null){
				  		if(task_id.substring(0, 4).equals("null")){
				  			out.println("<font color='read'>"+task_id.substring(4)+"</font>");
				  		}else{
				  		out.println(DictionaryService.findPracticeTask(task_id).getTask_name()); 
				  		}
				  		}else{
				  		}
					%>
					</td>
					<td align="center">
					<%	
					if(group_id !=null){
					if(group_id.substring(0, 4).equals("null")){
							out.println("<font color='read'>"+group_id.substring(4)+"</font>");
					
					}else{
						 out.println(DictionaryService.findGroups(group_id).getGroup_name());
						 }
					}else{
					}
					 %>
					</td>
					<td align="center">
					<%	
					if(course_id !=null){
					if(course_id.substring(0, 4).equals("null")){
							out.println("<font color='read'>课程编码"+course_id.substring(4)+"有误</font>");
					
					}else{
						 out.println(DictionaryService.findCourses(course_id).getCourse_name());
						 }
					}else{
					
					}
					 %>
					</td>
					<td align="center">
					<%	
					if(tea_id !=null){
					if(tea_id.substring(0, 4).equals("null")){
							out.println("<font color='read'>教工号"+tea_id.substring(4)+"有误</font>");
					
					}else{
						 out.println(DictionaryService.findTeacher(tea_id).getTrue_name());
						 }
					}else{
					}
				 	%>
					</td>
					<td align="center"><fmt:parseDate value="${t.train_time}" var="train_time" />
						<fmt:formatDate value="${train_time}" pattern="yyyy/MM/dd" /></td>
					<td align="center">${t.train_term}</td>
					<td align="center">${t.week_num}</td>
					<td align="center">${t.class_num}</td>
					<td align="center" >${t.train_place}</td>
					<td align="center"><font color="#FF0000">${t.temp1}</font></td>

				</tr>
			</c:forEach>
		</table>
	<%-- <h3 >保存至数据库</h3>
	<form action="doSaveTeachers.do" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="fileName" value="${fileName}"> <input
			type="hidden" name="type" value="${type}"> <input
			type="submit" value="保存到数据库" disabled="disabled" id="sb">&nbsp;&nbsp;
		<input type="button" value="返回" onclick="window.location='./trainDetailList.do'"/>
	</form> --%>
</body>
</html>