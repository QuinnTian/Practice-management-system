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
<title>毕业论文同学列表</title>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript">
	//审阅该同学的论文
	function doSee(id) {
			/* var task_type = $("#task_type").val();
			if(task_type=="1"){ */
			window.location.href = "getCheckThesisList.do?stu_id=" + id;
			/* }else{
			window.location.href = "getCheckThesisList.do?stu_id=" + id;
			} */
	}
	$(function() {
		var task_type = $("#task_type").val();
		if (task_type == "1") {
			$("h2").text("论文学生列表");
		}else{
			$("h2").text("实训作品学生列表");
			
		}
		/* var state = $("#state").val();
		if(state =="已完结"){
			$("checkThesis_but").attr({value: "查看" });
		}  */
		/* if(state =="新提交"){
		alert("1");
			state.css("color","red");
		} */
	});

	//年级改变，根据年级得到这个年级这个老师的实习任务
	function changeGrade() {
		$.ajax({
			type : "get",
			url : "ajaxThesisGradechange.do?", 
			data : getGradeData(),                
			dataType : "text",                
			success : function(data) {				
				showPractice(data);
			},
			error : function(result, status) { 
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
	function ajaxGroupId() {
		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "ajaxThesisStuListByPraId.do?",
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
		var dataSend = "praticeTaskId=" + praticeTaskId+"-"+grade;
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
	<c:set var="thesis_grade" value="${thesis_grade}" scope="request"></c:set>
	<% String thesis_grade=(String)request.getAttribute("thesis_grade"); %>
	<select name="grade" id="grade" id="selector" onChange="changeGrade()">
	  <option value="入学年份" <%="入学年份".equals(thesis_grade) ? "selected" : ""%>>入学年份</option>
      <option value="2012" <%="2012".equals(thesis_grade)?"selected":"" %>>2012</option>
      <option value="2013" <%="2013".equals(thesis_grade)?"selected":"" %>>2013</option>
      <option value="2014" <%="2014".equals(thesis_grade)?"selected":"" %>>2014</option>
      <option value="2015" <%="2015".equals(thesis_grade)?"selected":"" %>>2015</option>
	</select>
	&nbsp;&nbsp;
	<c:set var="thesis_taskname" value="${thesis_taskname}" scope="request"></c:set>
		<%
			String thesis_taskname = (String) request.getAttribute("thesis_taskname");
		%>
	<select name="praticeTaskId" id="praticeTaskId" style="width:280px">
		<option value="请选择任务" <%="请选择任务".equals(thesis_taskname) ? "selected" : ""%>>请选择任务</option>
		<c:forEach var="thesis_practicetaskList" items="${thesis_practicetaskList}" varStatus="stauts">
				<option value="${thesis_practicetaskList.id}" <c:if test="${thesis_practicetaskList.task_name==thesis_taskname}"> selected</c:if>>
					${thesis_practicetaskList.task_name}</option>
		</c:forEach>
    </select> 
	<input type="button" value="查询" id="seacher" onclick="ajaxGroupId();"/>
	</p>
	<input type="hidden" value="${Task_type}" id="task_type" name="task_type" />
	<table border="1" width="1000" id="stuTab" class="sjjx-table" cellspacing="0" cellpadding="0">
	<tr id="biaotou">
		<th>班级</th>
		<th>学号</th>
		<th>姓名</th>
		<th>联系电话</th>
		<th>提交情况</th>
		<th>论文成绩</th>
		<th>审阅</th>
	</tr>
	
	<c:forEach var="s" items="${student}" varStatus="stauts">
			<c:set
				var="stu_id" value="${s.id}" scope="request">
			</c:set>
			<c:set  
				var="thesis_praTaskId" value="${thesis_praTaskId}" scope="request">
			</c:set> 
				<%
					String stu_id = (String) request.getAttribute("stu_id");
					String thesis_praTaskId = (String) request.getAttribute("thesis_praTaskId");
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
	 			GraduationThesis max_version=gtdao.getMaxVersionByStuAndPraId(stu_id, thesis_praTaskId);
	 			String prog="";
	 			String score="";
				if(max_version!=null){
					prog=max_version.getProgress();
					score=max_version.getScore();
				}
				if(prog.equalsIgnoreCase("初次提交")){
					 out.println("<td><span><font color='red'>新提交</font></span></td>");
					  out.println("<td>"+score+"</td>");
				}else if(prog.equalsIgnoreCase("新提交")){
					 out.println("<td><span><font color='red'>新提交</font></span></td>");
					  out.println("<td>"+score+"</td>");
				}else if(prog.equalsIgnoreCase("论文定稿")){
					 out.println("<td>已完结</td>");
					  out.println("<td>"+score+"</td>");
				}else if(prog.equalsIgnoreCase("继续修改")){
					 out.println("<td>修改中</td>");
					  out.println("<td>"+score+"</td>");
				}else{
					 out.println("<td>未提交</td>");
					  out.println("<td>"+score+"</td>");
				}
				%>
				<td id="check_but">
				 <c:if test="${Task_type=='1'}">
				 <input type="button" value="审阅论文" id="checkThesis_but" onclick="doSee('${stu_id}');">
				 </c:if>
				</td>
			</tr>
	</c:forEach> 
	
	</table>
</body>
</html>
