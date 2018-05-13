<%@ page language="java" import="java.util.*" pageEncoding="utf-8" errorPage="errorPage.jsp"%>
<%@ page import="com.sict.service.DictionaryService" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>教师实训安排报表</title>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
    <script>
	/* function exportExcel() {
		window.document.trainReportForm.action = "doGetTrainDetailReportExcel.do";
		window.document.trainReportForm.submit();
	} */
	function generationPdf() {
		window.document.trainReportForm.action = "doGetTrainDetailReport.do";
		window.document.trainReportForm.submit();
	}
	
	function getTrainDetail() {
			$.ajax({
				type : "get",
				url : "getTrainDetail.do?",
				data : getSendData(), //设置发送参数，即使参数为空，也需要设置                
				dataType : "text",                
				success : function(data) { //成功时执行的方法					
					showTrain(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
		}
	
		function getSendData() {
				var year = $("#year").val();	
				var term = $("#term").val();	
				var dataSend = "yearAndterm=" + year+"="+term;		
				return dataSend;
			}
		function showTrain(ajaxData) {
			$("#table").html(ajaxData);
			};
	
</script>
</head>
  <body>
  <h2>实训安排报表</h2>
    <form method="post" id="trainReportForm" name="trainReportForm" target=_blank>
	    选择年份：
	    <select name="year" id="year">
	      <option value="2014-2015">2014-2015</option>
	      <option value="2015-2016">2015-2016</option>
	    </select>
	    选择学期：
	    <select name="term" id="term">
	      <option value="1">1</option>
	      <option value="2">2</option>
	    </select>
	    <input type="button" value="查看安排" onclick="getTrainDetail()">
    	<input type="button" value="生成报表" onclick="generationPdf()">
		<!-- <input type="button" value="导出excel" onclick="exportExcel()"> -->
		<table border="1" width="1200" id="table" style="overflow-x:hidden;overflow-y:hidden;" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="250">任务名称</th>
			<th width="200">小组名称</th>
			<th width="100">课程名称</th>
			<!-- <th width="60">教师</th> -->
			<th width="120">实训时间</th>
			<th width="150">实训地点</th>
			<th width="50">周次</th>
			<th width="100">节次</th>
			<!-- <th width="50">修改</th> -->
			<!-- <th width="50">操作</th> -->
		</tr>	
	 	<c:forEach var="t" items="${lists}" varStatus="stauts">
	 	<c:set var="task_id" value="${t.task_id}" scope="request"></c:set>
	 	<c:set var="group_id" value="${t.group_id}" scope="request"></c:set>
	 	<c:set var="course_id" value="${t.course_id}" scope="request"></c:set>
	 	<c:set var="tea_id" value="${t.tea_id}" scope="request"></c:set>
			<tr>
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
			<%-- 	<td align="center">
				<%
					 out.println(DictionaryService.findTeacher(tea_id).getTrue_name());
				 %>
				</td> --%>
                <td align="center"><fmt:parseDate value="${t.train_time}" var="train_time"/><fmt:formatDate value="${train_time}" pattern="yyyy/MM/dd"/></td>
				<td align="center">${t.train_place}</td>	
				<td align="center">${t.week_num}</td>
				<td align="center">${t.class_num}</td>
				<%-- <td align="center"><input type="button" value="修改" onclick="doEdit('${t.id}')"/></td> --%>
				<%-- <td align="center"><input type="button" value="删除" onclick="doDel('${t.id}')"/></td> --%>
			</tr>
		</c:forEach> 
	</table>
		
    </form>
  </body>
</html>