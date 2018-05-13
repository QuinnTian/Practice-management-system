<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>实训作品列表</title>
<style type="text/css">
	h2{
	    width:100%; 
	    height:20px;
	    text-align:left;
	}
   </style>
   <link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript">
	
	function doSee(id) {
			window.location.href = "checkThesisedit.do?id=" + id;
	}
	function doBack() {
		//window.history.go(-1);
		window.location.href = "backTrainList.do";
	}
	
	
	
	
	
</script>
</head>
<body>
	<c:set
			var="praTask_id" value="${praTask_id}" scope="request">
	</c:set> 
			<%
				String practice_id = (String) request.getAttribute("praTask_id");
 			%> 
 	<c:set
			var="Thesis_stu_id" value="${Thesis_stu_id}" scope="request">
	</c:set> 
			<%
				String Thesis_stu_id = (String) request.getAttribute("Thesis_stu_id");
 			%> 
	<h2><%
 			out.println(DictionaryService.findStudent(Thesis_stu_id).getTrue_name());
 		%>实训作品</h2>
	<p>实习名称：<%
 				out.println(DictionaryService.findPracticeTask(practice_id).getTask_name());
 			%></p>
 	<input type="hidden" name="check_state" id="check_state" value="${check_state}">
	<table border="1" width="1300" id="praTable" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="80">作品标题</th>
			<th width="120">上传时间</th>
			<th width="120">审阅时间</th>
			<th width="100">评分</th>
			<!-- <th width="80">进度</th> -->
			<!-- <th width="50">分数</th> -->
			<th width="100">教师评语</th>
			<th width="120">作品描述</th>
			<th width="80">操作</th>
		</tr>

		<c:forEach var="s" items="${trainList}" varStatus="stauts">
			<tr>
				<td>${s.thesis_name}</td>
				<td><fmt:parseDate value="${s.create_time}" var="create_time" />
					<fmt:formatDate value="${create_time}" pattern="yyyy/MM/dd" />
				</td>
				<td><fmt:parseDate value="${s.review_time}" var="review_time" />
					<fmt:formatDate value="${review_time}" pattern="yyyy/MM/dd" />
				</td>
				<td>${s.score}</td>
				<%-- <td>${s.progress}</td> --%>
				<td>${s.comment}</td>
				<td>${s.thesis_desc}</td>
				<td>
					<c:if test="${s.review_time==null}">
				  <button type="button" id="check_but" onclick="doSee('${s.id}');">审阅</button>
				 </c:if>
				 <c:if test="${s.review_time!=null}">
				      已审阅
				 </c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
	<input type="button" value="返回" onclick="doBack();"> 
</body>
</html>