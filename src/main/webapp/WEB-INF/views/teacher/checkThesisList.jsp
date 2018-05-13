<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>论文列表</title>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript">
	$(function() {
		var check_state = $("#check_state").val();
		/* if (check_state =="论文定稿") {
			$("#check_but").remove();
			//$("#check_but").text("已定稿");
			// $("#check").empty();
			$("#check").text("已定稿"); 
		} */
	});
	function doSee(id) {
		var check_state = $("#check_state").val();
		if(check_state =="新提交"||check_state =="初次提交"){
			window.location.href = "checkThesisedit.do?id=" + id;
		}else{
			alert("最新版本的论文已经审阅，此版论文无须审阅！");
		}
	}
	function doBack() {
		window.location.href = "backThesisList.do";
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
 		%>毕业论文</h2>
	<p>实习名称：<%
 				out.println(DictionaryService.findPracticeTask(practice_id).getTask_name());
 			%></p>
 	<input type="hidden" name="check_state" id="check_state" value="${check_state}">
	<table border="1" width="1300" id="praTable" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou"> 
			<th width="100">论文标题</th>
			<th width="100">版本号</th>
			<th width="100">上传时间</th>
			<th width="100">审阅时间</th>
			<th width="80">审阅进度</th>
			<th width="100">教师评语</th>
			<th width="80">分数</th>
			<th width="100">论文描述</th>
			<th width="50">操作</th>
		</tr>
			<c:forEach var="s" items="${thesis_list}" varStatus="stauts">
				<tr>
				<td><a href="downloadFile.do?file_id=${s.file_id}">${s.thesis_name}</a></td> 
				<!-- <a href="downloadFile.do?file_id="+${s.file_id}></a> -->
				<td>第${s.version}版本</td>
				<td><fmt:parseDate value="${s.create_time}" var="create_time" />
					<fmt:formatDate value="${create_time}" pattern="yyyy/MM/dd" /></td>
				<td><fmt:parseDate value="${s.review_time}" var="review_time" />
					<fmt:formatDate value="${review_time}" pattern="yyyy/MM/dd" /></td>
				<td>${s.progress}</td>
				<td>
				<%-- <c:if test="${s.comment==''}">
				 <input type="button" value="审阅论文" id="checkThesis_but" onclick="doSee('${stu_id}');">
				</c:if> --%>
				${s.comment}
				</td>
				<td>${s.score}
				</td>
				<td>${s.thesis_desc}</td>
				<td id="check">
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
