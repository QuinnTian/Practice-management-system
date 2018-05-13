<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>毕业论文</title>  
<style type="text/css">
    h2 {
	   width: 100%;
	   height: 20px;
	   text-align: left;
        }
</style>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<!-- <script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script> -->
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript">

	$(function() {
		var check_state = $("#check_state").val();
		if (check_state == "论文定稿") {
			$("#edit").empty();
			$("#edit").text("论文定稿");
			/* $("#add").hide(); */
		}
	});
	//删除
	function doDel(id,score) {
		if(score=="暂无"){
			if (window.confirm("确定删除吗?")) {
				window.location.href = "deleteGraduationThesis.do?id=" + id;
			}
		}else{
			alert("您的这一版本论文已经审阅，不能删除！");
		} 
	}

	//添加
	function add() {
		var check_state = $("#check_state").val();
		if(check_state == "论文定稿"){
			alert("您的论文已经定稿，不能再添加，修改或者删除操作！");
		}else{
			window.location.href = "addGraduationThesis.do";
		}
	}
	//编辑
	function doEdit(id,score) {
		if(score=="暂无"){
			window.location.href = "editGraduationThesis.do?id=" + id;
		}else{
			alert("您的这一版本论文已经审阅，不能做修改操作！");
		} 
	}
</script>
</head>
<body>
<h2>论文列表</h2>
<br>
	<input type="hidden" name="check_state" id="check_state" value="${check_state}">
	<table border="1" width="1300" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr>
			<td width="100">实习任务</td>
			<td width="100">论文标题</td>
			<td width="50">版本</td>
			<td width="100">提交时间</td>
			<td width="100">审阅时间</td>
			<td width="100">论文成绩</td>
			<td width="100">教师评语</td>
			<td width="100">论文进展</td>
			<td width="100">论文描述</td>
			<td width="30">操作</td>
			<td width="30">操作</td>
		</tr>
		<c:forEach var="s" items="${modelList}" varStatus="stauts">
			<tr>
				<td> 
				<c:set var="practice_id" value="${s.practice_id}" scope="request"></c:set>
				<% String practice_id=(String)request.getAttribute("practice_id"); %>
				<%out.println(DictionaryService.findPracticeTask(practice_id).getTask_name()); %>
				</td>
				<td><a href="downloadFile.do?file_id=${s.file_id}">${s.thesis_name}</a></td>
				<td>第${s.version}版本</td>
				<td><fmt:parseDate value="${s.create_time}" var="create_time"/><fmt:formatDate value="${create_time}" pattern="yyyy/MM/dd"/></td>
				<c:if test="${s.review_time==null}">
				        <td>还未审阅</td>
				</c:if>
				<c:if test="${s.review_time!=null}">
				  <td><fmt:parseDate value="${s.review_time}" var="review_time"/><fmt:formatDate value="${review_time}" pattern="yyyy/MM/dd"/></td>
				</c:if>
				<td>${s.score}</td>
				<td>${s.comment}</td>
				<td>${s.progress}</td>
				<td>${s.thesis_desc}</td>
				<td id="edit">
				<input type="button" value="修改" onclick="doEdit('${s.id}','${s.score}');"></td>
				<td><input type="button" value="删除"onclick="doDel('${s.id}','${s.score}');"></td>
			</tr>
		</c:forEach>
	</table>
	<div style="margin-top:10px;margin-left:100px;">
		<input type="button" onclick="javascript:add();" id="add" value="添加论文" />
	</div>
</body>
</html>
