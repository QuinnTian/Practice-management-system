<%@ page language="java" import="java.util.*" pageEncoding="utf-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <!-- <script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script> -->
	<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
    <title>领导-实训安排</title>
<script>
	function exportExcel() {
		window.document.trainReportForm.action = "doGetTrainDetailReportExcel.do";
		window.document.trainReportForm.submit();
	}
	function generationPdf() {
		window.document.trainReportForm.action = "doGetTrainDetailReport.do";
		window.document.trainReportForm.submit();
	}
</script>
  </head>
  <body>
    <form method="post"  id="trainReportForm" name="trainReportForm"
		target=_blank>
		<h2>实训安排报表</h2>
		   选择年份：
		<select name="year" id="year">
	      <option value="2013-2014">2013-2014</option>
	      <option value="2014-2015">2014-2015</option>
	      <option value="2015-2016">2015-2016</option>
	    </select>
	   	选择学期： <select name="term" id="term">
			<option value="1">1</option>
			<option value="2">2</option>
		</select> 
		选择院系：
		<select name="org_id" id="org_id">
			<c:forEach var="orgList" items="${orgList}" varStatus="stauts">
				<option value="${orgList.id}">${orgList.org_name}</option>
			</c:forEach>
		</select> 
		<input type="button" value="生成报表" onclick="generationPdf()">
		<input type="button" value="导出excel" onclick="exportExcel()">
    </form>
  </body>
</html>