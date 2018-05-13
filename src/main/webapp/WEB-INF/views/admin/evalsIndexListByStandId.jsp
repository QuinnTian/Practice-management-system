<%@ page language="java" import="java.util.*" pageEncoding="utf-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>评分标准指标表</title>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
    <title>评分标准表</title>
    <script type="text/javascript">
   		//删除
		function doDel(id){
		  if(window.confirm("确定删除此评分标准?")){
           window.location.href="deleteEvalsIndex.do?id="+id;
		  }
		}
	</script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
	<script type="text/javascript">
		function doEdit(id){
			window.location.href="editEvalsIndex.do?id="+id;
		
		}
	</script>
  </head>
  
  <body>
  <h2>评分标准指标表</h2><br>
   <table border="1" width="950" id="table1" style="overflow-x:hidden;overflow-y:hidden;" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr>
			<th width="200">标准名称</th>
			<th width="200">指标名称</th>
			<th width="300">描述</th>
			<th width="50">分值</th>
			<th width="150">创建时间</th>
			<th width="50">操作</th>
		</tr>
			
		<c:forEach var="e" items="${result}" varStatus="stauts">
			<tr>
				<td width="150" align="center">
				<c:set var="standard_id" value="${e.standard_id}" scope="request"></c:set>
				<% String standard_id=(String)request.getAttribute("standard_id"); %>
				<% out.println(DictionaryService.findEvaluateStandard(standard_id).getStandard_name());%>
				</td>				
				<td width="150" align="center">${e.index_name}</td>
				<td width="150" align="center">${e.description}</td>
				<td width="150" align="center">${e.score}</td>
			<td width="150" align="center"><fmt:parseDate value="${e.create_time}" var="create_time" />
					<fmt:formatDate value="${create_time}" pattern="yyyy/MM/dd" /></td>
				<td width="150" align="center">
				<input type="button" value="修改" onClick="doEdit('${e.id}');">
				<input type="button" value="删除" onClick="doDel('${e.id}');"></td>
			</tr>
		</c:forEach>
	</table>
	</body>
</html>
