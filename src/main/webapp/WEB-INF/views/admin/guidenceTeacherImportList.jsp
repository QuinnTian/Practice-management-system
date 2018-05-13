<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>导入实习指导老师表</title>
	<script type="text/javascript">
	
	    //添加
		function add(){
		  window.location.href="addGuidenceTeacher.do";
		}
		
		//删除
		function doDel(id){
		  if(window.confirm("确定删除此教师?")){
           window.location.href="deleteGuidenceTeacher.do?id="+id;
		  }
		}
	</script>
</head>
<body>
	<h2 align='center'>导入实习指导老师表</h2>
	<table border="1" width="1000">
		<tr>
			<td width="150">实习编号</td>
			<td width="550">实习任务</td>
			<td width="150">学号</td>
			<td width="150">姓名</td>
			<td width="150">开始时间</td>
			<td width="150">截止时间</td>
			<td width="150">班级编号</td>
			<td width="150">班级名称</td>
			<td width="150">教师编号</td>
			<td width="150">指导教师</td>
			<td width="150">操作</td>
		</tr>	
		<c:forEach var="t" items="${lists}" varStatus="stauts">
			<tr>
				<td>${t.practice_code}</td>
				<td>${t.practice_name}</td>			
				<td><a href="editGuidenceTeacher.do?id=${t.id}">${t.stu_code}</a></td>
				<td><%=application.getAttribute("s") %>${applicationScope.s }"</td>
				<td><fmt:parseDate value="${t.begin_time}" var="begin_time"/><fmt:formatDate value="${begin_time}" pattern="yyyy/MM/dd"/></td>
				<td><fmt:parseDate value="${t.end_time}" var="end_time"/><fmt:formatDate value="${end_time}" pattern="yyyy/MM/dd"/></td>
                <td>${t.class_code}</td>
				<td>${t.class_name}</td>	
				<td>${t.tea_code}</td>
				<td>${t.tea_name}</td>	
				<td><a href="deleteGuidenceTeacher.do?id=${t.id}">删除</a></td>
			</tr>
		</c:forEach>
	</table>
	<div style="margin-top:10px;margin-left:100px;">
		<input type="button" onclick="javascript:add();" value="导入Excel"/>
	</div>
</body>
</html>
