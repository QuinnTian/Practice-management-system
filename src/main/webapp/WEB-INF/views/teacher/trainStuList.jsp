<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.entity.GraduationThesis"%>
<%@ page import="com.sict.dao.*"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ page import="org.springframework.web.context.*"%>
<%@ page import="org.springframework.web.context.support.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>实训作品学生列表</title>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript">
	//审阅该同学的论文
	function doSee(id) {
			window.location.href = "getCheckThesisList.do?stu_id=" + id;
	}
	$(function() {
		var task_type = $("#task_type").val();
		if (task_type == "1") {
			$("h2").text("论文学生列表");
		}else{
			$("h2").text("实训作品学生列表");
		}
		var state = $("#state").val();
		if(state =="已完结"){
			$("checkThesis_but").attr({value: "查看" });
		} 
	});

	//年级改变，根据年级得到这个年级这个老师的实习、实训任务
	function changeGrade() {
		$.ajax({
			type : "get",
			url : "ajaxThesisGradechange.do?", 
			data : getGradeData(),        
			dataType : "text",              
			success : function(data) {				
				showPractice(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert(status);
				}
			}
		});
	}
	function getGradeData() {
		var grade = $("#grade").val();
		var dataSend = "grade=" + grade;
		return dataSend;
	}
	function showPractice(ajaxData) {
		$("#praticeTaskId").html(ajaxData);
	};

	//根据实习任务id得到这个任务的学生
	function ajaxGetStuByPraAndGrade() {
		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "ajaxTrainStuListByPraId.do?",
			data : getSendData(),
			dataType : "text",
			success : function(data) {
				console.log("ajax返回成功");
				showStus(data);
			},
			error : function(result, status) {
				if (status == 'error') {
					alert(status);
				}
			}
		});
	}
	function getSendData() {
		var praticeTaskId = $("#praticeTaskId").val();
		var grade = $("#grade").val();
		var dataSend = "trainPraIdAndGrade=" + praticeTaskId+"-"+grade;
		return dataSend;
	}
	function showStus(ajaxData) {
		$("table[id='stuTab'] tr[id!='biaotou']").remove();
		$("#biaotou").after(ajaxData);
	}
</script>
</head>
<body>
	<h2></h2>
	<p><b>条件查询：</b>
	<c:set var="train_grade" value="${train_grade}" scope="request"></c:set>
	<% String train_grade=(String)request.getAttribute("train_grade"); %>
	<select name="grade" id="grade" id="selector" onChange="changeGrade()">
	  <option value="入学年份" <%="入学年份".equals(train_grade) ? "selected" : ""%>>入学年份</option>
      <option value="2012" <%="2012".equals(train_grade)?"selected":"" %>>2012</option>
      <option value="2013" <%="2013".equals(train_grade)?"selected":"" %>>2013</option>
      <option value="2014" <%="2014".equals(train_grade)?"selected":"" %>>2014</option>
      <option value="2015" <%="2015".equals(train_grade)?"selected":"" %>>2015</option>
	</select>
	&nbsp;&nbsp;
	<c:set var="defaultTask_name" value="${defaultTask_name}" scope="request"></c:set>
		<%
			String defaultTask_name = (String) request.getAttribute("defaultTask_name");
		%>
	<select name="praticeTaskId" id="praticeTaskId" style="width:250px">
	<option value="请选择任务" <%="请选择任务".equals(defaultTask_name) ? "selected" : ""%>>请选择任务</option>
	<c:forEach var="train_tasklist" items="${train_tasklist}" varStatus="stauts">
				<option value="${train_tasklist.id}" <c:if test="${train_tasklist.task_name==defaultTask_name}"> selected</c:if>>
					${train_tasklist.task_name}</option>
	</c:forEach>
    </select> 
	<input type="button" value="查询" id="seacher" onclick="ajaxGetStuByPraAndGrade();"/>
	</p>
	<input type="hidden" value="${Task_type}" id="task_type" name="task_type" />
	<table border="1" width="1000" id="stuTab" class="sjjx-table" cellspacing="0" cellpadding="0">
	<tr id="biaotou">
		<th>班级</th>
		<th>学号</th>
		<th>姓名</th>
		<th>联系电话</th>
		<th>提交状态</th><!-- 有未审核和已全部审核 -->
		<th>最后提交时间</th>
		<th>审阅</th>
	</tr>
	<c:forEach var="s" items="${members}" varStatus="stauts">
			<c:set
				var="stu_id" value="${s.getUser_id()}" scope="request">
			</c:set>
			<c:set  
				var="train_praTaskId" value="${train_praTaskId}" scope="request">
			</c:set> 
				<%
					String stu_id = (String) request.getAttribute("stu_id");
					String train_praTaskId = (String) request.getAttribute("train_praTaskId");
	 			%> 
			<tr>
				<td><%
	 				out.println(DictionaryService.findOrg(DictionaryService.findStudent(stu_id).getClass_id()).getOrg_name());
	 			%></td>
				<td><%
	 				out.println(DictionaryService.findStudent(stu_id).getStu_code());
	 			%></td>
				<td><%
	 				out.println(DictionaryService.findStudent(stu_id).getTrue_name());
	 			%></td>
				<td><%
	 				out.println(DictionaryService.findStudent(stu_id).getPhone());
	 			%></td>
	 			
	 			<% 	 
	 			ServletContext servletContext = request.getSession().getServletContext();
				WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(servletContext);
	 			GraduationThesisDao gtdao=(GraduationThesisDao)wac.getBean("graduationThesisDao");
	 			GraduationThesis newTrain=gtdao.getNewTrainByStuAndPraId(stu_id, train_praTaskId);
	 			String prog="";
				if(newTrain!=null){
					prog=newTrain.getReview_time();
					if(prog!=null){
						out.println("<td>无需要审核</td>");
						out.println("<td>"+newTrain.getCreate_time()+"</td>");
					}else{
					 	out.println("<td><span><font color='red'>新提交</font></span></td>");
					 	out.println("<td>"+newTrain.getCreate_time()+"</td>");
					}
				}else{
						out.println("<td>未提交</td>");
						out.println("<td>未提交</td>");
				}
				%>
				<td id="check_but">
				 <c:if test="${Task_type=='2'}">
					<input type="button" value="审阅实训作品" id="checkThesis_but" onclick="doSee('${s.getUser_id()}');">
				 </c:if>
				</td>
			</tr>
	</c:forEach> 
	</table>
</body>
</html>
